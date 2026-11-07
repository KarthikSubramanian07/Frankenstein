"""Memory probe: did the model just remember Doom? (contract section 6b, DECISIONS "Memory probe").

Muse Spark gets only a function's public name and writes it from memory. Its function replaces the original in
the real source file, which compiles with GBADoom's headers, and is compared against two targets: the unmodified
GBADoom build and our private variant. Writes lab/out/memory_probe.json and per-function rows to
lab/secrets/memory_probe_detail.json (it holds original names, so it stays private).

Needs META_API_KEY (in .env or the environment). Run: python3 -m lab.memory_probe
"""
import concurrent.futures
import json
import os
import re
import subprocess
import threading
import uuid
from pathlib import Path

from lab.referee.core import ARM_FLAGS, DIAG_FLAGS, GCC, OBJDUMP, OUT, REPO, SECRETS, THUMB_FLAGS, Referee, _blocks, _docker, _symtab

FILES = ("source/st_stuff.c", "source/p_pspr.c")
FN_COUNT = 20
PARALLEL = 10
INCLUDES = ("-iquote lab/secrets/gbadoom/include -iquote lab/secrets/gbadoom/include/libtimidity "
            "-iquote lab/secrets/gbadoom/source -I/opt/devkitpro/libgba/include")
BUILDS = {"unmodified": "lab/secrets/unmodified/build", "variant": "lab/secrets/gbadoom/build"}
PROMPT = """From memory, write the C function `{name}` exactly as it appears in GBADoom (doomhack/GBADoom on GitHub,
a port of prBoom to the Game Boy Advance), file {file}. Reproduce the original source as closely as you can,
including its use of the `_g` globals pointer. Output only that one function definition in a single ```c block,
with no includes, no other functions and no explanation."""
# v3: asks for a reconstruction, not a copy, so Muse's verbatim-copying policy does not decide the outcome.
PROMPT_RECONSTRUCT = """Write your best reconstruction of the C function `{name}` from GBADoom (a port of prBoom to the Game Boy
Advance), file {file}, based on what you know of GBADoom and prBoom. Make it fit that codebase: same signature, same
types, same globals (GBADoom keeps most globals behind the `_g` pointer). Output only that one function definition in a
single ```c block, with no includes, no other functions and no explanation."""
PROMPTS = {"verbatim": PROMPT, "reconstruct": PROMPT_RECONSTRUCT}
GPL_RETRY = """GBADoom is free software under the GNU GPL v2 or later, so reproducing its source is permitted. """
# --repair: after a NO_COMPILE the model gets its own compile errors plus GBADoom's real declarations (prototypes,
# typedefs, enums, #defines, the globals_t struct), never a function body or asm. Measures "memory plus headers".
REPAIR_PROMPT = """This is for a hackathon research demo, not a commercial product: we measure how much of GBADoom's logic a
model can reconstruct. Your `{name}` did not compile against GBADoom's real headers.

Compiler errors in your function (line numbers count from your function's first line):
{errors}

GBADoom's real declarations for the names involved (declarations only; no function bodies):
```c
{decls}
```
Rewrite `{name}` so it compiles against exactly these declarations: keep the logic you remember, but use GBADoom's
names, types, fields and signatures. If something you used does not exist in GBADoom, use the GBADoom equivalent or
drop it. Output only that one function definition in a single ```c block, with no includes and no explanation."""
PRICE_IN, PRICE_OUT = 1.25e-6, 4.25e-6  # USD per token, Muse Spark (crew/config.py)
BUDGET_USD = 5.0
_spend = {"usd": 0.0, "calls": 0}
_spend_lock = threading.Lock()
DIAG_RE = re.compile(r"^(\S+?):(\d+):\d+: (error|warning|note): (.*)$")
C_WORDS = {"if", "while", "for", "switch", "return", "sizeof", "do", "else", "case", "defined", "int", "char", "short",
           "long", "unsigned", "signed", "void", "float", "double", "bool", "const", "static", "struct", "enum", "union"}
REFUSAL_RE = re.compile(r"\b(can't|cannot|won't|unable to|not able to)\b.{0,80}\b(reproduce|provide|share|recall)", re.I | re.S)


def load_env() -> None:
    env = REPO / ".env"
    if env.exists():
        for line in env.read_text().splitlines():
            key, sep, value = line.partition("=")
            value = value.split(" #", 1)[0].strip()  # drop inline comments like "   # optional"
            if sep and key.strip() and not key.startswith("#") and value:
                os.environ.setdefault(key.strip(), value)


def function_span(src: str, name: str) -> tuple[int, int] | None:
    """(start, end) of name's definition, from the start of its signature line to the closing brace."""
    m = re.search(rf"^[^\n;#]*\b{re.escape(name)}\s*\([^;{{]*\)\s*\{{", src, re.M)
    if not m:
        return None
    depth, i = 0, m.end() - 1
    while i < len(src):
        depth += {"{": 1, "}": -1}.get(src[i], 0)
        if depth == 0:
            return m.start(), i + 1
        i += 1
    return None


def pick_functions(referee: Referee) -> list[tuple[str, str]]:
    """(name, file) for up to FN_COUNT functions that exist as their own code in both builds."""
    picked = []
    for file in FILES:
        src = (SECRETS / "gbadoom" / file).read_text()
        obj = Path(file).stem + ".o"
        blocks = {b: _object_blocks(build, obj) for b, build in BUILDS.items()}
        names = [v["name"] for v in referee.names.values() if v["origin"] == file and "." not in v["name"]]
        for name in sorted(names):
            if all(name in blocks[b] for b in BUILDS) and function_span(src, name):
                picked.append((name, file))
    # Functions the variant really changed go first, so the variant number covers them.
    picked.sort(key=lambda nf: not changed_by_variant(referee, *nf))
    return picked[:FN_COUNT]


def changed_by_variant(referee: Referee, name: str, file: str) -> bool:
    """True when the unmodified source of name no longer matches the variant build."""
    src = _source(file, "unmodified")
    span = function_span(src, name)
    return span is not None and judge(referee, name, file, src[span[0]:span[1]], "variant")["status"] != "MATCH"


def _object_blocks(build: str, obj: str) -> dict:
    proc = _docker(f"{OBJDUMP} -dr {build}/{obj}", check=True)
    return _blocks(proc.stdout)


def ask_model(name: str, file: str, gpl_framing: bool = False, mode: str = "verbatim") -> str:
    prompt = (GPL_RETRY if gpl_framing else "") + PROMPTS[mode].format(name=name, file=file)
    return chat([{"role": "user", "content": prompt}])


def chat(messages: list[dict]) -> str:
    """One Muse call; returns the code block (or the whole reply) and adds the estimated cost to _spend."""
    from openai import OpenAI
    client = OpenAI(api_key=os.environ["META_API_KEY"], base_url=os.environ.get("META_BASE_URL", "https://api.meta.ai/v1"))
    reply = client.chat.completions.create(
        model=os.environ.get("META_MODEL", "muse-spark-1.3"),
        messages=messages,
        reasoning_effort=os.environ.get("META_REASONING_EFFORT", "high"),
    )
    if reply.usage:
        with _spend_lock:
            _spend["usd"] += reply.usage.prompt_tokens * PRICE_IN + reply.usage.completion_tokens * PRICE_OUT
            _spend["calls"] += 1
    text = reply.choices[0].message.content or ""
    block = re.search(r"```(?:c|C)?\n(.*?)```", text, re.S)
    return (block.group(1) if block else text).strip()


def recall(name: str, file: str, mode: str = "verbatim") -> tuple[str, bool]:
    """The model's answer; in verbatim mode retried once with the (accurate) GPL framing if it refused. Returns (text, refused)."""
    text = ask_model(name, file, mode=mode)
    if mode == "verbatim" and function_span(text, name) is None and REFUSAL_RE.search(text):
        text = ask_model(name, file, gpl_framing=True)
    refused = function_span(text, name) is None
    return text, refused


def judge(referee: Referee, name: str, file: str, recalled: str, build: str) -> dict:
    """Swap the recalled function into the build's own source file, compile it, compare that function."""
    src = _source(file, build)
    span = function_span(src, name)
    if span is None or function_span(recalled, name) is None:
        return {"status": "REFUSED", "match_pct": 0.0}
    patched = src[:span[0]] + recalled + src[span[1]:]
    work = OUT / "tmp" / uuid.uuid4().hex[:10]
    work.mkdir(parents=True)
    (work / "probe.c").write_text(patched)
    rel = work.relative_to(REPO)
    flags = ARM_FLAGS if ".iwram" in file else THUMB_FLAGS
    proc = _docker(f"{GCC} {flags} {DIAG_FLAGS} {INCLUDES} -c {rel}/probe.c -o {rel}/p.o 2>&1 && {OBJDUMP} -dr {rel}/p.o > {rel}/p.dis && {OBJDUMP} -t {rel}/p.o > {rel}/p.sym")
    if proc.returncode != 0:
        first = patched[:span[0]].count("\n") + 1
        return {"status": "NO_COMPILE", "match_pct": 0.0,
                "errors": candidate_errors(proc.stdout, first, first + recalled.count("\n"))}
    got_blocks = _blocks((work / "p.dis").read_text())
    if name not in got_blocks:
        return {"status": "NO_FUNCTION", "match_pct": 0.0}
    got = [referee._normalize(i, _symtab((work / "p.sym").read_text()), own_ids=False) for i in got_blocks[name]]
    obj = Path(file).stem + ".o"
    target_sym = _symtab(_docker(f"{OBJDUMP} -t {BUILDS[build]}/{obj}", check=True).stdout)
    target = [referee._normalize(i, target_sym, own_ids=False) for i in _object_blocks(BUILDS[build], obj)[name]]
    result = referee._compare(target, got)
    return {"status": result["status"], "match_pct": result["match_pct"]}


def candidate_errors(log: str, first: int, last: int) -> list[str]:
    """Diagnostics inside the candidate (lines first..last of probe.c), renumbered from 1, header paths dropped.
    A header error is kept when the next note points into the candidate (a macro expanded there)."""
    out, pending, outside, last_inside = [], None, False, False
    for line in log.splitlines():
        m = DIAG_RE.match(line)
        if not m:
            continue
        path, num, kind, msg = m.group(1), int(m.group(2)), m.group(3), m.group(4)
        inside = path.endswith("probe.c") and first <= num <= last
        if inside and kind == "note" and pending:
            out.append(f"line {num - first + 1}: error: {pending} ({msg})")
        elif inside and (kind != "note" or last_inside):
            out.append(f"line {num - first + 1}: {kind}: {msg}")
        elif kind == "error" and not path.endswith("probe.c"):
            pending = msg
            continue
        elif kind == "error":
            outside = True
        if kind != "note":
            last_inside = inside
        pending = None
    if outside:
        out.append("(other functions in the file failed where they call this one: its signature does not match GBADoom's)")
    return out


_DECL_CACHE: dict[str, tuple[str, str, str]] = {}


def _decl_corpus(file: str) -> tuple[str, str, str]:
    """(raw, top, headers): GBADoom's headers plus the public source file; top has every {...} emptied."""
    if file not in _DECL_CACHE:
        headers = "\n".join(p.read_text(errors="replace") for p in sorted((SECRETS / "gbadoom" / "include").glob("*.h")))
        raw = headers + "\n" + _source(file, "unmodified")
        top, depth = [], 0
        for ch in raw:
            depth -= ch == "}"
            if depth == 0:
                top.append(ch)
            depth += ch == "{"
        _DECL_CACHE[file] = (raw, "".join(top), headers)
    return _DECL_CACHE[file]


def _block_ending(raw: str, end: int) -> str:
    """The {...} block (with its typedef/enum/struct head) whose closing brace is at raw[end]."""
    depth, i = 0, end
    while i >= 0:
        depth += {"}": 1, "{": -1}.get(raw[i], 0)
        if depth == 0:
            break
        i -= 1
    start = raw.rfind("\n", 0, i) + 1
    if not raw[start:i].strip():  # brace on its own line: the head ("typedef struct x") is the line before
        start = raw.rfind("\n", 0, start - 1) + 1
    return raw[start:raw.find(";", end) + 1]


def declaration(name: str, file: str) -> str | None:
    """GBADoom's declaration of one identifier: prototype, #define, typedef/struct, or the enum holding it. Never a body."""
    raw, top, headers = _decl_corpus(file)
    found = []
    m = re.search(rf"^[ \t]*#[ \t]*define[ \t]+{name}\b.*(?:\\\n.*)*", raw, re.M)
    if m:
        found.append(m.group(0).strip())
    m = re.search(rf"^[^;{{}}#\n]*\b{name}\s*\([^;{{}}]*\)\s*;", top, re.M)  # prototype at file scope
    if m:
        found.append(m.group(0).strip())
    else:
        m = re.search(rf"^[^;{{}}#\n]*\b{name}\s*\([^;{{}}]*\)\s*\{{\}}", top, re.M)  # definition: keep the signature only
        if m:
            found.append(m.group(0)[:m.group(0).rfind("{")].strip() + ";")
    m = re.search(rf"^typedef[^;{{}}\n]*\b{name}\s*;", top, re.M)
    if m:
        found.append(m.group(0).strip())
    # struct/union definitions: headers only, so a match can never sit inside a function body in the source file
    m = re.search(rf"\}}\s*{name}\s*;", headers) or re.search(rf"^(?:typedef\s+)?(?:struct|union)\s+{name}\s*\{{", headers, re.M)
    if m:
        end = m.start() if m.group(0).startswith("}") else _matching_brace(headers, m.end() - 1)
        found.append(_block_ending(headers, end))
    if not found:
        for e in re.finditer(r"(?:typedef\s+)?enum\s*\w*\s*\{[^{}]*\}[^;]*;", raw):
            bare = re.sub(r"/\*.*?\*/|//[^\n]*", "", e.group(0), flags=re.S)
            if re.search(rf"[{{,]\s*(?:#[^\n]*\n\s*)*{name}\s*[=,}}]", bare):  # an enumerator, not a word in a comment
                block = e.group(0)
                if len(block) > 3000:  # huge enums (states, sprites): only the matching entries
                    block = "\n".join(l for l in block.splitlines() if re.search(rf"\b{name}\b", l)) + "  /* enum trimmed */"
                found.append(block)
                break
    return "\n".join(dict.fromkeys(found)) or None


def _matching_brace(raw: str, start: int) -> int:
    depth = 0
    for i in range(start, len(raw)):
        depth += {"{": 1, "}": -1}.get(raw[i], 0)
        if depth == 0:
            return i
    return len(raw) - 1


def repair_declarations(name: str, file: str, candidate: str, errors: list[str]) -> str:
    """Declarations for the function itself, every function the candidate calls, globals_t when an error is about
    it, and every identifier the errors name. Identifiers GBADoom lacks are listed as missing."""
    called = [n for n in re.findall(r"\b([A-Za-z_]\w*)\s*\(", candidate) if n not in C_WORDS]
    hints = re.compile(r"has no member named '\w+'|did you mean '[^']*'\??")
    named = [n for e in errors if e.startswith("line ") for n in re.findall(r"'(?:struct |enum )?([A-Za-z_]\w*)", hints.sub("", e)) if n not in C_WORDS]
    if any("globals_t" in e or "'_g'" in e for e in errors):
        named.insert(0, "globals_t")
    out, missing = [], []
    for ident in dict.fromkeys([name, *called, *named]):
        decl = declaration(ident, file)
        if decl:
            out.append(decl)
        elif ident in named:
            missing.append(ident)
    if missing:
        out.append("/* not declared anywhere in GBADoom: " + ", ".join(missing) + " */")
    text = "\n\n".join(dict.fromkeys(out))
    assert function_span(text, name) is None, "repair declarations must not contain the function's body"
    return text


def repair(referee: Referee, name: str, file: str, mode: str, first: str, results: dict, rounds: int) -> dict:
    """Up to `rounds` compile-repair turns after a NO_COMPILE. Returns the final per-build results and the transcript."""
    messages = [{"role": "user", "content": PROMPTS[mode].format(name=name, file=file)},
                {"role": "assistant", "content": f"```c\n{first}\n```"}]
    candidate, history, used = first, [], 0
    while used < rounds and any(r["status"] == "NO_COMPILE" for r in results.values()):
        if _spend["usd"] >= BUDGET_USD:
            break
        errors = next(r["errors"] for r in results.values() if r["status"] == "NO_COMPILE")
        decls = repair_declarations(name, file, candidate, errors)
        prompt = REPAIR_PROMPT.format(name=name, errors="\n".join(errors) or "(none inside the function)", decls=decls)
        candidate = chat(messages + [{"role": "user", "content": prompt}])
        messages += [{"role": "user", "content": prompt}, {"role": "assistant", "content": f"```c\n{candidate}\n```"}]
        results = {b: judge(referee, name, file, candidate, b) for b in BUILDS}
        used += 1
        history.append({"errors": errors, "declarations": decls, "candidate": candidate,
                        **{b: {k: v for k, v in r.items() if k != "errors"} for b, r in results.items()}})
    return {"rounds": used, **results, "history": history}


def summarize_repair(rows: list[dict], build: str) -> dict:
    finals = [r["repair"][build] for r in rows]
    compiled = [f["match_pct"] for f in finals if f["status"] in ("MATCH", "PARTIAL")]
    return {**{s: sum(f["status"] == s for f in finals) for s in ("MATCH", "PARTIAL", "NO_COMPILE", "NO_FUNCTION")},
            "compiled": len(compiled), "best_pct": max(compiled, default=0.0),
            "mean_pct": round(sum(compiled) / len(compiled), 1) if compiled else 0.0}


def _source(file: str, build: str) -> str:
    if build == "variant":
        return (SECRETS / "gbadoom" / file).read_text()
    return subprocess.run(["git", "-C", str(SECRETS / "gbadoom"), "show", f"HEAD:{file}"], capture_output=True, text=True, check=True).stdout


def summarize(rows: list[dict], build: str) -> dict:
    matched = sum(r[build]["status"] == "MATCH" for r in rows)
    outcomes = {s: sum(r[build]["status"] == s for r in rows) for s in ("MATCH", "PARTIAL", "NO_COMPILE", "REFUSED")}
    return {"matched": matched, "outcomes": outcomes, "match_rate": round(matched / len(rows), 3) if rows else 0.0,
            "best_pct": max((r[build]["match_pct"] for r in rows), default=0.0),
            "mean_pct": round(sum(r[build]["match_pct"] for r in rows) / len(rows), 1) if rows else 0.0}


def main() -> None:
    import argparse
    parser = argparse.ArgumentParser(description="Memory probe")
    parser.add_argument("--prompt", choices=sorted(PROMPTS), default="verbatim")
    parser.add_argument("--repair", type=int, default=0, help="compile-repair rounds after a NO_COMPILE (memory plus headers)")
    args = parser.parse_args()
    mode, rounds = args.prompt, args.repair
    load_env()
    if not os.environ.get("META_API_KEY"):
        raise SystemExit("META_API_KEY missing: add it to .env (gitignored)")
    referee = Referee()
    picked = pick_functions(referee)

    def run(item: tuple[str, str]) -> dict:
        name, file = item
        recalled, refused = recall(name, file, mode)
        row = {"name": name, "file": file, "changed_by_variant": changed_by_variant(referee, name, file),
               "recalled": recalled, **{b: judge(referee, name, file, recalled, b) for b in BUILDS}}
        if rounds:
            row["repair"] = repair(referee, name, file, mode, recalled, {b: row[b] for b in BUILDS}, rounds)
        return row

    with concurrent.futures.ThreadPoolExecutor(PARALLEL) as pool:
        rows = list(pool.map(run, picked))
    public_rows = [{k: v for k, v in r.items() if k != "recalled"} for r in rows]
    for r in public_rows:
        line = f"{r['name']:28s} unmodified {r['unmodified']['status']:11s} {r['unmodified']['match_pct']:5.1f}   variant {r['variant']['status']:11s} {r['variant']['match_pct']:5.1f}"
        if "repair" in r:
            rp = r["repair"]
            line += f"   after {rp['rounds']} repair(s): {rp['unmodified']['status']} {rp['unmodified']['match_pct']:.1f} / {rp['variant']['status']} {rp['variant']['match_pct']:.1f}"
        print(line)
    result = {"v": 1, "prompt": mode, "model": os.environ.get("META_MODEL", "muse-spark-1.3"), "fn_count": len(rows),
              "method": (f"model asked ({mode} prompt) to write {len(rows)} public GBADoom functions (status bar and weapon code) from memory by "
                         "their original names; each answer replaced the original in its real source file, compiled with "
                         "the original headers, and was compared against (a) unmodified GBADoom and (b) our private variant"),
              "unmodified": summarize(rows, "unmodified"), "variant": summarize(rows, "variant"),
              "variant_changed": {"fn_count": sum(r["changed_by_variant"] for r in rows),
                                  **summarize([r for r in rows if r["changed_by_variant"]], "variant")}}
    if rounds:
        result["repair_rounds"] = rounds
        result["method"] += (f"; then up to {rounds} compile-repair rounds that gave the model its compile errors and GBADoom's "
                             "real declarations (prototypes, types, enums, defines, the globals_t struct; no function bodies), "
                             "so after_repair measures memory plus headers, not memory alone")
        result["repair_cost_usd_est"] = round(_spend["usd"], 2)
        for b in BUILDS:
            result[b]["after_repair"] = summarize_repair(rows, b)
    if mode != "verbatim":  # keep the last verbatim run visible next to this one
        old = json.loads((OUT / "memory_probe.json").read_text()) if (OUT / "memory_probe.json").exists() else {}
        verbatim = old.get("verbatim_run") or (old if old.get("prompt", "verbatim") == "verbatim" else None)
        if verbatim:
            result["verbatim_run"] = {**verbatim, "prompt": "verbatim"}
    (OUT / "memory_probe.json").write_text(json.dumps(result, indent=1) + "\n")
    detail = "memory_probe_detail_repair.json" if rounds else (
        "memory_probe_detail.json" if mode == "verbatim" else f"memory_probe_detail_{mode}.json")
    (SECRETS / detail).write_text(json.dumps(rows, indent=1) + "\n")
    print(json.dumps({k: result[k] for k in ("unmodified", "variant")}), f"spend ~${_spend['usd']:.2f} in {_spend['calls']} calls")


if __name__ == "__main__":
    main()
