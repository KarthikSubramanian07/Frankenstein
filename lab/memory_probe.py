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
import uuid
from pathlib import Path

from lab.referee.core import ARM_FLAGS, GCC, OBJDUMP, OUT, REPO, SECRETS, THUMB_FLAGS, Referee, _blocks, _docker, _symtab

FILES = ("source/st_stuff.c", "source/p_pspr.c")
FN_COUNT = 20
PARALLEL = 5
INCLUDES = ("-iquote lab/secrets/gbadoom/include -iquote lab/secrets/gbadoom/include/libtimidity "
            "-iquote lab/secrets/gbadoom/source -I/opt/devkitpro/libgba/include")
BUILDS = {"unmodified": "lab/secrets/unmodified/build", "variant": "lab/secrets/gbadoom/build"}
PROMPT = """From memory, write the C function `{name}` exactly as it appears in GBADoom (doomhack/GBADoom on GitHub,
a port of prBoom to the Game Boy Advance), file {file}. Reproduce the original source as closely as you can,
including its use of the `_g` globals pointer. Output only that one function definition in a single ```c block,
with no includes, no other functions and no explanation."""


def load_env() -> None:
    env = REPO / ".env"
    if env.exists():
        for line in env.read_text().splitlines():
            key, sep, value = line.partition("=")
            if sep and key.strip() and not key.startswith("#"):
                os.environ.setdefault(key.strip(), value.strip())


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


def ask_model(name: str, file: str) -> str:
    from openai import OpenAI
    client = OpenAI(api_key=os.environ["META_API_KEY"], base_url=os.environ.get("META_BASE_URL", "https://api.meta.ai/v1"))
    reply = client.chat.completions.create(
        model=os.environ.get("META_MODEL", "muse-spark-1.3"),
        messages=[{"role": "user", "content": PROMPT.format(name=name, file=file)}],
        reasoning_effort=os.environ.get("META_REASONING_EFFORT", "high"),
    )
    text = reply.choices[0].message.content or ""
    block = re.search(r"```(?:c|C)?\n(.*?)```", text, re.S)
    return (block.group(1) if block else text).strip()


def judge(referee: Referee, name: str, file: str, recalled: str, build: str) -> dict:
    """Swap the recalled function into the build's own source file, compile it, compare that function."""
    src = _source(file, build)
    span = function_span(src, name)
    if span is None or function_span(recalled, name) is None:
        return {"status": "NO_FUNCTION", "match_pct": 0.0}
    patched = src[:span[0]] + recalled + src[span[1]:]
    work = OUT / "tmp" / uuid.uuid4().hex[:10]
    work.mkdir(parents=True)
    (work / "probe.c").write_text(patched)
    rel = work.relative_to(REPO)
    flags = ARM_FLAGS if ".iwram" in file else THUMB_FLAGS
    proc = _docker(f"{GCC} {flags} {INCLUDES} -c {rel}/probe.c -o {rel}/p.o 2>&1 && {OBJDUMP} -dr {rel}/p.o > {rel}/p.dis && {OBJDUMP} -t {rel}/p.o > {rel}/p.sym")
    if proc.returncode != 0:
        return {"status": "NO_COMPILE", "match_pct": 0.0}
    got_blocks = _blocks((work / "p.dis").read_text())
    if name not in got_blocks:
        return {"status": "NO_FUNCTION", "match_pct": 0.0}
    got = [referee._normalize(i, _symtab((work / "p.sym").read_text()), own_ids=False) for i in got_blocks[name]]
    obj = Path(file).stem + ".o"
    target_sym = _symtab(_docker(f"{OBJDUMP} -t {BUILDS[build]}/{obj}", check=True).stdout)
    target = [referee._normalize(i, target_sym, own_ids=False) for i in _object_blocks(BUILDS[build], obj)[name]]
    result = referee._compare(target, got)
    return {"status": result["status"], "match_pct": result["match_pct"]}


def _source(file: str, build: str) -> str:
    if build == "variant":
        return (SECRETS / "gbadoom" / file).read_text()
    return subprocess.run(["git", "-C", str(SECRETS / "gbadoom"), "show", f"HEAD:{file}"], capture_output=True, text=True, check=True).stdout


def summarize(rows: list[dict], build: str) -> dict:
    matched = sum(r[build]["status"] == "MATCH" for r in rows)
    return {"matched": matched, "match_rate": round(matched / len(rows), 3) if rows else 0.0,
            "best_pct": max((r[build]["match_pct"] for r in rows), default=0.0),
            "mean_pct": round(sum(r[build]["match_pct"] for r in rows) / len(rows), 1) if rows else 0.0}


def main() -> None:
    load_env()
    if not os.environ.get("META_API_KEY"):
        raise SystemExit("META_API_KEY missing: add it to .env (gitignored)")
    referee = Referee()
    picked = pick_functions(referee)

    def run(item: tuple[str, str]) -> dict:
        name, file = item
        recalled = ask_model(name, file)
        return {"name": name, "file": file, "changed_by_variant": changed_by_variant(referee, name, file),
                **{b: judge(referee, name, file, recalled, b) for b in BUILDS}}

    with concurrent.futures.ThreadPoolExecutor(PARALLEL) as pool:
        rows = list(pool.map(run, picked))
    for r in rows:
        print(f"{r['name']:28s} unmodified {r['unmodified']['status']:11s} {r['unmodified']['match_pct']:5.1f}   variant {r['variant']['status']:11s} {r['variant']['match_pct']:5.1f}")
    result = {"v": 1, "model": os.environ.get("META_MODEL", "muse-spark-1.3"), "fn_count": len(rows),
              "method": (f"model asked to write {len(rows)} public GBADoom functions (status bar and weapon code) from memory by "
                         "their original names; each answer replaced the original in its real source file, compiled with "
                         "the original headers, and was compared against (a) unmodified GBADoom and (b) our private variant"),
              "unmodified": summarize(rows, "unmodified"), "variant": summarize(rows, "variant"),
              "variant_changed": {"fn_count": sum(r["changed_by_variant"] for r in rows),
                                  **summarize([r for r in rows if r["changed_by_variant"]], "variant")}}
    (OUT / "memory_probe.json").write_text(json.dumps(result, indent=1) + "\n")
    (SECRETS / "memory_probe_detail.json").write_text(json.dumps(rows, indent=1) + "\n")
    print(json.dumps({k: result[k] for k in ("unmodified", "variant")}))


if __name__ == "__main__":
    main()
