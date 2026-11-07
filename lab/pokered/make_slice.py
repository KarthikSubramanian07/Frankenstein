"""Build the title-screen / main-menu slice: static call closure from the title and menu entry points.

Writes lab/pokered/slice.json (ids, banks, sizes only: crew-readable) and
lab/secrets/pokered/names_slice.json (id -> original name/file: secret).

Edges are direct call/jp/jr and far-call/predef macros found in source. Jump tables and
`jp hl` dispatch are not followed, so this under-approximates what runs.
"""
from __future__ import annotations

import json
import re

from referee import REPO, ROM_SHA1, SRC, reference, rid, source_index

# Entry points and boundary labels are original names, so they live with the answer key.
_CFG = json.loads((SRC / "slice_config.json").read_text())
ROOTS, STOP = tuple(_CFG["roots"]), set(_CFG["stop"])
EDGE_RE = re.compile(r"^\s*(?:call|jp|jr|farcall|callfar|farjp|jpfar|homecall|homecall_sf|predef|predef_jump)\s+"
                     r"(?:[a-z]+\s*,\s*)?([A-Za-z_][A-Za-z0-9_]*)", re.I)


def callees(name: str, index: dict, ext: dict) -> set[str]:
    rel, start, end = index[name]
    lines = (SRC / rel).read_text().splitlines()[start + 1:end]
    return {m.group(1) for l in lines if (m := EDGE_RE.match(l.split(";", 1)[0])) and m.group(1) in ext}


def main() -> None:
    ref, index = reference(), source_index()
    ext = ref["ext"]
    seen, depth, todo = set(), {}, [(r, 0) for r in ROOTS]
    while todo:
        name, d = todo.pop(0)
        if name in seen:
            continue
        seen.add(name)
        depth[name] = d
        if name in STOP or name not in index:
            continue
        todo += [(c, d + 1) for c in sorted(callees(name, index, ext))]
    rows = sorted(seen, key=lambda n: ext[n][:2])
    units = [{"id": rid(*ext[n][:2]), "bank": ext[n][0], "addr": f"{ext[n][1]:04x}", "size": ext[n][2],
              "depth": depth[n], "boundary": n in STOP, "root": n in ROOTS} for n in rows]
    inside = [u for u in units if not u["boundary"]]
    out = {"v": 1, "game": "pokered", "build_sha1": ROM_SHA1, "proof": "rgbds-1.0.4 per-routine byte match",
           "slice": "title screen + main menu (stops at new-game intro, overworld entry, cable club, debug paths, soft reset)",
           "method": "static call closure from 3 entry points; jump tables/jp hl not followed",
           "units": len(inside), "bytes": sum(u["size"] for u in inside),
           "banks": sorted({u["bank"] for u in inside}), "boundary_units": len(units) - len(inside),
           "routines": units}
    (REPO / "lab/pokered/slice.json").write_text(json.dumps(out, indent=1) + "\n")
    names = {rid(*ext[n][:2]): {"name": n, "file": index.get(n, ("?",))[0]} for n in rows}
    (SRC / "names_slice.json").write_text(json.dumps(names, indent=1) + "\n")
    print(f"{out['units']} routines, {out['bytes']} bytes, banks {out['banks']}, {out['boundary_units']} boundary")


if __name__ == "__main__":
    main()
