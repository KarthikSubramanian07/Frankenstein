# Lane B · The Crew (Agents)

Owner: `[name]` · Start with [`docs/LANE_B_CREW.md`](../docs/LANE_B_CREW.md), after [`DECISIONS.md`](../DECISIONS.md) and [`contracts/CONTRACTS.md`](../contracts/CONTRACTS.md).

The agents. Diggers on Muse Spark write C until the referee says MATCH; the Checker independently re-verifies every claim and counts the lies; the Distiller grows a generic idiom library in MongoDB; the Archivist narrates and names; the Cartographer (SubQ) proposes shared types. Runs the held-out ablation that proves it gets better.

## Entry points (from the contracts)

- `crew/run.py`, `crew/demo.py`
- `python -m crew.serve [--mock]` on :7111 (jobs API for Lane A)
- Writes `runs/<run_id>/events.jsonl`, `metrics.json`, `names.json`, `recovered/`

Commit only inside `crew/`. Build against `contracts/fixtures/` until the real thing exists.
