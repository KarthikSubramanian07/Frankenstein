# Run exports

Real crew runs, published so every lane (and every judge) can replay them. `runs/` stays gitignored; these don't.

Each folder has the run's `events.jsonl`, `metrics.json`, `names.json`, the Checker-accepted `recovered/*.c`, and
`EXPORT.json`, which pins the manifest SHA-1, the target ROM SHA-1 and a hash of every file.
Regenerate with `python -m crew.export <run_id>`. Bench runs are labelled bench; they are not Doom results.
