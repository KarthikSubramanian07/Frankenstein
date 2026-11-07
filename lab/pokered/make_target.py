"""Write the crew-shaped Pokemon Red target: lab/out/games/pokered/{manifest.json, asm/<id>.s, ctx/<id>.inc}.

The asm is a fresh SM83 disassembly of each slice routine's bytes in the reference ROM, in RGBDS syntax:
other routines appear as rt_ ids, in-routine branch targets as .l_AAAA, everything else as numbers.
No original label, comment or file name is emitted; the run ends with a scan against names_slice.json.

  python3 lab/pokered/make_target.py
"""
from __future__ import annotations

import hashlib
import json
import re
import sys

from make_slice import callees
from referee import REPO, ROM_SHA1, SRC, reference, rid, rom_offset, source_index

OUT = REPO / "lab" / "out" / "games" / "pokered"
OUT_REL = "lab/out/games/pokered"
SPLIT_SEED, HELDOUT_PCT = 7, 20

R8 = ("b", "c", "d", "e", "h", "l", "[hl]", "a")
R16 = ("bc", "de", "hl", "sp")
R16S = ("bc", "de", "hl", "af")
CC = ("nz", "z", "nc", "c")
ALU = ("add a,", "adc a,", "sub", "sbc a,", "and", "xor", "or", "cp")
CB_OPS = ("rlc", "rrc", "rl", "rr", "sla", "sra", "swap", "srl")
INVALID = {0xD3, 0xDB, 0xDD, 0xE3, 0xE4, 0xEB, 0xEC, 0xED, 0xF4, 0xFC, 0xFD}
FIXED = {0x00: "nop", 0x02: "ld [bc], a", 0x12: "ld [de], a", 0x22: "ld [hli], a", 0x32: "ld [hld], a",
         0x0A: "ld a, [bc]", 0x1A: "ld a, [de]", 0x2A: "ld a, [hli]", 0x3A: "ld a, [hld]",
         0x07: "rlca", 0x0F: "rrca", 0x17: "rla", 0x1F: "rra", 0x27: "daa", 0x2F: "cpl", 0x37: "scf", 0x3F: "ccf",
         0x76: "halt", 0xC9: "ret", 0xD9: "reti", 0xE9: "jp hl", 0xF9: "ld sp, hl", 0xF3: "di", 0xFB: "ei",
         0xE2: "ldh [c], a", 0xF2: "ldh a, [c]"}


def decode(b: bytes, i: int):
    """-> (length, template, operand kind, operand value). Templates use {} for the operand."""
    op = b[i]
    n8 = b[i + 1] if i + 1 < len(b) else 0
    n16 = n8 | (b[i + 2] << 8) if i + 2 < len(b) else 0
    e8 = n8 - 256 if n8 > 127 else n8
    if op in INVALID:
        return 1, f"db ${op:02x}", None, None
    if op in FIXED:
        return 1, FIXED[op], None, None
    if op == 0xCB:
        x, y, r = n8 >> 6, (n8 >> 3) & 7, R8[n8 & 7]
        return 2, (f"{CB_OPS[y]} {r}" if x == 0 else f"{('bit', 'res', 'set')[x - 1]} {y}, {r}"), None, None
    if op == 0x10:
        return 2, "stop", None, None
    if op == 0x08:
        return 3, "ld [${:04x}], sp", "n16", n16
    if op == 0x18:
        return 2, "jr {}", "rel", e8
    if op in (0x20, 0x28, 0x30, 0x38):
        return 2, f"jr {CC[(op >> 3) & 3]}, {{}}", "rel", e8
    if op < 0x40:
        lo, rr = op & 0xF, R16[op >> 4]
        if lo == 1:
            return 3, f"ld {rr}, {{}}", "imm16", n16
        if lo == 3:
            return 1, f"inc {rr}", None, None
        if lo == 9:
            return 1, f"add hl, {rr}", None, None
        if lo == 0xB:
            return 1, f"dec {rr}", None, None
        r = R8[op >> 3]
        if op & 7 == 4:
            return 1, f"inc {r}", None, None
        if op & 7 == 5:
            return 1, f"dec {r}", None, None
        return 2, f"ld {r}, ${n8:02x}", "n8", n8
    if op < 0x80:
        return 1, f"ld {R8[(op >> 3) & 7]}, {R8[op & 7]}", None, None
    if op < 0xC0:
        return 1, f"{ALU[(op >> 3) & 7]} {R8[op & 7]}", None, None
    lo = op & 7
    cc = CC[(op >> 3) & 3]
    if op in (0xE0, 0xF0):
        return 2, ("ldh [${:04x}], a" if op == 0xE0 else "ldh a, [${:04x}]"), "n16", 0xFF00 + n8
    if op in (0xE8, 0xF8):
        return 2, ("add sp, {}" if op == 0xE8 else "ld hl, sp + {}"), "n8s", e8
    if op in (0xEA, 0xFA):
        return 3, ("ld [${:04x}], a" if op == 0xEA else "ld a, [${:04x}]"), "n16", n16
    if op == 0xC3:
        return 3, "jp {}", "abs", n16
    if op == 0xCD:
        return 3, "call {}", "abs", n16
    if lo == 0:
        return 1, f"ret {cc}", None, None
    if lo == 1:
        return 1, f"pop {R16S[(op >> 4) & 3]}", None, None
    if lo == 5:
        return 1, f"push {R16S[(op >> 4) & 3]}", None, None
    if lo == 6:
        return 2, f"{ALU[(op >> 3) & 7]} ${n8:02x}", "n8", n8
    if lo == 7:
        return 1, f"rst ${op & 0x38:02x}", None, None
    if lo == 2:
        return 3, f"jp {cc}, {{}}", "abs", n16
    if lo == 4:
        return 3, f"call {cc}, {{}}", "abs", n16
    raise ValueError(f"undecoded opcode {op:02x}")


def disassemble(bank: int, addr: int, size: int, rom: bytes, labels: set[tuple[int, int]]):
    """-> (lines, inline_data flag). labels: (bank, addr) of every global ROM label."""
    start = rom_offset(bank, addr)
    code = rom[start:start + size]
    ins, i = [], 0
    while i < size:
        n, tpl, kind, val = decode(code, i)
        if i + n > size:  # trailing bytes that don't form a whole instruction
            n, tpl, kind, val = 1, f"db ${code[i]:02x}", None, None
        ins.append((addr + i, n, tpl, kind, val))
        i += n
    starts = {a for a, *_ in ins}
    data = any(t.startswith("db ") for _, _, t, _, _ in ins)

    def target(t: int) -> str:
        if t in starts and t != addr:
            return f".l_{t:04x}"
        tb = 0 if t < 0x4000 else bank
        return rid(tb, t) if (tb, t) in labels else f"${t:04x}"

    out, local = [], set()
    rendered = []
    prev_bank = None  # value of a preceding `ld b/a, n`: the bank of a following far pointer
    for a, n, tpl, kind, val in ins:
        if kind in ("rel", "abs"):
            t = a + n + val if kind == "rel" else val
            arg = target(t)
            if arg.startswith(".l_"):
                local.add(t)
        elif kind == "imm16":
            tb = 0 if val < 0x4000 else bank
            tb = prev_bank if (prev_bank, val) in labels else tb  # far pointer after `ld b/a, BANK`
            arg = rid(tb, val) if val < 0x8000 and (tb, val) in labels else f"${val:04x}"
        elif kind == "n8s":
            arg = str(val)
        else:
            arg = val
        text = tpl.format(arg) if kind else tpl
        if kind == "n8s" and val < 0 and "sp +" in text:
            text = text.replace(f"sp + {val}", f"sp - {-val}")
        prev_bank = val if kind == "n8" and tpl.startswith(("ld b,", "ld a,")) else None
        rendered.append((a, text))
    for a, text in rendered:
        if a in local:
            out.append(f".l_{a:04x}")
        out.append(f"\t{text}")
    return out, data


def main() -> None:
    ref, index = reference(), source_index()
    ext, ids, rom = ref["ext"], ref["ids"], ref["rom"]
    name_of = {v: k for k, v in ids.items()}  # name -> id
    labels = {(b, a) for b, a, _ in ext.values()}
    sl = json.loads((REPO / "lab/pokered/slice.json").read_text())
    units = [u for u in sl["routines"] if not u["boundary"]]
    in_slice = {u["id"] for u in units}
    (OUT / "asm").mkdir(parents=True, exist_ok=True)
    (OUT / "ctx").mkdir(parents=True, exist_ok=True)

    edges = {u["id"]: sorted({name_of[c] for c in callees(ids[u["id"]], index, ext)} & in_slice - {u["id"]})
             for u in units}
    callers = {u["id"]: sorted(k for k, v in edges.items() if u["id"] in v) for u in units}
    big = max(u["size"] for u in units)
    fns, n_data = [], 0
    for u in units:
        fid, bank, addr, size = u["id"], u["bank"], int(u["addr"], 16), u["size"]
        lines, data = disassemble(bank, addr, size, rom, labels)
        n_data += data
        head = f"; {fid}  bank ${bank:02x}  addr ${addr:04x}  {size} bytes  SM83"
        (OUT / "asm" / f"{fid}.s").write_text("\n".join([head, f"{fid}:"] + lines) + "\n")
        refs = sorted(set(re.findall(r"\brt_[0-9a-f]{2}_[0-9a-f]{4}\b", "\n".join(lines))) - {fid})
        (OUT / "ctx" / f"{fid}.inc").write_text(ctx_text(fid, bank, refs))
        h = int(hashlib.sha1(f"{SPLIT_SEED}:{fid}".encode()).hexdigest(), 16) % 100
        fns.append({"id": fid, "addr": f"0x{bank << 16 | addr:08X}", "size": size, "mode": "sm83", "scope": "game",
                    "split": "heldout" if h < HELDOUT_PCT else "train", "asm_path": f"{OUT_REL}/asm/{fid}.s",
                    "callees": edges[fid], "callers": callers[fid],
                    "difficulty": round(min(1.0, (size / big) ** 0.5), 3),
                    "bank": bank, "bank_addr": f"{addr:04x}", "inline_data": data})
    manifest = {"v": 1, "game": {
        "id": "pokered", "title": "Pokemon Red (pret/pokered build), title screen and main menu slice",
        "license": "Nintendo/Game Freak code; private research build, see lab/pokered/README.md",
        "rom_path": "lab/secrets/pokered/pokered.gbc", "rom_sha1": ROM_SHA1,
        "compiler": {"name": "RGBDS", "version": "1.0.4", "flags": "pret/pokered Makefile (make red)"},
        "language": "rgbds-sm83-asm", "id_scheme": "rt_BB_AAAA (bank, address, lowercase hex)"},
        "split_seed": SPLIT_SEED, "slice": sl["slice"], "functions": fns}
    (OUT / "manifest.json").write_text(json.dumps(manifest, indent=1) + "\n")
    leaks = scan()
    print(f"{len(fns)} routines, {n_data} with inline data, "
          f"{sum(f['split'] == 'heldout' for f in fns)} heldout; name scan: {len(leaks)} leaks")
    for leak in leaks[:20]:
        print("  LEAK", leak)
    sys.exit(1 if leaks else 0)


def ctx_text(fid: str, bank: int, refs: list[str]) -> str:
    lines = [f"; Context for {fid} (SM83, ROM bank ${bank:02x}). Generated by lab/pokered/make_target.py.",
             "; Your candidate is spliced into the full game source and assembled with RGBDS 1.0.4, so the",
             "; standard hardware constants and the project's instruction macros are already in scope.",
             f"; Define the routine as `{fid}:` and use .local labels inside it. No db/dw/ds, SECTION,",
             "; INCLUDE, MACRO, DEF/EQU or new global labels.",
             "; Refer to other code and data by id: any token xx_BB_AAAA is resolved by the referee",
             "; (known routine ids alias the real routine, so BANK(rt_..) and farcall rt_.. work; other",
             "; ids become the plain address). Numbers assemble to the same bytes too.",
             "; Routines this one references:"]
    lines += [f";   {r}" for r in refs] or [";   (none)"]
    return "\n".join(lines) + "\n"


def scan() -> list[str]:
    names = json.loads((SRC / "names_slice.json").read_text())
    words = {v["name"] for v in names.values()} | {v["file"] for v in names.values()}
    pat = re.compile("|".join(rf"(?<![A-Za-z0-9_]){re.escape(w)}(?![A-Za-z0-9_])" for w in sorted(words, key=len, reverse=True)))
    return [f"{p.relative_to(REPO)}: {m.group(0)}" for p in sorted(OUT.rglob("*")) if p.is_file()
            for m in pat.finditer(p.read_text())]


if __name__ == "__main__":
    main()
