"""Pokemon Red (pret/pokered) routine referee: assembly byte matching per routine.

check(routine_id, asm_src) splices a candidate routine body into a scratch copy of the
pokered source tree, rebuilds pokered.gbc with RGBDS, and compares the routine's bytes
against the reference build. The result has the same shape as the Doom referee
(status, match_pct, first_diff, lint, compile).

Routine ids are rt_BB_AAAA (ROM bank, address, lowercase hex) from the reference .sym.
A candidate may reference other code/data by id (any xx_BB_AAAA token); the referee
defines those as address constants, so original names never need to reach the crew.

Usage:
  python3 lab/pokered/referee.py check rt_01_42dd candidate.asm
  python3 lab/pokered/referee.py selftest
"""
from __future__ import annotations

import json
import re
import shutil
import subprocess
import sys
import tempfile
import time
from functools import lru_cache
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
SRC = REPO / "lab" / "secrets" / "pokered"
ROM, SYM, MAP = "pokered.gbc", "pokered.sym", "pokered.map"
ROM_SHA1 = "ea9bcae617fdf159b045185467ae58b2e4a48b9a"  # pret roms.sha1, pokered.gbc
BUILD_TIMEOUT_S = 300
MAX_DIFF = 64

ID_RE = re.compile(r"\b[a-z]{2}_([0-9a-f]{2})_([0-9a-f]{4})\b")
GLOBAL_LABEL_RE = re.compile(r"^([A-Za-z_][A-Za-z0-9_]*)::?")
SECTION_RE = re.compile(r"^\s*SECTION\b", re.I)
MAP_BANK_RE = re.compile(r"^ROM(?:0|X) bank #(\d+):")
MAP_SECTION_RE = re.compile(r"^\s+SECTION: \$([0-9a-f]{4})(?:-\$([0-9a-f]{4}))?")
# Directives that would let a candidate emit raw bytes or reshape the build instead of writing code.
FORBIDDEN = ("db", "dw", "dl", "ds", "incbin", "include", "section", "pushs", "pops", "load", "endl",
             "macro", "endm", "def", "redef", "equ", "equs", "rept", "for", "endr", "union", "nextu",
             "endu", "opt", "pusho", "popo", "charmap", "newcharmap", "setcharmap", "purge", "export")


def rid(bank: int, addr: int) -> str:
    return f"rt_{bank:02x}_{addr:04x}"


def rom_offset(bank: int, addr: int) -> int:
    return addr if bank == 0 else bank * 0x4000 + (addr - 0x4000)


def load_syms(tree: Path) -> dict[str, tuple[int, int]]:
    """Global ROM labels -> (bank, addr). Local (.x) labels and RAM symbols are dropped."""
    out = {}
    for line in (tree / SYM).read_text().splitlines():
        if line.startswith(";") or not line.strip():
            continue
        loc, name = line.split(maxsplit=1)
        if ":" not in loc:  # exported constants, not addresses
            continue
        bank, addr = (int(x, 16) for x in loc.split(":"))
        if "." not in name and addr < 0x8000:
            out[name] = (bank, addr)
    return out


def section_ends(tree: Path) -> dict[tuple[int, int], int]:
    """(bank, section start) -> exclusive end address, from the linker map."""
    ends, bank = {}, None
    for line in (tree / MAP).read_text().splitlines():
        if m := MAP_BANK_RE.match(line):
            bank = int(m.group(1))
        elif bank is not None and (m := MAP_SECTION_RE.match(line)):
            start = int(m.group(1), 16)
            ends[(bank, start)] = int(m.group(2), 16) + 1 if m.group(2) else start
        elif line and not line[0].isspace():
            bank = None
    return ends


def extents(tree: Path) -> dict[str, tuple[int, int, int]]:
    """name -> (bank, addr, size): up to the next global label in the bank, capped at the section end."""
    syms, ends = load_syms(tree), section_ends(tree)
    by_bank: dict[int, list[tuple[int, str]]] = {}
    for name, (bank, addr) in syms.items():
        by_bank.setdefault(bank, []).append((addr, name))
    sec_by_bank: dict[int, list[tuple[int, int]]] = {}
    for (bank, start), end in ends.items():
        sec_by_bank.setdefault(bank, []).append((start, end))
    out = {}
    for bank, items in by_bank.items():
        items.sort()
        for i, (addr, name) in enumerate(items):
            nxt = next((a for a, _ in items[i + 1:] if a > addr), 0x8000 if bank else 0x4000)
            sec_end = next((e for s, e in sec_by_bank.get(bank, []) if s <= addr < e), nxt)
            out[name] = (bank, addr, min(nxt, sec_end) - addr)
    return out


@lru_cache(maxsize=1)
def reference() -> dict:
    """Reference build: ROM bytes, extents, and the id <-> name tables (names stay in this process)."""
    rom = (SRC / ROM).read_bytes()
    import hashlib
    sha = hashlib.sha1(rom).hexdigest()
    if sha != ROM_SHA1:
        raise RuntimeError(f"reference {ROM} sha1 {sha} != pret {ROM_SHA1}; rebuild with `make red`")
    ext = extents(SRC)
    ids = {rid(b, a): n for n, (b, a, _) in ext.items()}
    return {"rom": rom, "ext": ext, "ids": ids}


@lru_cache(maxsize=1)
def source_index() -> dict[str, tuple[str, int, int]]:
    """Global label -> (relative file, label line index, end line index exclusive)."""
    index = {}
    for path in SRC.rglob("*.asm"):
        if ".git" in path.parts:
            continue
        lines = path.read_text(errors="replace").splitlines()
        starts = [(i, m.group(1)) for i, l in enumerate(lines) if (m := GLOBAL_LABEL_RE.match(l))]
        for k, (i, name) in enumerate(starts):
            end = starts[k + 1][0] if k + 1 < len(starts) else len(lines)
            sec = next((j for j in range(i + 1, end) if SECTION_RE.match(lines[j])), end)
            index[name] = (str(path.relative_to(SRC)), i, sec)
    return index


def original_body(routine_id: str) -> str:
    """Hidden original source body (tests only; never exposed to the crew)."""
    name = reference()["ids"][routine_id]
    rel, start, end = source_index()[name]
    return "\n".join((SRC / rel).read_text().splitlines()[start + 1:end]) + "\n"


def lint(asm_src: str) -> dict:
    violations = []
    for n, raw in enumerate(asm_src.splitlines(), 1):
        line = raw.split(";", 1)[0].strip()
        if not line:
            continue
        if GLOBAL_LABEL_RE.match(raw) and not ID_RE.fullmatch(GLOBAL_LABEL_RE.match(raw).group(1)):
            violations.append(f"line {n}: global label not allowed (use .local labels)")
        word = line.split()[0].lower().rstrip(":")
        if word in FORBIDDEN or (len(line.split()) > 1 and line.split()[1].lower() in ("equ", "equs", "=")):
            violations.append(f"line {n}: directive '{word}' not allowed")
    return {"ok": not violations, "violations": violations}


def _splice(tree: Path, name: str, routine_id: str, asm_src: str) -> dict[str, str]:
    """Splice the candidate body under the routine's label; return {original name: id} for log scrubbing."""
    rel, start, end = source_index()[name]
    lines = (tree / rel).read_text().splitlines()
    body = asm_src.splitlines()
    if body and GLOBAL_LABEL_RE.match(body[0]) and GLOBAL_LABEL_RE.match(body[0]).group(1) in (routine_id, name):
        body = body[1:]
    ids = reference()["ids"]
    tokens = sorted({m.group(0) for m in ID_RE.finditer(asm_src)})
    # Known ids alias the real label (so BANK(), farcall and moved code behave as in the original);
    # unknown ids (RAM, mid-routine addresses) become plain address constants.
    defs = [f'DEF {t} EQUS "{ids[t]}"' if t in ids else f"DEF {t} EQU ${t[6:]}" for t in tokens]
    new = lines[:start] + defs + [lines[start]] + body + lines[end:]
    (tree / rel).write_text("\n".join(new) + "\n")
    return {ids[t]: t for t in tokens if t in ids} | {name: routine_id, rel: "<context>"}


def check(routine_id: str, asm_src: str) -> dict:
    started = time.time()
    ref = reference()
    if routine_id not in ref["ids"]:
        raise KeyError(f"unknown routine {routine_id}")
    name = ref["ids"][routine_id]
    bank, addr, size = ref["ext"][name]
    target = ref["rom"][rom_offset(bank, addr):rom_offset(bank, addr) + size]
    result = {"v": 1, "fn": routine_id, "bank": bank, "size": size, "status": "LINT_FAIL", "match_pct": 0.0,
              "first_diff": None, "diff": [], "lint": lint(asm_src), "compile": {"ok": False, "log": ""},
              "elapsed_ms": 0, "referee": "pokered-asm-v1"}
    if result["lint"]["ok"]:
        with tempfile.TemporaryDirectory(prefix="pokered_ref_") as tmp:
            tree = Path(tmp) / "pokered"
            shutil.copytree(SRC, tree, ignore=shutil.ignore_patterns(".git"), symlinks=True)
            scrub = _splice(tree, name, routine_id, asm_src)
            proc = subprocess.run(["make", "red"], cwd=tree, capture_output=True, text=True, timeout=BUILD_TIMEOUT_S)
            log = proc.stdout + proc.stderr
            for secret in sorted(scrub, key=len, reverse=True):
                log = re.sub(rf"\b{re.escape(secret)}\b", scrub[secret], log)
            result["compile"] = {"ok": proc.returncode == 0, "log": log[-4000:]}
            if proc.returncode != 0:
                result["status"] = "NO_COMPILE"
            else:
                nb, na, nsize = extents(tree)[name]
                rom = (tree / ROM).read_bytes()
                got = rom[rom_offset(nb, na):rom_offset(nb, na) + nsize]
                result.update(_compare(target, got))
    result["elapsed_ms"] = int((time.time() - started) * 1000)
    return result


def _compare(target: bytes, got: bytes) -> dict:
    diff = [{"offset": i, "expected": f"{t:02x}", "got": f"{got[i]:02x}" if i < len(got) else "",
             "expected_ins": None, "got_ins": None}
            for i, t in enumerate(target) if i >= len(got) or got[i] != t]
    if len(got) > len(target):
        diff.append({"offset": len(target), "expected": "", "got": got[len(target):len(target) + 8].hex(),
                     "expected_ins": "(end of routine)", "got_ins": None})
    matched = sum(1 for i, t in enumerate(target) if i < len(got) and got[i] == t)
    exact = not diff
    return {"status": "MATCH" if exact else "PARTIAL",
            "match_pct": round(100.0 * matched / len(target), 1) if target else 0.0,
            "first_diff": diff[0] if diff else None, "diff": diff[:MAX_DIFF], "got_size": len(got)}


def one_byte_edit(body: str) -> str:
    """Flip one same-size opcode: the first bare `ret` (c9) becomes `reti` (d9)."""
    lines = body.splitlines()
    for i, l in enumerate(lines):
        if l.split(";", 1)[0].strip() == "ret":
            lines[i] = l.replace("ret", "reti", 1)
            return "\n".join(lines) + "\n"
    raise ValueError("no bare ret to edit")


SELFTEST_IDS = ("rt_01_4496", "rt_01_44dd", "rt_01_5bff", "rt_01_5e8a", "rt_01_609e")


def selftest() -> bool:
    ok = True
    for routine_id in SELFTEST_IDS:
        body = original_body(routine_id)
        same, edited = check(routine_id, body), check(routine_id, one_byte_edit(body))
        good = same["status"] == "MATCH" and edited["status"] == "PARTIAL"
        ok &= good
        print(f"{routine_id} size={same['size']:4d} original={same['status']:<9} one-byte-edit={edited['status']:<8} "
              f"({edited['match_pct']}%, first_diff={edited['first_diff'] and edited['first_diff']['offset']}) "
              f"{'ok' if good else 'FAIL'}")
    print("SELFTEST", "PASS" if ok else "FAIL")
    return ok


if __name__ == "__main__":
    if len(sys.argv) >= 2 and sys.argv[1] == "selftest":
        sys.exit(0 if selftest() else 1)
    if len(sys.argv) == 4 and sys.argv[1] == "check":
        res = check(sys.argv[2], Path(sys.argv[3]).read_text())
        print(json.dumps(res, indent=2))
        sys.exit(0 if res["status"] == "MATCH" else 1)
    sys.exit(__doc__)
