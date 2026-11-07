"""The "close, not proven" tier next to the union: game functions NOT in the union whose best attempt came close.

    python3 tools/close_tier.py             # -> crew/exports/union/CLOSE.json
    python3 tools/close_tier.py --print     # print the counts only

close = a game function not in crew/exports/union/UNION.json, with no fn.matched event anywhere, whose best
match_pct over every verdict in runs/*/events.jsonl and crew/exports/*/events.jsonl is at least 90 (a byte match
the Checker refused as a fake counts as close, never as recovered). Functions with a fn.matched event that the
union does not have yet (matched after its last refresh) are listed apart as matched_pending_union: they are not
"close", they wait for the next `python -m crew.union` to be re-verified. These were not accepted and are not counted
as recovered anywhere; they are a separate, labelled tier and are never added to the exact count.
Runs skipped, as in crew/union.py: bench, smoke, fx, r_fx, underscore-prefixed, live (a symlink) and union.
Stdlib only. Re-run after every `python -m crew.union` (crew.union rewrites the folder; site/tools/sync_union.sh does both).
"""
from __future__ import annotations

import json
import re
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
UNION = ROOT / "crew" / "exports" / "union"
SKIP = re.compile(r"^(bench|smoke|fx|r_fx|_)")
THRESHOLD = 90.0


def main(argv: list[str]) -> int:
    union = json.loads((UNION / "UNION.json").read_text())
    proven = {r["fn"] for r in union["rows"]}
    man = json.loads((ROOT / "lab" / "out" / "manifest.json").read_text())
    game = {f["id"]: f for f in man["functions"] if f["scope"] == "game"}
    best: dict[str, tuple[float, str]] = {}
    seen: set[str] = set()
    matched: set[str] = set()
    for root in (ROOT / "runs", ROOT / "crew" / "exports"):
        for ev in sorted(root.glob("*/events.jsonl")):
            run = ev.parent.name
            if run in seen or run in ("live", "union") or SKIP.match(run) or ev.parent.is_symlink():
                continue
            seen.add(run)
            for line in ev.read_text(errors="replace").splitlines():
                if '"verdict"' not in line and '"fn.matched"' not in line:
                    continue
                try:
                    e = json.loads(line)
                except ValueError:
                    continue
                if e.get("type") == "fn.matched" and e.get("fn") in game:
                    matched.add(e["fn"])
                    continue
                if e.get("type") != "verdict" or e.get("fn") not in game:
                    continue
                p = e.get("payload") or {}
                if p.get("fixture"):
                    continue
                pct = p.get("match_pct")
                if isinstance(pct, (int, float)) and (e["fn"] not in best or pct > best[e["fn"]][0]):
                    best[e["fn"]] = (float(pct), run)
    close = sorted(
        ({"fn": fn, "size": game[fn]["size"], "best_match_pct": pct, "run": run}
         for fn, (pct, run) in best.items() if fn not in proven and fn not in matched and pct >= THRESHOLD),
        key=lambda r: int(game[r["fn"]]["addr"], 16))
    out = {
        "v": 1,
        "generated_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "rule": "game function not in UNION.json and never fn.matched, whose best match_pct over every verdict is >= 90",
        "label": "close = best attempt >=90% byte-match, not accepted, not counted",
        "threshold_pct": THRESHOLD,
        "close": len(close),
        "close_95": sum(1 for r in close if r["best_match_pct"] >= 95),
        "of": len(game),
        "proven_exact": len(proven),
        "matched_pending_union": len(matched - proven),
        "runs_scanned": len(seen),
        "rows": close,
    }
    print(f"close tier: {out['close']} at >=90% ({out['close_95']} at >=95%), not in the union of "
          f"{out['proven_exact']}, over {out['runs_scanned']} runs; {out['matched_pending_union']} matched after the "
          f"last union refresh (not close, pending re-verify)")
    if "--print" not in argv:
        (UNION / "CLOSE.json").write_text(json.dumps(out, indent=2) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
