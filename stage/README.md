# Lane C · The Stage (UI)

Owner: `[name]` · Start with [`docs/LANE_C_STAGE.md`](../docs/LANE_C_STAGE.md), after [`DECISIONS.md`](../DECISIONS.md) and [`contracts/CONTRACTS.md`](../contracts/CONTRACTS.md).

The show. Vite and TypeScript scenes (Title, Split, Hi-score, Versus, Time trial, Ending) driven only by the event stream, plus a tiny server that tails `runs/live/events.jsonl` and replays finished runs at 1–20x. Built for one laptop screen first (the 3-minute judging room); the projector is the bonus. `docs/design_system.html` is a reference only: rebuild, never paste.

## Entry points (from the contracts)

- Server: ws :7202, http :7201
- Reads `runs/*/events.jsonl`, `metrics.json`, `names.json`, `lab/out/viz_map.json`, `lab/out/memory_probe.json`
- `make sample-runs` gives you `runs/live` to develop against

Commit only inside `stage/`. Build against `contracts/fixtures/` until the real thing exists.
