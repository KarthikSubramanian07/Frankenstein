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
PASTE_SUFFIXES = ("Predef", "_id")  # predef X -> XPredef, tx_pre X -> X_id

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
    syms = {n.split()[-1] for n in (SRC / SYM).read_text().splitlines() if n and not n.startswith(";")}
    return {"rom": rom, "ext": ext, "ids": ids, "syms": syms}


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


# --- inline data -------------------------------------------------------------------------------
# A statement is "data" if it is db/dw/dl/ds or a pokered macro that emits any of them (text, dw_const,
# text_far, ...), "neutral" if it emits nothing (IF, assert, DEF, ...), and "code" otherwise.
DATA_BASE = {"db", "dw", "dl", "ds"}
NEUTRAL_BASE = {"if", "elif", "else", "endc", "assert", "static_assert", "fail", "warn", "print", "println", "def",
                "redef", "export", "purge", "charmap", "newcharmap", "setcharmap", "pushc", "popc", "opt", "pusho",
                "popo", "section", "rept", "for", "endr", "endm", "macro", "shift", "union", "nextu", "endu", "load",
                "endl", "pushs", "pops", "include", "incbin", "rsreset", "rsset", "rb", "rw", "break"}
DATA_MARK, CODE_MARK = ".Fkd_", ".Fkc_"  # zero-byte local labels used to measure data runs
LABEL_PREFIX_RE = re.compile(r"^\s*(?:[A-Za-z_][A-Za-z0-9_]*)?(?:\.[A-Za-z0-9_]+)?::?|^\.[A-Za-z0-9_]+\b")


@lru_cache(maxsize=1)
def macro_kinds() -> dict[str, str]:
    """pokered macro name (lowercase) -> 'data' | 'code' | 'neutral', iterated to a fixpoint."""
    bodies, cur = {}, None
    for path in sorted((SRC / "macros").rglob("*.asm")):
        for raw in path.read_text(errors="replace").splitlines():
            line = raw.split(";", 1)[0].strip()
            if m := re.match(r"MACRO\??\s+([A-Za-z_][A-Za-z0-9_]*)", line, re.I):
                cur = m.group(1).lower()
                bodies[cur] = []
            elif line.upper() == "ENDM":
                cur = None
            elif cur and line:
                bodies[cur].append(line)
    kinds = {k: "neutral" for k in bodies}
    for _ in range(10):
        new = {k: _body_kind(v, kinds) for k, v in bodies.items()}
        if new == kinds:
            break
        kinds = new
    return kinds


def stmt_kind(line: str, kinds: dict[str, str] | None = None) -> str | None:
    """Classify one source line (comment already stripped). None for blank/label-only lines."""
    kinds = macro_kinds() if kinds is None else kinds
    rest = LABEL_PREFIX_RE.sub("", line, count=1).strip() if line[:1] in "._" or line[:1].isalpha() and not line[:1].isspace() else line.strip()
    if not rest:
        return None
    parts = rest.replace(",", " ").split()
    word = parts[0].lower()
    if word in DATA_BASE:
        return "data"
    if word in NEUTRAL_BASE or (len(parts) > 1 and parts[1].lower() in ("equ", "equs", "=", "rb", "rw")):
        return "neutral"
    return kinds.get(word, "code")


def _body_kind(lines: list[str], kinds: dict[str, str]) -> str:
    found = {stmt_kind(l, kinds) for l in lines}
    return "data" if "data" in found else "code" if "code" in found else "neutral"


def mark_runs(lines: list[str], in_routine: bool = True) -> list[str]:
    """Insert zero-byte local labels where data runs start (DATA_MARK) and end (CODE_MARK).
    Labels emit no bytes, so the ROM is unchanged and the .sym gives each run's exact address."""
    out, state, depth, n = [], None, 0, 0
    for raw in lines:
        line = raw.split(";", 1)[0]
        g = GLOBAL_LABEL_RE.match(raw)
        if g:
            in_routine, state = True, None
        word = line.strip().split()[0].lower() if line.strip() else ""
        if word in ("rept", "for", "macro"):
            depth += 1
        elif word in ("endr", "endm"):
            depth -= 1
        kind = stmt_kind(line) if line.strip() else None
        if in_routine and depth == 0 and kind in ("data", "code") and kind != state and not (g and line[g.end():].strip()):
            if kind == "data" or state == "data":
                out.append(f"{DATA_MARK if kind == 'data' else CODE_MARK}{n}")
                n += 1
            state = kind
        out.append(raw)
    return out


def _runs(local: dict[str, int], start: int, end: int) -> list[tuple[int, int]]:
    """Data runs [s, e) as offsets, from marker label addresses inside one routine."""
    marks = sorted((a, k) for k, a in local.items() if k.startswith((DATA_MARK[1:], CODE_MARK[1:])) and start <= a < end)
    runs = []
    for i, (a, k) in enumerate(marks):
        if k.startswith(DATA_MARK[1:]):
            e = next((b for b, _ in marks[i + 1:] if b > a), end)
            if e > a:
                runs.append((a - start, e - start))
    return runs


def local_syms(tree: Path, name: str) -> dict[str, int]:
    """Local labels of one global label from a build's .sym: suffix -> addr."""
    out = {}
    for line in (tree / SYM).read_text().splitlines():
        parts = line.split()
        if len(parts) == 2 and parts[1].startswith(name + ".") and ":" in parts[0]:
            out[parts[1][len(name) + 1:]] = int(parts[0].split(":")[1], 16)
    return out


DATA_RANGES = SRC / "data_ranges.json"


def build_data_ranges() -> dict[str, list[list[int]]]:
    """One instrumented build of the original source: id -> data runs [[start, end), ...] as offsets.
    The marked build must reproduce the reference ROM byte for byte."""
    with tempfile.TemporaryDirectory(prefix="pokered_ranges_") as tmp:
        tree = Path(tmp) / "pokered"
        shutil.copytree(SRC, tree, ignore=shutil.ignore_patterns(".git", "*.o"), symlinks=True)
        marked_files = []
        for path in tree.rglob("*.asm"):
            rel = str(path.relative_to(tree))
            if rel.startswith("macros/") or path.name == "rgbdscheck.asm":
                continue
            lines = path.read_text(errors="replace").splitlines()
            marked = mark_runs(lines, in_routine=False)
            if marked != lines:
                path.write_text("\n".join(marked) + "\n")
                marked_files.append(rel)
        for _ in range(5):  # files whose macros define labels can't take markers: restore them and retry
            proc = subprocess.run(["make", "red"], cwd=tree, capture_output=True, text=True, timeout=BUILD_TIMEOUT_S)
            log = proc.stdout + proc.stderr
            bad = {f for f in marked_files if f in log}
            if proc.returncode == 0 or not bad:
                break
            for f in bad:
                shutil.copy(SRC / f, tree / f)
                marked_files.remove(f)
        if proc.returncode != 0 or (tree / ROM).read_bytes() != reference()["rom"]:
            raise RuntimeError("marked build failed or changed the ROM:\n" + (proc.stdout + proc.stderr)[-2000:])
        by_scope: dict[str, dict[str, int]] = {}
        for line in (tree / SYM).read_text().splitlines():
            parts = line.split()
            if len(parts) == 2 and ":" in parts[0] and (DATA_MARK in parts[1] or CODE_MARK in parts[1]):
                scope, label = parts[1].split(".", 1)
                by_scope.setdefault(scope, {})[label] = int(parts[0].split(":")[1], 16)
    out = {}
    for name, (bank, addr, size) in reference()["ext"].items():
        if runs := _runs(by_scope.get(name, {}), addr, addr + size):
            out[rid(bank, addr)] = [list(r) for r in runs]
    DATA_RANGES.write_text(json.dumps(out, sort_keys=True) + "\n")
    return out


@lru_cache(maxsize=1)
def all_data_ranges() -> dict[str, list[list[int]]]:
    return json.loads(DATA_RANGES.read_text()) if DATA_RANGES.exists() else build_data_ranges()


def data_ranges(routine_id: str) -> list[list[int]]:
    """Byte offsets [start, end) inside the original routine that hold inline data (crew-visible)."""
    return all_data_ranges().get(routine_id, [])


def lint(asm_src: str, routine_id: str | None = None) -> dict:
    """Static rules. db/dw/dl and data macros pass only if the original routine has inline data;
    check() then verifies after the build that every data run sits inside the original's data ranges."""
    violations = []
    allow_data = bool(routine_id and data_ranges(routine_id))
    for n, raw in enumerate(asm_src.splitlines(), 1):
        line = raw.split(";", 1)[0].strip()
        if not line:
            continue
        if GLOBAL_LABEL_RE.match(raw) and not ID_RE.fullmatch(GLOBAL_LABEL_RE.match(raw).group(1)):
            violations.append(f"line {n}: global label not allowed (use .local labels)")
        if line.startswith((DATA_MARK, CODE_MARK)):
            violations.append(f"line {n}: reserved label")
        word = line.split()[0].lower().rstrip(":")
        if word in ("db", "dw", "dl") or (word not in FORBIDDEN and stmt_kind(line) == "data"):
            if not allow_data:
                violations.append(f"line {n}: data '{word}' not allowed (original routine has no inline data)")
        elif word in FORBIDDEN or (len(line.split()) > 1 and line.split()[1].lower() in ("equ", "equs", "=")):
            violations.append(f"line {n}: directive '{word}' not allowed")
    return {"ok": not violations, "violations": violations}


def data_violations(routine_id: str, local: dict[str, int], addr: int, size: int) -> list[str]:
    """Candidate data runs (from the scratch build's markers) that fall outside the original's data ranges."""
    allowed = data_ranges(routine_id)
    return [f"data at +{s}..+{e} outside the original data ranges {allowed}"
            for s, e in _runs(local, addr, addr + size)
            if not any(a <= s and e <= b for a, b in allowed)]


def _splice(tree: Path, name: str, routine_id: str, asm_src: str) -> dict[str, str]:
    """Splice the candidate body under the routine's label; return {original name: id} for log scrubbing."""
    rel, start, end = source_index()[name]
    lines = (tree / rel).read_text().splitlines()
    body = asm_src.splitlines()
    # Drop the routine's own label wherever the candidate put it (after a header comment, say): the tree has it.
    body = [l for l in body if not ((m := GLOBAL_LABEL_RE.match(l)) and m.group(1) in (routine_id, name))]
    ids = reference()["ids"]
    tokens = sorted({m.group(0) for m in ID_RE.finditer(asm_src)})
    # Known ids alias the real label (so BANK(), farcall and moved code behave as in the original);
    # unknown ids (RAM, mid-routine addresses) become plain address constants.
    defs = [f'DEF {t} EQUS "{ids[t]}"' if t in ids else f"DEF {t} EQU ${t[6:]}" for t in tokens]
    # predef/tx_pre paste a suffix onto their argument (\1Predef, \1_id), so alias those names as well.
    syms = reference()["syms"]
    extra = {f"{t}{sfx}": f"{ids[t]}{sfx}" for t in tokens if t in ids for sfx in PASTE_SUFFIXES
             if f"{ids[t]}{sfx}" in syms}
    defs += [f'DEF {k} EQUS "{v}"' for k, v in extra.items()]
    new = lines[:start] + defs + [lines[start]] + mark_runs(body) + lines[end:]
    (tree / rel).write_text("\n".join(new) + "\n")
    return ({ids[t]: t for t in tokens if t in ids} | {v: k for k, v in extra.items()}
            | {name: routine_id, rel: "<context>"})


def check(routine_id: str, asm_src: str) -> dict:
    started = time.time()
    ref = reference()
    if routine_id not in ref["ids"]:
        raise KeyError(f"unknown routine {routine_id}")
    name = ref["ids"][routine_id]
    bank, addr, size = ref["ext"][name]
    target = ref["rom"][rom_offset(bank, addr):rom_offset(bank, addr) + size]
    result = {"v": 1, "fn": routine_id, "bank": bank, "size": size, "status": "LINT_FAIL", "match_pct": 0.0,
              "first_diff": None, "diff": [], "lint": lint(asm_src, routine_id), "compile": {"ok": False, "log": ""},
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
                if bad := data_violations(routine_id, local_syms(tree, name), na, nsize):
                    result["status"] = "LINT_FAIL"
                    result["lint"] = {"ok": False, "violations": bad}
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


class HttpReferee:
    """What `python -m lab.referee serve --game pokered` serves: /check and /context/<id> for the slice."""
    game = {"id": "pokered"}
    ctx_dir = REPO / "lab" / "out" / "games" / "pokered" / "ctx"

    def check(self, fn: str, src: str) -> dict:
        return check(fn, src)

    def context(self, fn: str) -> str:
        if not re.fullmatch(r"rt_[0-9a-f]{2}_[0-9a-f]{4}", fn):
            raise KeyError(fn)
        return (self.ctx_dir / f"{fn}.inc").read_text()


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
    if len(sys.argv) >= 2 and sys.argv[1] == "ranges":
        r = build_data_ranges()
        print(f"{len(r)} labels with inline data, {sum(e - s for v in r.values() for s, e in v)} data bytes")
        sys.exit(0)
    if len(sys.argv) >= 2 and sys.argv[1] == "selftest":
        sys.exit(0 if selftest() else 1)
    if len(sys.argv) == 4 and sys.argv[1] == "check":
        res = check(sys.argv[2], Path(sys.argv[3]).read_text())
        print(json.dumps(res, indent=2))
        sys.exit(0 if res["status"] == "MATCH" else 1)
    sys.exit(__doc__)
