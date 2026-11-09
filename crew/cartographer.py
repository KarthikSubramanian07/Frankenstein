"""The SubQ Cartographer: one whole-program pass that proposes a shared types.h for every Digger.

Why this needs a long-context model
-----------------------------------
A Digger sees one function: its asm, its ctx header and its neighbours. It cannot know that the
`ldr r3, [r4, #0x48]` in fn_A and the `str r1, [r0, #0x48]` in fn_B touch the same field of the same
struct, or that the literal-pool address 0x03006778 is indexed with a stride of 12 in five different
functions (an array of 12-byte structs, not a scalar). Those facts only exist *across* functions.
The Cartographer concatenates the FULL disassembly of every game function, every accepted recovered
C file, and the union of all ctx headers into ONE request (hundreds of thousands of tokens) and
asks SubQ (`subq-preview`, the long-context model) for:

  * shared struct definitions inferred across functions,
  * a signature (return + parameter types) for every function,
  * which globals are arrays and which are scalars.

The answer must be a C header that compiles. We check that with a real compiler and drop whatever
does not compile, so what reaches Diggers is never worse than "nothing". Every run records how big
the request was (`tokens_in`, `n_functions`) and how much of the program it covered, so the
ablation (r04 vs r02) can report an honest number.

Providers
---------
  provider="subq"  -> SubQ Chat Completions, model cfg.subq_model (default subq-preview).
  provider="meta"  -> Muse via crew/llm.py, ONLY to test the pipeline when SubQ is unavailable.
                      Labelled source="meta-fallback" everywhere; it is never reported as SubQ.

CLI: python -m crew.cartographer --run-dir runs/<id> [--provider subq|meta] [--dry-run] [--limit N]
"""
from __future__ import annotations

import argparse
import json
import random
import re
import shutil
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.request
from pathlib import Path

from .config import ROOT, Config, env
from .guard import safe_read
from .target import Target

SOURCE_SUBQ = "subq"
SOURCE_META = "meta-fallback"
# Measured, not guessed: SubQ Snap's usage.input_tokens on 60 KB of this game's objdump asm gave
# 1.42 chars/token (asm is token-dense). We assume the same for subq-preview and label it an estimate;
# the real count comes back in usage.prompt_tokens.
CHARS_PER_TOKEN = 1.45
DEFAULT_TOKEN_BUDGET = 900_000  # subq-preview window is not published; stay under ~1M. Over it, we trim (and say so)
FN_RE = re.compile(r"\bfn_[0-9A-F]{8}\b")
DATA_RE = re.compile(r"\bdata_[0-9A-F]{8}\b")
ALLOWED_INCLUDES = {"stdint.h", "stdbool.h", "stddef.h"}  # anything else is dropped (lint L009 spirit)
PRELUDE = "#pragma once\n#include <stdint.h>\n#include <stdbool.h>\n#include <stddef.h>\n"


class CartographerError(RuntimeError):
    pass


# --------------------------------------------------------------------------------------------- corpus

def _addr(f: dict) -> int:
    return int(str(f["addr"]), 16)


_LINE_RE = re.compile(r"^\s*([0-9a-f]+):\t[0-9a-f]{4,8}(?: [0-9a-f]{4})?\s*\t(.*)$")
_WORD_RE = re.compile(r"\.word\s+0x([0-9a-fA-F]{8})")
_PCREL_RE = re.compile(r"\[pc, #\d+\]\s*@ \(([0-9a-f]+) <[^>]*>\)")


def _sym(value: int, fn_ids: dict[int, str]) -> str:
    """Name a literal: function address (Thumb bit allowed) -> fn_ id; RAM or ROM data -> data_ id."""
    if (value & ~1) in fn_ids:
        return fn_ids[value & ~1]
    if value >> 24 in (0x02, 0x03, 0x08):
        return f"data_{value:08X}"
    return f"0x{value:08X}"


def dense_asm(asm: str, fn_ids: dict[int, str] | None = None) -> str:
    """Re-encode objdump output for a token budget without losing what a type inference needs:
    addresses become function-relative offsets, the encoding column goes, a pc-relative literal
    load becomes `ldr r5, =data_03006780` (or `=fn_...` / `=0x...`) and its pool `.word` is dropped,
    branches become `<fn_X+44>`, and redundant `@ 0x..` comments go. Jump tables stay as .word."""
    fn_ids = fn_ids or {}
    rows, words = [], {}
    for ln in asm.splitlines():
        m = _LINE_RE.match(ln)
        if not m:
            if ln.strip():
                rows.append((None, ln.strip()))
            continue
        a, text = int(m.group(1), 16), m.group(2)
        w = _WORD_RE.match(text)
        if w:
            words[a] = int(w.group(1), 16)
        rows.append((a, text))
    base = next((a for a, _ in rows if a is not None), 0)
    used, out = set(), []
    for a, text in rows:
        if a is None:
            out.append((None, text))
            continue
        m = _PCREL_RE.search(text)
        if m and int(m.group(1), 16) in words:
            wa = int(m.group(1), 16)
            used.add(wa)
            text = text[:m.start()] + "=" + _sym(words[wa], fn_ids)
        text = re.sub(r"\b[0-9a-f]+ <(fn_[0-9A-F]{8})\+0x([0-9a-f]+)>", r"<\1+\2>", text)
        text = re.sub(r"\b[0-9a-f]+ <(fn_[0-9A-F]{8})>", r"\1", text)
        text = re.sub(r"\s*@ (?:0x[0-9a-f]+|\(mov r8, r8\))\s*$", "", text)
        out.append((a, re.sub(r"\s+", " ", text).strip()))
    return "\n".join(t if a is None else f"{a - base:x} {t}" for a, t in out if a is None or a not in used)


def literal_globals(asm: str, fn_addrs: set[int]) -> list[str]:
    """Literal-pool words that point at RAM (EWRAM 0x02, IWRAM 0x03) or at ROM data that is not a
    function. Lane A's ctx headers do not list these yet (known gap), so we name them data_<ADDR>."""
    out = []
    for h in _WORD_RE.findall(asm):
        a = int(h, 16)
        region = a >> 24
        if region in (0x02, 0x03) or (region == 0x08 and (a & ~1) not in fn_addrs):
            out.append(f"data_{a:08X}")
    return out


def cap_lines(text: str, cap: int | None) -> str:
    lines = text.splitlines()
    if cap and len(lines) > cap:
        return "\n".join(lines[:cap] + [f"... ({len(lines) - cap} more lines cut for the token budget)"])
    return text


def fit_cap(render, sizes: list[int], budget_chars: int) -> int | None:
    """Largest per-function line cap whose rendering fits budget_chars (None = no cap needed)."""
    if len(render(None)) <= budget_chars:
        return None
    lo, hi = 4, max(sizes or [4])
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if len(render(mid)) <= budget_chars:
            lo = mid
        else:
            hi = mid - 1
    return lo


def _functions(target: Target, scope: str | None, limit: int | None) -> list[dict]:
    fs = [f for f in target.manifest["functions"] if scope in (None, "all") or f["scope"] == scope]
    fs.sort(key=_addr)
    return fs[:limit] if limit else fs


def fn_id_map(target: Target) -> dict[int, str]:
    return {_addr(f) & ~1: f["id"] for f in target.manifest["functions"]}


def build_corpus(target: Target, recovered: dict[str, str] | None = None, *, scope: str = "game",
                 limit: int | None = None, token_budget: int | None = DEFAULT_TOKEN_BUDGET) -> tuple[str, dict]:
    """Concatenate the whole program into one deterministic text. Ordering is by address everywhere.

    Sections: globals index (literal-pool references), union of ctx headers (deduplicated by line),
    accepted recovered C, then every function's disassembly (dense_asm). If the estimate is over
    token_budget, every function is cut to the same line cap (largest that fits) and stats say so.
    Returns (text, stats)."""
    recovered = dict(recovered if recovered is not None else target.recovered)
    fs = _functions(target, scope, limit)
    fn_ids = fn_id_map(target)
    ids = {f["id"] for f in fs}

    asm_by_fn, globals_refs = {}, {}
    for f in fs:
        a = target.asm(f["id"])
        asm_by_fn[f["id"]] = dense_asm(a, fn_ids)
        for g in literal_globals(a, set(fn_ids)):
            globals_refs.setdefault(g, set()).add(f["id"])

    seen, ctx_lines = set(), []
    for f in fs:
        for line in target.context(f["id"]).splitlines():
            s = line.rstrip()
            if not s or s.startswith(("/* Context for ", "#pragma once", "#include")) or s in seen:
                continue
            seen.add(s)
            ctx_lines.append(s)

    rec = sorted((fn for fn in recovered if fn in target.fns), key=lambda fn: _addr(target.fns[fn]))
    head = [f"# Whole-program corpus: game {target.game_id}, {len(fs)} functions (scope={scope}), "
            f"{len(rec)} recovered, ordered by address. Asm is function-relative: `ldr rX, =data_ID` "
            f"is a literal-pool load of that global's address; `<fn_X+44>` is a branch to offset 0x44.\n"]
    head.append("## Globals referenced through literal pools (id: referencing functions)\n")
    for g in sorted(globals_refs):
        users = sorted(globals_refs[g])
        head.append(f"{g}: {len(users)} fn: {' '.join(users[:12])}{' ...' if len(users) > 12 else ''}\n")
    head.append("\n## Context headers (union of every function's ctx header, deduplicated)\n")
    head.append("\n".join(ctx_lines) + "\n")
    head.append("\n## Recovered C accepted by the referee (byte-identical)\n")
    for fn in rec:
        head.append(f"// ---- {fn}.c\n{recovered[fn].rstrip()}\n")
    head.append("\n## Disassembly\n")
    head_text = "".join(head)

    def render(cap):
        parts = [head_text]
        for f in fs:
            parts.append(f"### {f['id']} addr={f['addr']} size={f['size']} mode={f['mode']} "
                         f"callees={','.join(f['callees']) or '-'} callers={len(f['callers'])}"
                         f"{' RECOVERED' if f['id'] in recovered else ''}\n{cap_lines(asm_by_fn[f['id']], cap).rstrip()}\n")
        return "".join(parts)

    cap = None
    if token_budget:
        cap = fit_cap(render, [len(a.splitlines()) for a in asm_by_fn.values()], int(token_budget * CHARS_PER_TOKEN))
    text = render(cap)
    cut = sum(1 for a in asm_by_fn.values() if cap and len(a.splitlines()) > cap)
    stats = {"n_functions": len(fs), "n_recovered": len([r for r in rec if r in ids]),
             "n_ctx_lines": len(ctx_lines), "n_globals": len(globals_refs), "chars": len(text),
             "tokens_est": int(len(text) / CHARS_PER_TOKEN), "tokens_est_method": f"chars/{CHARS_PER_TOKEN} (measured on Snap)",
             "line_cap": cap, "functions_cut": cut, "full_disassembly": cap is None,
             "scope": scope, "limit": limit, "fixture_manifest": target.fixture}
    return text, stats


# --------------------------------------------------------------------------------------------- prompt

SYSTEM_PROMPT = """You are the Cartographer of a matching-decompilation project for a Game Boy Advance game \
(ARM7TDMI, Thumb, GCC -O3). You receive the ENTIRE program at once: every function's disassembly, every \
function already recovered as C, and every context header. Use the whole program: a struct offset loaded \
in one function and stored in another is the same field; a global indexed with a stride is an array.

Output ONLY a C header, in exactly one ```c fenced block, nothing before or after it. Rules:
1. Names are anonymous ids. Keep every fn_XXXXXXXX and data_XXXXXXXX id exactly as given. In the asm, \
`ldr r3, =data_0300ABCD` loads the address of global data_0300ABCD (it may point inside a struct or array \
global; an access like [r3, #8] then reads offset 8 of it).
2. Structs: name them struct_0001, struct_0002, ... with fields f_00, f_04, ... named by byte offset \
(hex), padding as needed so offsets are exact on 32-bit ARM. Use `typedef struct struct_0001 { ... } struct_0001;`.
3. If you can infer a human-readable meaning, put it ONLY in a trailing comment: /* inferred: player mobj */.
4. Declare a prototype for EVERY function in the corpus: `rettype fn_XXXXXXXX(params);` using \
stdint types (int32_t, uint16_t, ...), bool, pointers to your structs. Use void when unsure of a return.
5. Declare globals as `extern T data_XXXXXXXX;` or `extern T data_XXXXXXXX[N];` (arrays when indexed).
6. Only declarations: no function bodies, no macros, no #include (stdint.h, stdbool.h, stddef.h are \
already included). The header must compile with gcc -std=gnu23 -fsyntax-only."""

USER_PREFIX = "Here is the whole program. Produce types.h now.\n\n"


# --------------------------------------------------------------------------------------------- SubQ client

def subq_chat(cfg: Config, messages: list[dict], *, max_tokens: int = 64_000, effort: str | None = None,
              timeout: float = 900) -> dict:
    """Stdlib OpenAI-compatible POST /v1/chat/completions to SubQ (docs.subq.ai, chat-completions-api).
    Returns {"content", "tin", "tout", "model", "finish_reason", "usage"}."""
    if not cfg.subq_key:
        raise CartographerError("SubQ key missing: get one at the Subquadratic table, set SUBQ_API_KEY in .env")
    # Docs: reasoning tokens count against max_tokens and there is no bounded default, so set it explicitly.
    body = {"model": cfg.subq_model, "messages": messages, "max_tokens": max_tokens,
            "reasoning_effort": effort or env("SUBQ_REASONING_EFFORT", "medium"), "store": False}
    data = json.dumps(body).encode()
    last = None
    for attempt in range(4):
        req = urllib.request.Request(f"{cfg.subq_url}/chat/completions", data=data, method="POST", headers={
            "Authorization": f"Bearer {cfg.subq_key}", "Content-Type": "application/json"})
        try:
            with urllib.request.urlopen(req, timeout=timeout) as r:
                d = json.loads(r.read())
            break
        except urllib.error.HTTPError as e:
            raw = e.read()[:600]
            last = f"HTTP {e.code}: {raw!r}"
            if e.code == 403 and b"model_not_allowed" in raw:
                raise CartographerError(
                    f"{cfg.subq_model} needs early access (model_not_allowed): ask the Subquadratic table") from e
            if e.code == 400 and b"context_length" in raw:
                raise CartographerError(f"corpus too large for {cfg.subq_model}: {last}") from e
            if e.code in (429, 500, 502, 503, 504):
                time.sleep(min(30, 2 ** attempt + random.random() * 2))
                continue
            raise CartographerError(f"SubQ call failed: {last}") from e
        except (urllib.error.URLError, TimeoutError) as e:
            last = str(e)
            time.sleep(2 ** attempt)
    else:
        raise CartographerError(f"SubQ call failed after retries: {last}")
    ch = d["choices"][0]
    content = (ch.get("message") or {}).get("content") or ""
    u = d.get("usage") or {}
    if not content.strip():  # docs: a length stop can return 200 with empty content (all reasoning)
        raise CartographerError(f"SubQ returned empty content (finish_reason={ch.get('finish_reason')}); "
                                "retry with SUBQ_REASONING_EFFORT=none or a larger max_tokens")
    return {"content": content, "tin": int(u.get("prompt_tokens", 0)), "tout": int(u.get("completion_tokens", 0)),
            "model": d.get("model", cfg.subq_model), "finish_reason": ch.get("finish_reason"), "usage": u}


def _meta_chat(cfg: Config, messages: list[dict], max_tokens: int) -> dict:
    from .llm import LLM, LLMError
    try:
        r = LLM(cfg, timeout=600).chat(messages, max_tokens=max_tokens)
    except LLMError as e:
        raise CartographerError(f"meta fallback failed: {e}") from e
    return {"content": r["message"].get("content") or "", "tin": r["tin"], "tout": r["tout"], "model": r["model"],
            "finish_reason": None, "usage": {"prompt_tokens": r["tin"], "completion_tokens": r["tout"]},
            "cost": r["cost"]}


# --------------------------------------------------------------------------------------------- header parsing

def extract_header(text: str) -> str:
    """The C inside the (largest) ```c block. Tolerates ```h/```cpp and an unterminated fence (a
    length-truncated answer); with no fence at all, the whole text is treated as the header."""
    blocks = re.findall(r"```[ \t]*(?:c|h|cpp|c\+\+)?[ \t]*\n(.*?)(?:```|\Z)", text, flags=re.S | re.I)
    blocks = [b for b in blocks if b.strip()]
    return (max(blocks, key=len) if blocks else text).strip() + "\n"


_PP_AT = re.compile(r"[ \t]*#")


def split_decls(header: str) -> list[str]:
    """Split a header into top-level items: each ends at a `;` at brace/paren depth 0 (which covers
    `};`), and keeps leading comments and a same-line trailing comment. Preprocessor lines are their
    own items. Comment- and string-aware, so `/* a; b */` does not split."""
    items, buf, i, n = [], [], 0, len(header)
    depth = 0
    at_line_start = True

    def flush():
        s = "".join(buf).strip()
        if s:
            items.append(s)
        buf.clear()

    while i < n:
        c = header[i]
        if at_line_start and depth == 0 and _PP_AT.match(header, i):
            j = header.find("\n", i)
            j = n if j < 0 else j
            while j < n and header[j - 1] == "\\":  # continued directive
                k = header.find("\n", j + 1)
                j = n if k < 0 else k
            if "".join(buf).strip():
                flush()
            buf.append(header[i:j])
            flush()
            i = j
            continue
        if header.startswith("/*", i):
            j = header.find("*/", i + 2)
            j = n if j < 0 else j + 2
            buf.append(header[i:j]); i = j; at_line_start = False
            continue
        if header.startswith("//", i):
            j = header.find("\n", i)
            j = n if j < 0 else j
            buf.append(header[i:j]); i = j
            continue
        if c in "\"'":
            j = i + 1
            while j < n and header[j] != c:
                j += 2 if header[j] == "\\" else 1
            buf.append(header[i:j + 1]); i = j + 1; at_line_start = False
            continue
        buf.append(c)
        i += 1
        if c == "\n":
            at_line_start = True
            continue
        if not c.isspace():
            at_line_start = False
        if c in "{(":
            depth += 1
        elif c in "})":
            depth = max(0, depth - 1)
        elif c == ";" and depth == 0:
            # absorb a trailing comment on the same line: `int x; /* inferred: ... */`
            m = re.match(r"[ \t]*(/\*.*?\*/|//[^\n]*)", header[i:], flags=re.S)
            if m:
                buf.append(m.group(0)); i += m.end()
            flush()
    rest = "".join(buf).strip()
    if rest and not re.fullmatch(r"(\s|/\*.*?\*/|//[^\n]*)*", rest, flags=re.S):
        items.append(rest)  # unterminated tail (truncated output): will fail to compile and be dropped
    return items


def _strip_comments(s: str) -> str:
    return re.sub(r"/\*.*?\*/|//[^\n]*", " ", s, flags=re.S)


def classify(decl: str) -> str:
    code = _strip_comments(decl).strip()
    if code.startswith("#"):
        return "pp"
    if re.match(r"(typedef\s+)?(struct|union)\b[^;{]*\{", code):
        return "struct"
    if re.match(r"(typedef\s+)?enum\b[^;{]*\{", code):
        return "enum"
    if code.startswith("typedef"):
        return "typedef"
    if re.search(r"\bfn_[0-9A-F]{8}\s*\(", code) and "=" not in code and "{" not in code:
        return "function"
    if DATA_RE.search(code):
        return "global"
    return "other"


def summarize(decls: list[str]) -> dict:
    kinds = [classify(d) for d in decls]
    fns = set()
    for d, k in zip(decls, kinds):
        if k == "function":
            m = re.search(r"\b(fn_[0-9A-F]{8})\s*\(", _strip_comments(d))
            fns.add(m.group(1))
    arrays = sum(1 for d, k in zip(decls, kinds) if k == "global" and re.search(r"data_[0-9A-F]{8}\s*\[", d))
    return {"n_structs": kinds.count("struct"), "n_signatures": len(fns), "signature_ids": sorted(fns),
            "n_globals": kinds.count("global"), "n_global_arrays": arrays,
            "n_global_scalars": kinds.count("global") - arrays, "n_typedefs": kinds.count("typedef"),
            "n_enums": kinds.count("enum")}


# --------------------------------------------------------------------------------------------- compile check

def _bench_flags() -> str | None:
    p = ROOT / "crew" / "bench" / "TOOLCHAIN.md"
    if not p.exists():
        return None
    m = re.search(r"`([^`]*-mcpu[^`]*)`", safe_read(p))
    return m.group(1) if m else "-mthumb -mthumb-interwork -mcpu=arm7tdmi -std=gnu23"


def compiler() -> tuple[list[str], str] | None:
    """Bench compiler (arm-none-eabi-gcc) when crew/bench/TOOLCHAIN.md exists and gcc is reachable;
    otherwise host clang cross-targeting ARMv4T so int/pointer sizes match the GBA."""
    flags = _bench_flags()
    if flags is not None:
        gcc = shutil.which("arm-none-eabi-gcc")
        dk = env("DEVKITARM")
        if not gcc and dk and Path(dk, "bin", "arm-none-eabi-gcc").exists():
            gcc = str(Path(dk, "bin", "arm-none-eabi-gcc"))
        if gcc:
            keep = [f for f in flags.split() if f.startswith(("-m", "-std", "-f")) and "lto" not in f]
            return [gcc, "-fsyntax-only", "-x", "c", *keep], "arm-none-eabi-gcc"
    clang = shutil.which("clang")
    if clang:
        return ([clang, "-fsyntax-only", "-x", "c", "-std=gnu2x", "--target=armv4t-none-eabi", "-ffreestanding",
                 "-w", "-Werror=incompatible-pointer-types", "-Werror=int-conversion", "-Werror=implicit-int",
                 "-ferror-limit=1"], "clang (host, --target=armv4t-none-eabi)")
    return None


def _compile(cc: list[str], text: str) -> tuple[bool, str]:
    with tempfile.TemporaryDirectory() as d:
        p = Path(d) / "types.h.c"
        p.write_text(text, encoding="utf-8")
        r = subprocess.run([*cc, str(p)], capture_output=True, text=True, timeout=60)
        return r.returncode == 0, r.stderr


def _render(decls: list[str]) -> tuple[str, list[int]]:
    """Header text plus, for each line, the index of the declaration it belongs to (-1 for prelude)."""
    lines, owner = PRELUDE.splitlines(), [-1] * len(PRELUDE.splitlines())
    for idx, d in enumerate(decls):
        for ln in d.splitlines():
            lines.append(ln)
            owner.append(idx)
    return "\n".join(lines) + "\n", owner


def validate(header: str, cc: list[str] | None = None) -> tuple[str, dict]:
    """Drop failing declarations one at a time until the header compiles. The failing declaration
    is the one owning the first error line (cascades resolve on later rounds)."""
    found = (cc, "explicit") if cc else compiler()
    decls = split_decls(header)
    dropped_includes = []
    kept = []
    for d in decls:
        m = re.match(r"\s*#\s*include\s*[<\"]([^>\"]+)[>\"]", d)
        if m:
            if m.group(1) not in ALLOWED_INCLUDES:
                dropped_includes.append(d)
            continue  # the prelude already includes the allowed three
        if re.match(r"\s*#\s*pragma\s+once", d):
            continue
        kept.append(d)
    info = {"compiler": found[1] if found else None, "n_decls_in": len(decls), "dropped": len(dropped_includes),
            "dropped_decls": [d[:200] for d in dropped_includes], "compiled": None, "rounds": 0}
    if not found:  # no compiler at all: say so instead of pretending it was checked
        text, _ = _render(kept)
        info["compiled"] = None
        return text, info
    cc = found[0]
    while True:
        text, owner = _render(kept)
        ok, err = _compile(cc, text)
        info["rounds"] += 1
        if ok:
            info["compiled"] = True
            break
        m = re.search(r":(\d+):(?:\d+:)?\s*(?:fatal\s+)?error:", err)
        line = int(m.group(1)) - 1 if m else -1
        idx = owner[line] if 0 <= line < len(owner) else -1
        if idx < 0:
            if not kept:
                info["compiled"] = False
                info["error"] = err[:500]
                break
            idx = len(kept) - 1  # error we cannot place: drop from the tail
        info["dropped_decls"].append(kept[idx][:200])
        info["dropped"] += 1
        del kept[idx]
    info["n_decls_out"] = len(kept)
    return text, info


# --------------------------------------------------------------------------------------------- per-function slice

_TYPE_NAME_RE = re.compile(r"\b(?:struct|union|enum)\s+([A-Za-z_]\w*)|\b([A-Za-z_]\w*)\b")


def _defines(decl: str) -> set[str]:
    code = _strip_comments(decl)
    names = set(re.findall(r"^\s*(?:typedef\s+)?(?:struct|union|enum)\s+([A-Za-z_]\w*)", code))
    if code.lstrip().startswith("typedef"):
        m = re.search(r"([A-Za-z_]\w*)\s*(?:\[[^\]]*\]\s*)*;\s*$", code.strip())
        m2 = re.search(r"\(\s*\*\s*([A-Za-z_]\w*)\s*\)", code)  # function-pointer typedef
        if m2:
            names.add(m2.group(1))
        elif m:
            names.add(m.group(1))
    return names


def signatures_for(fn: str, header: str, target: Target | None = None, *, callees: list[str] | None = None,
                   max_chars: int = 16_000) -> str:
    """The slice of types.h one Digger needs: fn's own prototype, its callees' prototypes, the
    globals its literal pools reference, and (transitively) every struct/typedef those mention.
    Declarations keep the header's order, so every type is defined before it is used."""
    decls = [d for d in split_decls(header) if classify(d) != "pp"]
    wanted_ids = {fn}
    if callees is None and target is not None and fn in target.fns:
        callees = target.fns[fn]["callees"]
    wanted_ids.update(callees or [])
    if target is not None and fn in target.fns:
        fn_addrs = {_addr(f) & ~1 for f in target.manifest["functions"]}
        wanted_ids.update(literal_globals(target.asm(fn), fn_addrs))

    definers: dict[str, int] = {}
    for i, d in enumerate(decls):
        for name in _defines(d):
            definers.setdefault(name, i)
    pick: set[int] = set()
    for i, d in enumerate(decls):
        k = classify(d)
        code = _strip_comments(d)
        if k in ("function", "global") and set(FN_RE.findall(code) + DATA_RE.findall(code)) & wanted_ids:
            # a function decl counts only when it declares (not merely mentions) a wanted id
            if k == "function":
                m = re.search(r"\b(fn_[0-9A-F]{8})\s*\(", code)
                if not m or m.group(1) not in wanted_ids:
                    continue
            pick.add(i)
    frontier = list(pick)
    while frontier:  # type closure
        i = frontier.pop()
        for tok in re.findall(r"[A-Za-z_]\w*", _strip_comments(decls[i])):
            j = definers.get(tok)
            if j is not None and j not in pick:
                pick.add(j)
                frontier.append(j)
    body = "\n".join(decls[i] for i in sorted(pick))
    if len(body) > max_chars:
        body = body[:max_chars].rsplit("\n", 1)[0] + "\n/* ... slice truncated */"
    return (f"/* types.h slice for {fn}: {len(pick)} of {len(decls)} declarations from the whole-program "
            f"Cartographer. Proposed, not verified against the original; ignore anything that disagrees "
            f"with the asm. */\n{PRELUDE}{body}\n")


# --------------------------------------------------------------------------------------------- propose

def _rel(p: Path) -> str:
    try:
        return str(p.resolve().relative_to(ROOT))
    except ValueError:
        return str(p)


def propose(cfg: Config, target: Target, recovered: dict[str, str] | None = None, log=None, provider: str = "subq",
            *, run_dir: Path | None = None, out_path: Path | None = None, scope: str = "game",
            limit: int | None = None, max_tokens: int = 64_000, token_budget: int = DEFAULT_TOKEN_BUDGET,
            chat=None) -> dict:
    """One whole-program request -> validated types.h + cartographer.json + a `types.proposed` event.

    `chat(messages) -> {"content","tin","tout","model",...}` can be injected (tests). Returns the stats
    dict written to cartographer.json."""
    if provider not in ("subq", "meta"):
        raise CartographerError(f"unknown provider {provider!r} (subq|meta)")
    if provider == "subq" and not cfg.subq_key and chat is None:
        raise CartographerError("SubQ key missing: get one at the Subquadratic table, set SUBQ_API_KEY in .env")
    run_dir = Path(run_dir or (log.run_dir if log is not None else cfg.runs_dir / "cartographer"))
    run_dir.mkdir(parents=True, exist_ok=True)
    out_path = Path(out_path or run_dir / "types.h")

    corpus, cstats = build_corpus(target, recovered, scope=scope, limit=limit, token_budget=token_budget)
    if token_budget and cstats["tokens_est"] > token_budget:  # even 4 lines per function does not fit
        raise CartographerError(f"corpus is ~{cstats['tokens_est']:,} tokens (est), over the "
                                f"{token_budget:,} budget even when trimmed; pass limit=")
    messages = [{"role": "system", "content": SYSTEM_PROMPT}, {"role": "user", "content": USER_PREFIX + corpus}]
    t0 = time.time()
    if chat is not None:
        r = chat(messages)
    elif provider == "subq":
        r = subq_chat(cfg, messages, max_tokens=max_tokens)
    else:
        r = _meta_chat(cfg, messages, max_tokens)
    elapsed = time.time() - t0

    raw_header = extract_header(r["content"])
    header, vinfo = validate(raw_header)
    summary = summarize(split_decls(header))
    out_path.parent.mkdir(parents=True, exist_ok=True)
    banner = (f"/* types.h proposed by the Cartographer ({'SubQ ' + str(r.get('model')) if provider == 'subq' else 'META FALLBACK (not SubQ) ' + str(r.get('model'))}),"
              f" whole-program pass over {cstats['n_functions']} functions, ~{r.get('tin') or cstats['tokens_est']:,} tokens in."
              f" {vinfo['dropped']} declarations dropped by the compile check. */\n")
    out_path.write_text(banner + header, encoding="utf-8")
    (run_dir / "cartographer.raw.txt").write_text(r["content"], encoding="utf-8")

    source = SOURCE_SUBQ if provider == "subq" else SOURCE_META
    n_fns = cstats["n_functions"]
    covered = len(set(summary["signature_ids"]) & {f["id"] for f in _functions(target, scope, limit)})
    tin_real = int(r.get("tin") or 0)
    stats = {
        "source": source, "provider": provider, "model": r.get("model"),
        "tokens_in": tin_real or cstats["tokens_est"], "tokens_in_source": "usage" if tin_real else "estimate",
        "tokens_out": int(r.get("tout") or 0), "tokens_in_est": cstats["tokens_est"],
        "cost_usd": r.get("cost") if provider == "meta" else None,  # SubQ publishes no subq-preview price yet
        "finish_reason": r.get("finish_reason"), "elapsed_s": round(elapsed, 2),
        "n_functions": n_fns, "n_recovered": cstats["n_recovered"], "corpus_chars": cstats["chars"],
        "full_disassembly": cstats["full_disassembly"], "line_cap": cstats["line_cap"],
        "n_structs": summary["n_structs"], "n_signatures": summary["n_signatures"],
        "functions_covered": covered, "coverage_pct": round(100 * covered / n_fns, 1) if n_fns else 0.0,
        "n_globals": summary["n_globals"], "n_global_arrays": summary["n_global_arrays"],
        "n_global_scalars": summary["n_global_scalars"],
        "dropped": vinfo["dropped"], "compiled": vinfo["compiled"], "compiler": vinfo["compiler"],
        "compile_rounds": vinfo["rounds"], "dropped_decls": vinfo["dropped_decls"][:50],
        "header_path": _rel(out_path), "corpus": cstats,
    }
    (run_dir / "cartographer.json").write_text(json.dumps(stats, indent=2), encoding="utf-8")
    if log is not None:
        log.emit("types.proposed", actor="cartographer", source=source, structs=stats["n_structs"],
                 signatures=stats["n_signatures"], header_path=stats["header_path"], tokens_in=stats["tokens_in"],
                 n_functions=n_fns, dropped=stats["dropped"], model=stats["model"],
                 coverage_pct=stats["coverage_pct"], compiled=stats["compiled"], elapsed_s=stats["elapsed_s"],
                 full_disassembly=stats["full_disassembly"])
    return stats


# --------------------------------------------------------------------------------------------- CLI

def _load_recovered(run_dir: Path) -> dict[str, str]:
    d = run_dir / "recovered"
    return {p.stem: safe_read(p) for p in sorted(d.glob("fn_*.c"))} if d.is_dir() else {}


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(prog="python -m crew.cartographer", description=__doc__.split("\n")[0])
    ap.add_argument("--run-dir", required=True, type=Path)
    ap.add_argument("--provider", choices=["subq", "meta"], default="subq")
    ap.add_argument("--dry-run", action="store_true", help="build the corpus and print stats; no API call")
    ap.add_argument("--limit", type=int, default=None, help="only the first N functions by address (smoke tests)")
    ap.add_argument("--scope", default="game", choices=["game", "library", "all"])
    ap.add_argument("--out", type=Path, default=None)
    ap.add_argument("--emit", action="store_true", help="append types.proposed to <run-dir>/events.jsonl")
    ap.add_argument("--token-budget", type=int, default=DEFAULT_TOKEN_BUDGET,
                    help="trim every function to a common line cap if the estimate exceeds this")
    a = ap.parse_args(argv)
    cfg = Config()
    target = Target(cfg)
    run_dir = a.run_dir if a.run_dir.is_absolute() else ROOT / a.run_dir
    recovered = _load_recovered(run_dir)
    if a.dry_run:
        _, stats = build_corpus(target, recovered, scope=a.scope, limit=a.limit, token_budget=a.token_budget)
        print(json.dumps(stats, indent=2))
        return 0
    log = None
    if a.emit:
        from .events import EventLog
        log = EventLog(run_dir, run_dir.name)
    try:
        stats = propose(cfg, target, recovered, log, a.provider, run_dir=run_dir, out_path=a.out,
                        scope=a.scope, limit=a.limit, token_budget=a.token_budget)
    except CartographerError as e:
        print(f"cartographer: {e}", file=sys.stderr)
        return 2
    finally:
        if log is not None:
            log.close()
    print(json.dumps({k: v for k, v in stats.items() if k not in ("dropped_decls", "corpus")}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
