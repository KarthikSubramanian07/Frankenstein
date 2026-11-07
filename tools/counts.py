"""One source of truth for the judge-facing tallies, from FINISHED runs' metrics.json (deduplicated by run_id).

    python3 tools/counts.py            # public, reproducible: reads the repo's crew/exports only
    python3 tools/counts.py --local    # also counts this machine's runs/ (differs per machine; never public)

Lies caught = sum of false_claims_caught; fakes rejected = sum of fakematches_rejected; fakes accepted is 0 by
construction (an accepted function must pass a fresh referee MATCH and the Checker's review, and the union is
re-verified: rejected_on_reverify is empty). Bench, smoke, fixture, salvage and union folders are skipped.
Use these exact numbers on the Stage, /judges, the demo script and the video.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKIP = re.compile(r"^(bench|smoke|fx|r_fx|_|salvage|union)")
runs = {}
# Public tally = the repo only (crew/exports), so every machine prints the same number. --local adds runs/*.
bases = [ROOT / "crew" / "exports"] + ([ROOT / "runs"] if "--local" in sys.argv else [])
for base in bases:
    for m in base.glob("*/metrics.json"):
        if SKIP.match(m.parent.name):
            continue
        try:
            d = json.loads(m.read_text())
        except (OSError, json.JSONDecodeError):
            continue
        if d.get("fixture"):
            continue
        runs[d.get("run_id", m.parent.name)] = d
union = json.loads((ROOT / "crew" / "exports" / "union" / "UNION.json").read_text())
json.dump({"functions": union["functions"], "of": union["of"], "pct_bytes": union["pct_bytes"],
           "false_claims_caught": sum(d.get("false_claims_caught", 0) for d in runs.values()),
           "fakes_rejected": sum(d.get("fakematches_rejected", 0) for d in runs.values()),
           "fakes_accepted": 0 if not union.get("rejected_on_reverify") else None,
           "finished_runs": len(runs), "source": "crew/exports (repo)" if "--local" not in sys.argv else "crew/exports + runs/ (local)"},
          sys.stdout, indent=2)
print()
