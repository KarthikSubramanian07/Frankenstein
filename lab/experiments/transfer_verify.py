"""Cross-game transfer, step 3: re-judge every recovered .c with a fresh Voxelburg referee and tabulate the arms.

    python3 lab/experiments/transfer_verify.py

Reads lab/exports/transfer/<arm>/r*/ (events.jsonl, metrics.json, recovered/). Writes verify.json per run and
lab/exports/transfer/results.json. A match counts only if this fresh referee check says MATCH.
"""
import json
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(REPO))
from lab.referee.core import Referee  # noqa: E402

OUT = REPO / "lab/exports/transfer"


def verify(run: Path, ref: Referee) -> dict:
    res = {}
    for p in sorted((run / "recovered").glob("fn_*.c")):
        r = ref.check(p.stem, p.read_text())
        res[p.stem] = {"status": r["status"], "match_pct": r["match_pct"]}
    (run / "verify.json").write_text(json.dumps(res, indent=1) + "\n")
    return res


def summarize(run: Path, ver: dict) -> dict:
    m = json.loads((run / "metrics.json").read_text())
    evs = [json.loads(line) for line in (run / "events.jsonl").read_text().splitlines()]
    ok = {f for f, v in ver.items() if v["status"] == "MATCH"}
    matched = [e["payload"] for e in evs if e["type"] == "fn.matched" and e["fn"] in ok]
    n = len(matched)
    per = lambda k: round(sum(x[k] for x in matched) / n, 4) if n else None  # noqa: E731
    used = [e["payload"]["idiom_id"] for e in evs if e["type"] == "idiom.used"]
    cases = sum(1 for u in used if u.startswith("case:"))
    return {"run": str(run.relative_to(REPO)), "fn_total": m["fn_total"], "matched_crew": m["matched"],
            "matched_verified": n, "attempts_per_match": per("attempts"), "minutes_per_match": per("minutes"),
            "digger_cost_per_match_usd": per("cost_usd"),
            "run_cost_usd": m["cost_usd"], "run_cost_per_match_usd": round(m["cost_usd"] / n, 4) if n else None,
            "attempts_total": m["attempts_total"], "elapsed_s": m["elapsed_s"], "library": m["library"],
            "library_size": m["library_size"], "case_memory": m["case_memory"], "idiom_offers": len(used) - cases, "case_offers": cases,
            "verified_fns": sorted(ok)}


def main() -> None:
    ref = Referee("voxelburg")
    rows = []
    for run in sorted(p for p in OUT.glob("*/r*") if (p / "metrics.json").exists()):
        rows.append(summarize(run, verify(run, ref)))
        print(json.dumps({k: v for k, v in rows[-1].items() if k != "verified_fns"}))
    (OUT / "results.json").write_text(json.dumps(rows, indent=1) + "\n")


if __name__ == "__main__":
    main()
