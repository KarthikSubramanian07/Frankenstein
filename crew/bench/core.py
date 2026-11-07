"""Shared machinery for the real-compiler bench: toolchain, a stdlib ELF32 reader, function extraction,
relocation-aware comparison, and anonymized disassembly text.

Nothing in this module reads the answer key. build.py reads it once and writes crew/bench/out/; the bench
referee only ever reads crew/bench/out/ plus the candidate it is given.
"""
from __future__ import annotations

import hashlib
import os
import re
import shutil
import struct
import subprocess
from dataclasses import dataclass, field
from pathlib import Path

BENCH = Path(__file__).resolve().parent
ROOT = BENCH.parent.parent
OUT = BENCH / "out"

FLAGS = ["-O2", "-mthumb", "-mthumb-interwork", "-mcpu=arm7tdmi", "-ffreestanding", "-fno-builtin"]
FLAGS_STR = " ".join(FLAGS)


def _tool(name: str, env_var: str) -> str:
    override = os.environ.get(env_var)
    if override:
        return override
    found = shutil.which(name)
    if found:
        return found
    for d in ("/opt/homebrew/bin", "/usr/local/bin", "/opt/devkitpro/devkitARM/bin"):
        p = Path(d) / name
        if p.exists():
            return str(p)
    raise RuntimeError(f"{name} not found; install it with `brew install arm-none-eabi-gcc` or set {env_var}")


def cc() -> str:
    return _tool("arm-none-eabi-gcc", "BENCH_CC")


def objdump() -> str:
    return _tool("arm-none-eabi-objdump", "BENCH_OBJDUMP")


_VERSION: str | None = None


def compiler_version() -> str:
    """e.g. 'arm-none-eabi-gcc 16.2.0'."""
    global _VERSION
    if _VERSION is None:
        out = subprocess.run([cc(), "-dumpversion"], capture_output=True, text=True, check=True).stdout.strip()
        _VERSION = f"arm-none-eabi-gcc {out}"
    return _VERSION


def compile_c(src_path: Path, out_path: Path, include: Path | None = None, extra: list[str] | None = None,
              cwd: Path | None = None, timeout: float = 20) -> subprocess.CompletedProcess:
    cmd = [cc(), *FLAGS, *(extra or [])]
    if include is not None:
        cmd += ["-include", str(include)]
    cmd += ["-c", str(src_path), "-o", str(out_path)]
    return subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, cwd=cwd)


# --------------------------------------------------------------------------------------------- ELF32 (REL)

R_TYPES = {2: "R_ARM_ABS32", 10: "R_ARM_THM_CALL", 28: "R_ARM_CALL", 29: "R_ARM_JUMP24", 30: "R_ARM_THM_JUMP24",
           3: "R_ARM_REL32", 11: "R_ARM_THM_PC8", 102: "R_ARM_THM_JUMP11", 103: "R_ARM_THM_JUMP8"}


@dataclass
class Section:
    index: int
    name: str
    type: int
    offset: int
    size: int
    link: int
    info: int
    data: bytes = b""


@dataclass
class Symbol:
    name: str
    value: int
    size: int
    type: int  # 0 notype, 1 object, 2 func, 3 section
    bind: int  # 0 local, 1 global, 2 weak
    shndx: int


@dataclass
class Reloc:
    offset: int
    type: int
    sym: Symbol


@dataclass
class Elf:
    sections: list[Section]
    symbols: list[Symbol]
    relocs: dict[int, list[Reloc]] = field(default_factory=dict)  # target section index -> relocs

    def section(self, name: str) -> Section | None:
        return next((s for s in self.sections if s.name == name), None)


def read_elf(path: Path) -> Elf:
    b = Path(path).read_bytes()
    if b[:4] != b"\x7fELF" or b[4] != 1 or b[5] != 1:
        raise ValueError("not a little-endian ELF32 object")
    (e_shoff,) = struct.unpack_from("<I", b, 0x20)
    e_shentsize, e_shnum, e_shstrndx = struct.unpack_from("<HHH", b, 0x2E)
    raw = []
    for i in range(e_shnum):
        nm, ty, _fl, _ad, off, sz, link, info, _al, _es = struct.unpack_from("<10I", b, e_shoff + i * e_shentsize)
        raw.append((nm, ty, off, sz, link, info))
    shstr = raw[e_shstrndx]
    strtab_sh = b[shstr[2]:shstr[2] + shstr[3]]

    def cstr(tab: bytes, o: int) -> str:
        return tab[o:tab.index(b"\0", o)].decode()

    sections = []
    for i, (nm, ty, off, sz, link, info) in enumerate(raw):
        data = b[off:off + sz] if ty != 8 else b"\0" * sz  # SHT_NOBITS
        sections.append(Section(i, cstr(strtab_sh, nm), ty, off, sz, link, info, data))
    symbols: list[Symbol] = []
    symtab = next((s for s in sections if s.type == 2), None)
    if symtab is not None:
        strtab = sections[symtab.link].data
        for o in range(0, symtab.size, 16):
            nm, val, sz, info, _other, shndx = struct.unpack_from("<IIIBBH", symtab.data, o)
            name = cstr(strtab, nm)
            stype, bind = info & 15, info >> 4
            if stype == 3:
                name = sections[shndx].name
            symbols.append(Symbol(name, val, sz, stype, bind, shndx))
    elf = Elf(sections, symbols)
    for s in sections:
        if s.type == 9:  # SHT_REL
            rl = []
            for o in range(0, s.size, 8):
                off, info = struct.unpack_from("<II", s.data, o)
                rl.append(Reloc(off, info & 0xFF, symbols[info >> 8]))
            elf.relocs[s.info] = rl
    return elf


def find_function(elf: Elf, name: str) -> Symbol | None:
    for s in elf.symbols:
        if s.name == name and s.type == 2 and s.shndx not in (0, 0xFFF1, 0xFFF2):
            return s
    return None


def defined_functions(elf: Elf) -> list[Symbol]:
    return [s for s in elf.symbols if s.type == 2 and s.bind in (1, 2) and 0 < s.shndx < 0xFF00]


def defined_objects(elf: Elf) -> list[Symbol]:
    return [s for s in elf.symbols if s.type == 1 and s.bind in (1, 2) and 0 < s.shndx < 0xFF00]


# ------------------------------------------------------------------------------------- function extraction

@dataclass
class Func:
    """One function's machine code, with relocations reduced to comparable keys."""
    size: int
    code: bytes
    relocs: dict[int, dict]  # offset in function -> {"type", "key", "mask", "show"}
    rodata: list[dict]  # referenced read-only blocks, for display: {"label", "words"}


def _section_fingerprint(elf: Elf, sec_index: int, text_index: int, fn_start: int, rename) -> tuple[str, list[str]]:
    """Hash of a referenced data section with its own relocations normalised (jump tables -> function offsets)."""
    sec = elf.sections[sec_index]
    data = bytearray(sec.data)
    words_show = []
    rel = {r.offset: r for r in elf.relocs.get(sec_index, [])}
    parts = []
    for off in range(0, len(data) - len(data) % 4, 4):
        (w,) = struct.unpack_from("<I", data, off)
        r = rel.get(off)
        if r is None:
            words_show.append(f"0x{w:08x}")
            parts.append(f"{w:08x}")
        elif r.sym.type == 3 and r.sym.shndx == text_index:
            words_show.append(f".L{w - fn_start:x}")
            parts.append(f"self+{w - fn_start:x}")
        else:
            nm = rename(r.sym.name) if r.sym.type != 3 else r.sym.name
            words_show.append(f"{nm}+0x{w:x}" if w else nm)
            parts.append(f"{nm}+{w:x}")
    if len(data) % 4:
        parts.append(data[len(data) - len(data) % 4:].hex())
    h = hashlib.sha1("|".join(parts).encode()).hexdigest()[:12]
    return h, words_show


def extract(elf: Elf, sym: Symbol, rename=lambda n: n) -> Func:
    """rename maps raw symbol names to display/compare names (target side: original -> anonymized id)."""
    text = elf.sections[sym.shndx]
    start = sym.value & ~1
    size = sym.size
    code = text.data[start:start + size]
    relocs: dict[int, dict] = {}
    rodata: list[dict] = []
    seen_sec: dict[int, str] = {}
    for r in elf.relocs.get(sym.shndx, []):
        if not (start <= r.offset < start + size):
            continue
        off = r.offset - start
        tname = R_TYPES.get(r.type, f"R_{r.type}")
        if r.sym.type == 3:  # section-relative
            (w,) = struct.unpack_from("<I", text.data, r.offset) if r.type == 2 else (0,)
            if r.sym.shndx == sym.shndx:
                key = f"self+{w - start:x}"
                show = f".L{w - start:x}"
            else:
                fp, words = _section_fingerprint(elf, r.sym.shndx, sym.shndx, start, rename)
                if r.sym.shndx not in seen_sec:
                    label = f".Ltab{len(seen_sec)}"
                    seen_sec[r.sym.shndx] = label
                    rodata.append({"label": label, "words": words})
                label = seen_sec[r.sym.shndx]
                key = f"sec:{fp}+{w:x}"
                show = label + (f"+0x{w:x}" if w else "")
            relocs[off] = {"type": tname, "key": key, "mask": r.type == 2, "show": show}
        else:
            nm = rename(r.sym.name)
            if r.type == 2:
                (w,) = struct.unpack_from("<I", text.data, r.offset)
                show = nm + (f"+0x{w:x}" if w else "")
            else:
                show = nm
            relocs[off] = {"type": tname, "key": nm, "mask": False, "show": show}
    return Func(size, code, relocs, rodata)


# --------------------------------------------------------------------------------------------- disassembly

_LINE = re.compile(r"^\s*([0-9a-f]+):\t([0-9a-f ]+?)\s*\t(.*)$")
_BRANCH = re.compile(r"^(b(?:eq|ne|cs|cc|hs|lo|mi|pl|vs|vc|hi|ls|ge|lt|gt|le|al)?(?:\.n|\.w)?)\s+([0-9a-f]+)\s*<[^>]*>")
_PCREL = re.compile(r"\[pc, #(-?\d+)\]\s*@\s*\(([0-9a-f]+)\s*<[^>]*>\)")
_ANGLE = re.compile(r"\s*<[^>]*>")


def disasm(obj: Path, start: int, size: int, relocs: dict[int, dict]) -> list[dict]:
    """Instruction units of [start, start+size) in .text: {off, len, hex, text, target} with anonymized text."""
    out = subprocess.run([objdump(), "-d", "-z", "-w", "-j", ".text", str(obj)],
                         capture_output=True, text=True, timeout=20, check=True).stdout
    units = []
    for line in out.splitlines():
        m = _LINE.match(line)
        if not m:
            continue
        addr = int(m.group(1), 16)
        if not (start <= addr < start + size):
            continue
        hx = m.group(2).replace(" ", "")
        ins = m.group(3).strip()
        off = addr - start
        target = None
        bm = _BRANCH.match(ins)
        rel = relocs.get(off)
        if rel is not None and rel["type"] in ("R_ARM_THM_CALL", "R_ARM_CALL", "R_ARM_THM_JUMP24", "R_ARM_JUMP24"):
            ins = f"{ins.split()[0]}\t{rel['show']}"
        elif ins.startswith(".word") and rel is not None:
            ins = f".word\t{rel['show']}"
        elif bm:
            target = int(bm.group(2), 16) - start
            ins = f"{bm.group(1)}\t.L{target:x}"
        else:
            pm = _PCREL.search(ins)
            if pm:
                lit = int(pm.group(2), 16) - start
                lit_rel = relocs.get(lit)
                note = f"=.L{lit:x}" + (f" ({lit_rel['show']})" if lit_rel else "")
                ins = _PCREL.sub(f"[pc, #{pm.group(1)}]\t@ {note}", ins)
            ins = _ANGLE.sub("", ins)
        ins = re.sub(r"\s+", " ", ins.replace("\t", " ")).strip()
        units.append({"off": off, "len": len(hx) // 2, "hex": hx, "text": ins, "target": target})
    return units


# --------------------------------------------------------------------------------------------- comparison

def compare(target: dict, cand: Func, cand_units: list[dict] | None) -> dict:
    """target: entry from out/targets.json. Returns status fields: match_pct, first_diff, diff, status."""
    tcode = bytes.fromhex(target["code"])
    trel = {int(k): v for k, v in target["relocs"].items()}
    units = target["units"]
    cu = {u["off"]: u for u in (cand_units or [])}
    ok = 0
    diffs = []
    for u in units:
        o, n = u["off"], u["len"]
        same = True
        for p in range(o, o + n):
            tr, cr = trel.get(p), cand.relocs.get(p)
            if (tr is None) != (cr is None) or (tr and (tr["type"] != cr["type"] or tr["key"] != cr["key"])):
                same = False
        masked = any(trel.get(p, {}).get("mask") for p in range(o, o + n))  # section-relative words: key compared instead
        if same and not masked and cand.code[o:o + n] != tcode[o:o + n]:
            same = False
        if o + n > cand.size:
            same = False
        if same:
            ok += 1
        else:
            got = cand.code[o:o + n]
            g = cu.get(o)
            diffs.append({"offset": o, "expected": u["hex"],
                          "got": (g["hex"] if g else _hexlike(got, n)) if got else "",
                          "expected_ins": u["text"],
                          "got_ins": g["text"] if g else ("(past end of function)" if not got else "(no instruction starts here)")})
    if cand.size > target["size"]:
        extra = [x for x in (cand_units or []) if x["off"] >= target["size"]]
        for x in extra:
            diffs.append({"offset": x["off"], "expected": "", "got": x["hex"], "expected_ins": "(past end of function)",
                          "got_ins": x["text"]})
    pct = round(100.0 * ok / max(1, len(units)), 1)
    match = not diffs and cand.size == target["size"]
    if not match and pct == 100.0:
        pct = 99.9
    return {"status": "MATCH" if match else "PARTIAL", "match_pct": 100.0 if match else pct,
            "first_diff": diffs[0] if diffs else None, "diff": diffs[:64]}


def _hexlike(b: bytes, n: int) -> str:
    if n == 2 and len(b) == 2:
        return f"{struct.unpack('<H', b)[0]:04x}"
    if n == 4 and len(b) == 4:
        return f"{struct.unpack('<I', b)[0]:08x}"
    return b.hex()
