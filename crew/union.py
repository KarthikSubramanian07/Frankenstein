"""Publish every function the crew has ever recovered, as one folder every lane can rebuild from.

    python -m crew.union                 # -> crew/exports/union/{recovered/, UNION.json}

Takes the Checker-accepted `recovered/fn_*.c` from every real run (runs/* and crew/exports/*; bench, smoke and
fixture runs are skipped), keeps one source per function (the newest), re-verifies each one with the referee
when it is reachable, and writes UNION.json: count, ids, the run each came from, sha1 of each file, and the
total code bytes they cover against the game's total. That is the honest headline: X of 568 functions,
Y% of the game's code bytes.
"""
from __future__ import annotations

import hashlib
import json
import re
import shutil
import sys
from pathlib import Path

from .config import ROOT, Config
from .referee import make_referee

OUT = ROOT / "crew" / "exports" / "union"
SKIP = re.compile(r"^(bench|smoke|fx|r_fx|_)")
HEADER = re.compile(r"^/\*.*?\*/\s*", re.S)


def main(argv=None) -> int:
    cfg = Config()
    man = json.loads(cfg.manifest_path.read_text())
    game = {f["id"]: f for f in man["functions"] if f["scope"] == "game"}
    found: dict[str, tuple[float, Path]] = {}
    roots = [cfg.runs_dir, ROOT / "crew" / "exports"]
    for root in roots:
        for rec in root.glob("*/recovered"):
            run = rec.parent.name
            if SKIP.match(run) or run == "union":
                continue
            for c in rec.glob("fn_*.c"):
                if c.stem in game:
                    m = c.stat().st_mtime
                    if c.stem not in found or m > found[c.stem][0]:
                        found[c.stem] = (m, c)
    ref = None
    try:
        ref = make_referee(cfg.referee_url)
        ref.health()
    except Exception:
        ref = None
    if OUT.exists():
        shutil.rmtree(OUT)
    (OUT / "recovered").mkdir(parents=True)
    rows, rejected = [], []
    for fn, (_, c) in sorted(found.items()):
        src = c.read_text()
        if ref is not None:
            r = ref.check(fn, HEADER.sub("", src, count=1))
            if r.get("status") != "MATCH":
                rejected.append({"fn": fn, "status": r.get("status"), "from": str(c.relative_to(ROOT))})
                continue
        dst = OUT / "recovered" / c.name
        dst.write_text(src)
        rows.append({"fn": fn, "size": game[fn]["size"], "split": game[fn]["split"],
                     "from": str(c.parent.parent.relative_to(ROOT)), "sha1": hashlib.sha1(src.encode()).hexdigest()})
    total_bytes = sum(f["size"] for f in game.values())
    got_bytes = sum(r["size"] for r in rows)
    meta = {"v": 1, "functions": len(rows), "of": len(game), "pct_functions": round(100 * len(rows) / len(game), 1),
            "bytes": got_bytes, "of_bytes": total_bytes, "pct_bytes": round(100 * got_bytes / total_bytes, 2),
            "reverified_by_referee": ref is not None, "rejected_on_reverify": rejected,
            "target_rom_sha1": man["game"].get("rom_sha1"), "rows": rows}
    (OUT / "UNION.json").write_text(json.dumps(meta, indent=2) + "\n")
    print(f"union: {len(rows)} of {len(game)} game functions ({meta['pct_functions']}%), "
          f"{got_bytes} of {total_bytes} code bytes ({meta['pct_bytes']}%), re-verified={ref is not None}, "
          f"rejected={len(rejected)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
