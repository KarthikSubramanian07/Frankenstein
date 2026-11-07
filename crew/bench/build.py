"""Build the real-compiler bench: python3 crew/bench/build.py

Reads the answer key (crew/bench/answers/, one function per .c file plus data.c and bench.h), compiles it
with the bench flags, and writes everything the crew and the bench referee need into crew/bench/out/:

  out/manifest.json      contract section 3 shape (validates against contracts/schemas/manifest.schema.json)
  out/asm/<id>.s         anonymized disassembly (offsets, local labels, relocations as fn_/data_ ids)
  out/ctx/<id>.h         anonymized context header: typedefs, structs, externs and callee prototypes
  out/targets.json       target bytes, relocation keys and instruction units (what the referee compares to)
  out/bench.bin          all functions laid out at their fake addresses (the bench "ROM" for rom_sha1)

The id -> original name mapping goes only to crew/bench/answers/names.json (inside the guarded answer dir).
"""
from __future__ import annotations

import hashlib
import json
import random
import re
import sys
import tempfile
from pathlib import Path

if __package__ in (None, ""):
    sys.path.insert(0, str(Path(__file__).resolve().parents[2]))

from crew.bench.core import (BENCH, FLAGS_STR, OUT, ROOT, compile_c, compiler_version, defined_functions,
                             defined_objects, disasm, extract, read_elf)

ANSWERS = BENCH / "answers"
BASE_ADDR = 0x08000200
SEED = 7
SALT = "frankenstein-bench-2026-11-07"
PRIM = {"u8": 1, "s8": 1, "u16": 2, "s16": 2, "u32": 4, "s32": 4, "fixed_t": 4, "int": 4, "char": 1, "short": 2}
TYPEDEFS = """typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef signed char s8;
typedef short s16;
typedef int s32;
typedef s32 fixed_t;
"""
IDENT = re.compile(r"\b[A-Za-z_]\w*\b")


def h(name: str, n: int = 8) -> str:
    return hashlib.sha1(f"{SALT}:{name}".encode()).hexdigest()[:n].upper()


def strip_comments(src: str) -> str:
    return re.sub(r"/\*.*?\*/|//[^\n]*", " ", src, flags=re.S)


# ------------------------------------------------------------------------------------------- bench.h parse

def parse_header(text: str) -> list[dict]:
    """Blocks: {kind: struct|extern|proto, name, text, fields?}. Primitive typedefs are fixed (TYPEDEFS)."""
    body = strip_comments(text)
    blocks = []
    for m in re.finditer(r"typedef\s+struct\s+(\w+)\s*\{(.*?)\}\s*(\w+)\s*;", body, re.S):
        assert m.group(1) == m.group(3), "struct tag and typedef name must match"
        fields = []
        for fm in re.finditer(r"([\w\s\*]+?)\s*(\b\w+)\s*(\[\s*\d+\s*\])?\s*;", m.group(2)):
            fields.append({"type": " ".join(fm.group(1).split()), "name": fm.group(2), "array": fm.group(3) or ""})
        blocks.append({"kind": "struct", "name": m.group(1), "text": m.group(0), "fields": fields})
    for m in re.finditer(r"^extern\s+([^;]*?)\b(\w+)\s*(\[[^\]]*\])?\s*;", body, re.M):
        blocks.append({"kind": "extern", "name": m.group(2), "text": m.group(0)})
    for m in re.finditer(r"^(?!typedef|extern|#)([\w][\w\s\*]*?)\b(\w+)\s*\(([^)]*)\)\s*;", body, re.M):
        blocks.append({"kind": "proto", "name": m.group(2), "text": m.group(0), "ret": m.group(1).strip(),
                       "params": m.group(3)})
    order = {b["text"]: body.index(b["text"]) for b in blocks}
    blocks.sort(key=lambda b: order[b["text"]])
    return blocks


def layout(block: dict, structs: dict) -> list[int]:
    off, offs, max_al = 0, [], 1
    for f in block["fields"]:
        t = f["type"].replace("const ", "")
        if "*" in t:
            sz = al = 4
        elif t in PRIM:
            sz = al = PRIM[t]
        else:
            raise ValueError(f"bench.h field type {t!r} not supported by build.py layout")
        n = int(f["array"].strip("[] ") or 1)
        off = (off + al - 1) // al * al
        offs.append(off)
        off += sz * n
        max_al = max(max_al, al)
    return offs


def strip_param_names(params: str) -> str:
    out = []
    for p in params.split(","):
        p = " ".join(p.split())
        if p in ("", "void"):
            out.append(p or "void")
            continue
        m = re.match(r"^(.*?[\s\*])(\w+)$", p)
        out.append((m.group(1).strip() if m and m.group(1).strip() else p).replace(" *", " *"))
    return ", ".join(out)


# ------------------------------------------------------------------------------------------------- build

def main() -> dict:
    header_text = (ANSWERS / "bench.h").read_text()
    blocks = parse_header(header_text)
    structs = {b["name"]: b for b in blocks if b["kind"] == "struct"}
    sources = sorted(p for p in ANSWERS.glob("*.c"))

    with tempfile.TemporaryDirectory(prefix="bench-build-") as td:
        td = Path(td)
        objs = {}
        for src in sources:
            o = td / (src.stem + ".o")
            r = compile_c(src, o, cwd=ANSWERS)
            if r.returncode != 0:
                raise SystemExit(f"answer {src.name} failed to compile:\n{r.stderr}")
            objs[src] = o

        funcs = {}  # name -> (src, obj, sym)
        data_names = set()
        for src, o in objs.items():
            elf = read_elf(o)
            fs = defined_functions(elf)
            if src.name != "data.c" and len(fs) != 1:
                raise SystemExit(f"{src.name}: expected exactly one function, found {[f.name for f in fs]}")
            for f in fs:
                funcs[f.name] = (src, o, f, elf)
            data_names |= {s.name for s in defined_objects(elf)}

        # ---- names
        order = sorted(funcs, key=lambda n: h(n))
        addr, ids = BASE_ADDR, {}
        for n in order:
            ids[n] = f"fn_{addr:08X}"
            addr += (funcs[n][2].size + 3) & ~3
        rename = dict(ids)
        for b in blocks:
            if b["kind"] == "extern":
                rename[b["name"]] = f"data_{h(b['name'])}"
        for n in data_names:
            rename.setdefault(n, f"data_{h(n)}")
        field_off = {}
        for s in structs.values():
            rename[s["name"]] = f"struct_{h(s['name'], 6)}"
            for f, off in zip(s["fields"], layout(s, structs)):
                assert f["name"] not in rename, f"field name {f['name']} must be unique in bench.h"
                rename[f["name"]] = f"f_{off:02X}"
                field_off[(s["name"], f["name"])] = off
        originals = set(rename) - {v for v in rename.values()}
        _verify_layout(td, field_off)

        def anon(sym: str) -> str:
            if sym in rename:
                return rename[sym]
            if sym.startswith("__"):  # libgcc helpers (__aeabi_idiv, ...) keep their public names
                return sym
            raise SystemExit(f"relocation to unknown symbol {sym!r}; declare it in bench.h")

        def anon_text(t: str) -> str:
            return IDENT.sub(lambda m: rename.get(m.group(0), m.group(0)), t)

        # ---- per-function extraction
        cver = compiler_version()
        OUT.mkdir(exist_ok=True)
        (OUT / "asm").mkdir(exist_ok=True)
        (OUT / "ctx").mkdir(exist_ok=True)
        for old in list((OUT / "asm").glob("fn_*.s")) + list((OUT / "ctx").glob("fn_*.h")):
            old.unlink()
        targets, entries, blob = {}, [], bytearray()
        for n in order:
            src, o, sym, elf = funcs[n]
            fid = ids[n]
            fn = extract(elf, sym, anon)
            units = disasm(o, sym.value & ~1, sym.size, fn.relocs)
            if sum(u["len"] for u in units) != fn.size:
                raise SystemExit(f"{fid}: disassembly does not cover the function")
            callees = sorted({r["key"] for r in fn.relocs.values() if r["key"].startswith("fn_")})
            globals_ = sorted({r["key"] for r in fn.relocs.values() if r["key"].startswith("data_")})
            libcalls = sorted({r["key"] for r in fn.relocs.values() if r["key"].startswith("__")})
            ninsn = sum(1 for u in units if not u["text"].startswith(".word"))
            branches = sum(1 for u in units if u["target"] is not None or u["text"].startswith(("mov pc", "bx r", "bl ")))
            targets[fid] = {"size": fn.size, "code": fn.code.hex(),
                            "relocs": {str(k): v for k, v in fn.relocs.items()},
                            "units": [{k: u[k] for k in ("off", "len", "hex", "text")} for u in units]}
            entries.append({"id": fid, "addr": f"0x{int(fid[3:], 16):08X}", "size": fn.size, "mode": "thumb",
                            "scope": "game", "asm_path": f"crew/bench/out/asm/{fid}.s", "callees": callees,
                            "callers": [], "globals": globals_, "libcalls": libcalls, "insns": ninsn,
                            "difficulty": round(min(1.0, 0.55 * min(1.0, fn.size / 96) + 0.035 * branches
                                                    + 0.06 * (len(callees) + len(libcalls))), 2)})
            a = int(fid[3:], 16) - BASE_ADDR
            blob += b"\0" * (a - len(blob))
            blob += fn.code
            (OUT / "asm" / f"{fid}.s").write_text(asm_text(fid, fn, units, cver))
            (OUT / "ctx" / f"{fid}.h").write_text(
                ctx_text(fid, n, fn.size, src.read_text(), blocks, anon_text, cver, callees, globals_))
        by_id = {e["id"]: e for e in entries}
        for e in entries:
            for c in e["callees"]:
                by_id[c]["callers"].append(e["id"])
        # ---- split: ~30% heldout, stratified by size (3 of every 10 by size), fixed seed
        rng = random.Random(SEED)
        ranked = sorted(entries, key=lambda e: (e["size"], e["id"]))
        held = set()
        for i in range(0, len(ranked), 10):
            chunk = ranked[i:i + 10]
            held |= {e["id"] for e in rng.sample(chunk, round(len(chunk) * 0.3))}
        for e in entries:
            e["split"] = "heldout" if e["id"] in held else "train"
            e["callers"].sort()

        rom_sha1 = hashlib.sha1(bytes(blob)).hexdigest()
        (OUT / "bench.bin").write_bytes(bytes(blob))
        manifest = {
            "v": 1,
            "bench": True,
            "game": {"id": "bench", "title": "FRANKENSTEIN real-compiler bench (original functions written 2026-11-07)",
                     "license": "MIT (written today for FRANKENSTEIN; not Doom code)",
                     "rom_path": "crew/bench/out/bench.bin", "rom_sha1": rom_sha1,
                     "compiler": {"name": "GNU Arm Embedded GCC (Homebrew arm-none-eabi-gcc)", "version": cver,
                                  "flags": FLAGS_STR}},
            "functions": [{k: e[k] for k in ("id", "addr", "size", "mode", "scope", "split", "asm_path", "callees",
                                             "callers", "difficulty", "insns", "globals", "libcalls")}
                          for e in entries],
        }
        (OUT / "manifest.json").write_text(json.dumps(manifest, indent=1) + "\n")
        (OUT / "targets.json").write_text(json.dumps({"v": 1, "compiler": cver, "flags": FLAGS_STR,
                                                      "rom_sha1": rom_sha1, "functions": targets}, indent=0) + "\n")
        (ANSWERS / "names.json").write_text(json.dumps(
            {"functions": {ids[n]: {"name": n, "file": funcs[n][0].name} for n in order},
             "rename": rename}, indent=1) + "\n")
        _leak_check(originals)
        print(f"bench: {len(entries)} functions, {len(held)} heldout, {cver} {FLAGS_STR}, rom_sha1 {rom_sha1}")
        return manifest


def _verify_layout(td: Path, field_off: dict) -> None:
    """Prove the computed field offsets (used for the f_XX names) with the real compiler."""
    lines = ['#include "bench.h"']
    for i, ((s, f), off) in enumerate(field_off.items()):
        lines.append(f"_Static_assert(__builtin_offsetof({s}, {f}) == {off}, \"{s}.{f}\");")
    p = td / "layout_probe.c"
    p.write_text("\n".join(lines) + "\n")
    r = compile_c(p, td / "layout_probe.o", extra=[f"-I{ANSWERS}"])
    if r.returncode != 0:
        raise SystemExit(f"struct layout check failed:\n{r.stderr}")


def asm_text(fid: str, fn, units: list[dict], cver: str) -> str:
    targets = {u["target"] for u in units if u["target"] is not None}
    for r in fn.relocs.values():
        if r["show"].startswith(".L") and not r["show"].startswith(".Ltab"):
            targets.add(int(r["show"][2:], 16))
    for blk in fn.rodata:
        for w in blk["words"]:
            if re.fullmatch(r"\.L[0-9a-f]+", w):
                targets.add(int(w[2:], 16))
    lit = {int(m.group(1), 16) for u in units for m in [re.search(r"@ =\.L([0-9a-f]+)", u["text"])] if m}
    lines = [f"@ {fid}: thumb, {fn.size} bytes. Bench target (original code written today), not GBADoom.",
             f"@ compiled with {cver} {FLAGS_STR}",
             "@ columns: offset, bytes (as objdump shows them), instruction. Calls and data are fn_/data_ ids;",
             "@ __aeabi_* are libgcc helpers; .Lxx labels are offsets inside this function.",
             f"{fid}:"]
    for u in units:
        if u["off"] in targets or u["off"] in lit:
            lines.append(f".L{u['off']:x}:")
        lines.append(f"  {u['off']:04x}:  {u['hex']:<9} {u['text']}")
    for blk in fn.rodata:
        lines.append(f"@ read-only data referenced by this function")
        lines.append(f"{blk['label']}:")
        for i in range(0, len(blk["words"]), 4):
            lines.append("  .word " + ", ".join(blk["words"][i:i + 4]))
    return "\n".join(lines) + "\n"


def ctx_text(fid: str, name: str, size: int, src: str, blocks: list[dict], anon_text, cver: str,
             callees: list[str], globals_: list[str]) -> str:
    toks = set(IDENT.findall(strip_comments(src)))
    names = {b["name"]: b for b in blocks}
    need = set()
    stack = [t for t in toks if t in names and t != name]
    while stack:
        t = stack.pop()
        if t in need:
            continue
        need.add(t)
        stack += [x for x in IDENT.findall(names[t]["text"]) if x in names and x not in need and x != name]
    out = [f"/* Context for {fid} (thumb, {size} bytes). Generated by crew/bench/build.py (bench target). */",
           f"/* Define exactly one function named {fid}. Compiled as: {cver} {FLAGS_STR} */",
           f"/* Callees: {', '.join(callees) or 'none'}. Globals: {', '.join(globals_) or 'none'}. */",
           "", TYPEDEFS.rstrip(), ""]
    for b in blocks:
        if b["name"] not in need:
            continue
        if b["kind"] == "struct":
            body = "\n".join(f"    {f['type']} {f['name']}{f['array']};" for f in b["fields"])
            out.append(anon_text(f"typedef struct {b['name']} {{\n{body}\n}} {b['name']};"))
        elif b["kind"] == "extern":
            out.append(anon_text(" ".join(b["text"].split())))
        else:
            out.append(anon_text(f"{b['ret']} {b['name']}({strip_param_names(b['params'])});"))
    return "\n".join(out) + "\n"


def _leak_check(originals: set[str]) -> None:
    bad = []
    for p in [OUT / "manifest.json", OUT / "targets.json", *(OUT / "asm").glob("*.s"), *(OUT / "ctx").glob("*.h")]:
        toks = set(IDENT.findall(p.read_text()))
        leaked = toks & originals
        if leaked:
            bad.append(f"{p.relative_to(ROOT)}: {sorted(leaked)}")
    if bad:
        raise SystemExit("original names leaked into out/:\n" + "\n".join(bad))


if __name__ == "__main__":
    main()
