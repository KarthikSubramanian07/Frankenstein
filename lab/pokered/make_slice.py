"""Build a slice: static call closure from entry points, stopping at boundary routines.

  python3 lab/pokered/make_slice.py                 # title screen + main menu -> slice.json
  python3 lab/pokered/make_slice.py interactions    # new game to the first rival battle -> slice_interactions.json

Each slice writes lab/pokered/<slice>.json (ids, banks, sizes, data ranges only: crew-readable) and
lab/secrets/pokered/names_<slice>.json (id -> original name/file: secret). Entry points, stop points and
the slice description live in lab/secrets/pokered/<config>.json because they are original names.

Edges: call/jp/jr, the far-call macros and predef; `dw`-style pointer entries in a routine's body; and
`ld r16, T` where T is a pointer table (every statement a dw/dw_const/dba/dbw), which covers
table-dispatch helpers and `jp hl` dispatch over named tables. Computed targets (pointers built at
runtime, tables indexed from another bank's data) are still missed.
"""
from __future__ import annotations

import json
import re
import sys

from referee import REPO, ROM_SHA1, SRC, data_ranges, reference, rid, source_index, stmt_kind

SLICES = {"title": ("slice_config.json", "slice.json", "names_slice.json"),
          "interactions": ("slice_config_interactions.json", "slice_interactions.json", "names_slice_interactions.json")}
EDGE_RE = re.compile(r"^\s*(?:call|jp|jr|farcall|callfar|farjp|jpfar|homecall|homecall_sf|predef|predef_jump)\s+"
                     r"(?:[a-z]+\s*,\s*)?([A-Za-z_][A-Za-z0-9_]*)", re.I)
PTR_RE = re.compile(r"^\s*(?:dw|dw_const|dba|dbw)\s+(.*)", re.I)
LD_TABLE_RE = re.compile(r"^\s*ld\s+(?:hl|de|bc)\s*,\s*([A-Za-z_][A-Za-z0-9_]*)\s*$", re.I)
NAME_RE = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")


def body(name: str, index: dict) -> list[str]:
    rel, start, end = index[name]
    return [l.split(";", 1)[0] for l in (SRC / rel).read_text().splitlines()[start + 1:end]]


def is_pointer_table(name: str, index: dict) -> bool:
    stmts = [l for l in body(name, index) if stmt_kind(l) in ("data", "code")]
    return bool(stmts) and all(PTR_RE.match(l) for l in stmts)


def callees(name: str, index: dict, ext: dict) -> set[str]:
    out = set()
    for l in body(name, index):
        if m := EDGE_RE.match(l):
            out.add(m.group(1))
        elif m := PTR_RE.match(l):
            out |= set(NAME_RE.findall(m.group(1)))
        elif (m := LD_TABLE_RE.match(l)) and m.group(1) in index and is_pointer_table(m.group(1), index):
            out.add(m.group(1))
    return {c for c in out if c in ext and c != name}


def kind(name: str, index: dict) -> str:
    return "code" if name not in index or any(stmt_kind(l) == "code" for l in body(name, index)) else "data"


def main(slice_name: str = "title") -> dict:
    cfg_file, out_file, names_file = SLICES[slice_name]
    cfg = json.loads((SRC / cfg_file).read_text())
    roots, stop = tuple(cfg["roots"]), set(cfg["stop"])
    ref, index = reference(), source_index()
    ext = ref["ext"]
    seen, depth, todo = set(), {}, [(r, 0) for r in roots]
    while todo:
        name, d = todo.pop(0)
        if name in seen:
            continue
        seen.add(name)
        depth[name] = d
        if name in stop or name not in index:
            continue
        todo += [(c, d + 1) for c in sorted(callees(name, index, ext))]
    rows = sorted(seen, key=lambda n: ext[n][:2])
    units = [{"id": rid(*ext[n][:2]), "bank": ext[n][0], "addr": f"{ext[n][1]:04x}", "size": ext[n][2],
              "depth": depth[n], "boundary": n in stop, "root": n in roots, "kind": kind(n, index),
              "data": data_ranges(rid(*ext[n][:2]))} for n in rows]
    inside = [u for u in units if not u["boundary"]]
    out = {"v": 2, "game": "pokered", "build_sha1": ROM_SHA1, "proof": "rgbds-1.0.4 per-routine byte match",
           "slice": cfg["slice"],
           "method": f"static call closure from {len(roots)} entry points; follows calls, far calls, predef and "
                     "named pointer tables (jump tables); runtime-computed targets not followed",
           "units": len(inside), "code_units": sum(u["kind"] == "code" for u in inside),
           "bytes": sum(u["size"] for u in inside), "banks": sorted({u["bank"] for u in inside}),
           "boundary_units": len(units) - len(inside), "routines": units}
    (REPO / "lab/pokered" / out_file).write_text(json.dumps(out, indent=1) + "\n")
    names = {rid(*ext[n][:2]): {"name": n, "file": index.get(n, ("?",))[0]} for n in rows}
    (SRC / names_file).write_text(json.dumps(names, indent=1) + "\n")
    print(f"{slice_name}: {out['units']} units ({out['code_units']} code), {out['bytes']} bytes, "
          f"banks {out['banks']}, {out['boundary_units']} boundary")
    return out


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "title")
