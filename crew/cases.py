"""Load verified training solutions from finished runs into a library's case memory.

    python -m crew.cases --library runs/_doom_lib_v2.json runs/doom_r01 runs/doom_r11 crew/exports/doom_r01

Only functions whose manifest split is "train" are stored, so held-out evaluation never sees an answer.
Every source must already be Checker-accepted (it is read from the run's recovered/ folder).
"""
from __future__ import annotations

import argparse
import re
from pathlib import Path

from .config import Config
from .library import CaseMemory, Library
from .target import Target

HEADER = re.compile(r"^/\*.*?\*/\s*", re.S)


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(prog="python -m crew.cases", description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--library", required=True)
    ap.add_argument("runs", nargs="+")
    a = ap.parse_args(argv)
    cfg = Config()
    t = Target(cfg)
    lib = Library(cfg, mode="learning", path=Path(a.library))
    mem = CaseMemory(lib)
    added = skipped = 0
    for r in a.runs:
        for c in sorted(Path(r).glob("recovered/fn_*.c")):
            fn = c.stem
            f = t.fns.get(fn)
            if not f:
                skipped += 1
                continue
            src = HEADER.sub("", c.read_text(), count=1)
            if mem.add(fn, t.asm(fn), src, f["split"], f["size"], Path(r).name):
                added += 1
            else:
                skipped += 1
    print(f"case memory {mem.path.name}: +{added} (skipped {skipped}: held-out, duplicate or unknown); "
          f"total {len(mem.items)} · backend {'mongodb-atlas' if mem.coll is not None else 'local-json'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
