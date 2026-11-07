"""Machine drafts for big functions: m2c (matt-kempster/m2c) turns the target's Thumb asm into rough C.

Human decomp projects (pokeemerald, sm64 and the rest) start big functions from a machine-generated draft
instead of reading raw asm. The Digger gets the same head start: for functions over about 150 bytes its first
message carries m2c's output, labelled for what it is (control flow usually right, types and registers not).

m2c is GPL-3.0, so it is never vendored or imported here: we run it as an external program from a pinned
checkout (runs/_tools/m2c, cloned on first use, or $M2C_PATH pointing at m2c.py). Its output is a hint in a
prompt, never submitted as-is; acceptance is still the referee's byte-identical MATCH.

The referee's asm is objdump output; m2c reads GNU as. `to_gas` converts: labels for branch targets and
literal pools, `ldr rX, .Lpool` for pc-relative loads, symbols for calls and `.word` pool entries.
"""
from __future__ import annotations

import os
import re
import subprocess
import sys
import tempfile
import threading
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
M2C_REPO = "https://github.com/matt-kempster/m2c.git"
M2C_COMMIT = "c632946b8cfbe8fce442b522dba92dfa72f1f317"  # pinned 2026-11-07
CONVERTER_VERSION = 1
MAX_DRAFT_CHARS = 14000  # a 1,164-byte function drafts to about 12 KB; anything bigger is cut, not dropped

INSN = re.compile(r"^\s*([0-9a-f]+):\s+(?:[0-9a-f]{4} [0-9a-f]{4}|[0-9a-f]{8}|[0-9a-f]{4})\s+(\S+)\s*(.*)$")
PCREL = re.compile(r"\[pc, #-?\d+\]\s*@ \(([0-9a-f]+)")
DIRECT = re.compile(r"^([0-9a-f]+) <")
CALLS = ("bl", "blx")
_LOCK = threading.Lock()


def to_gas(objdump: str, name: str) -> str:
    """objdump -d text of one Thumb function -> GNU as source that m2c's gba target parses."""
    rows = []
    for line in objdump.splitlines():
        m = INSN.match(line)
        if m:
            rows.append((int(m.group(1), 16), m.group(2), m.group(3).strip()))
    targets = set()
    for _a, op, args in rows:
        m = DIRECT.match(args)
        if m and op.startswith("b") and op not in CALLS + ("bx",):
            targets.add(int(m.group(1), 16))
        m = PCREL.search(args)
        if m:
            targets.add(int(m.group(1), 16))
    out = ["\t.syntax unified", "\t.code 16", ".text", "\t.thumb_func", f"\t.globl {name}", f"{name}:"]
    for a, op, args in rows:
        if a in targets:
            out.append(f".L{a:x}:")
        if op == ".word":
            m = re.search(r"@\s*(\S+)", args)
            val = m.group(1) if m and re.match(r"[A-Za-z_]", m.group(1)) else args.split()[0]
            out.append(f"\t.word {val}")
            continue
        if op.startswith("."):
            out.append(f"\t{op} {args.split('@')[0].strip()}")
            continue
        m = PCREL.search(args)
        if m:
            args = re.sub(r"\[pc, #-?\d+\].*$", f".L{int(m.group(1), 16):x}", args)
        elif op in CALLS and "<" in args:
            args = re.search(r"<([^>+]+)", args).group(1)
        elif op.startswith("b") and DIRECT.match(args):
            args = f".L{int(args.split()[0], 16):x}"
        else:
            args = args.split("@")[0].strip()
        out.append(f"\t{re.sub(r'[.][nw]$', '', op)} {args}".rstrip())
    return "\n".join(out) + "\n"


def m2c_path(fetch: bool = True) -> Path | None:
    env = os.environ.get("M2C_PATH")
    if env:
        return Path(env) if Path(env).exists() else None
    path = ROOT / "runs" / "_tools" / "m2c" / "m2c.py"
    if path.exists() or not fetch:
        return path if path.exists() else None
    with _LOCK:
        if not path.exists():
            dest = path.parent
            dest.parent.mkdir(parents=True, exist_ok=True)
            try:
                subprocess.run(["git", "clone", "-q", M2C_REPO, str(dest)], check=True, timeout=120,
                               capture_output=True)
                subprocess.run(["git", "-C", str(dest), "checkout", "-q", M2C_COMMIT], check=True, timeout=60,
                               capture_output=True)
            except (subprocess.SubprocessError, OSError):
                return None
    return path if path.exists() else None


def clean(c: str) -> str | None:
    """None when m2c failed outright; otherwise the draft, trimmed to the prompt budget."""
    if not c.strip() or "Decompilation failure" in c[:400]:
        return None
    if len(c) > MAX_DRAFT_CHARS:
        c = c[:MAX_DRAFT_CHARS].rsplit("\n", 1)[0] + "\n/* ... draft truncated ... */\n"
    return c


def get_draft(fn: str, asm: str | None = None, *, cache_dir: Path | None = None, timeout: float = 60) -> str | None:
    """m2c's draft of `fn` (cached under runs/_drafts/), or None when m2c is unavailable or fails."""
    cache_dir = cache_dir or ROOT / "runs" / "_drafts"
    cached = cache_dir / f"{fn}.v{CONVERTER_VERSION}.{M2C_COMMIT[:8]}.c"
    if cached.exists():
        return clean(cached.read_text())
    if asm is None:
        p = ROOT / "lab" / "out" / "asm" / f"{fn}.s"
        if not p.exists():
            return None
        asm = p.read_text()
    tool = m2c_path()
    if tool is None:
        return None
    with tempfile.TemporaryDirectory() as d:
        s = Path(d) / f"{fn}.s"
        s.write_text(to_gas(asm, fn))
        try:
            proc = subprocess.run([sys.executable, str(tool), "-t", "gba", str(s)], capture_output=True, text=True,
                                  timeout=timeout)
        except subprocess.TimeoutExpired:
            return None
    text = proc.stdout if proc.returncode == 0 else ""
    cache_dir.mkdir(parents=True, exist_ok=True)
    cached.write_text(text)  # failures are cached too (empty file): m2c is deterministic
    return clean(text)


if __name__ == "__main__":
    for f in sys.argv[1:]:
        d = get_draft(f)
        print(f"/* {f}: {'no draft' if d is None else f'{len(d)} chars'} */")
        if d:
            print(d)
