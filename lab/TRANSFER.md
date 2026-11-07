# Cross-game transfer: Doom to Attack on Voxelburg (Lane A, 2026-11-07)

Claim under test: "every game we bring back makes the next one faster". Flagged in `lab/CLAIMS_AUDIT.md`.

## Result

**No measurable transfer.** We ran one replicate per arm. Doom's library and case memory did not raise the match count on Voxelburg and did not make matches cheaper or faster. Every number on the warm side is the same as cold or slightly worse, and with n=4 matches per arm none of the gaps can be told apart from noise. Until a bigger run says otherwise, the pitch shouldn't claim cross-game speed-up.

| Arm | Library + memory | Matched (fresh referee) | Attempts / match | Minutes / match | Digger cost / match | Run cost / match | Run cost |
|---|---|---|---|---|---|---|---|
| A cold | off | 4 / 20 | 1.75 | 3.16 | $0.107 | $0.833 | $3.33 |
| B warm | Doom (38 idioms, 28 cases), frozen | 4 / 20 | 2.75 | 3.43 | $0.117 | $0.885 | $3.54 |

- Cold matched `fn_080022E4 fn_08002520 fn_08002B8C fn_08002EE4`. Warm matched `fn_08002238 fn_08002520 fn_08002B8C fn_08002EE4`. Three overlap, and each arm got one the other missed.
- Warm Diggers were given Doom idioms 180 times. A Doom solved-before case cleared the 0.25 similarity bar 8 times (5 of the 20 functions have any Doom case that close). False claims the Checker caught: cold 1, warm 3.
- "Digger cost / match" is the mean `cost_usd` on the `fn.matched` events. "Run cost / match" is total run spend (failed functions and naming calls included) divided by matches.
- For scale, Doom's own run (`crew/exports/doom_r01`, Doom functions, Snap on) got 28/30 at $0.026 per match. Voxelburg's -O3 code is much harder for the crew than Doom's, with or without the library.
- Total spend: $6.87 of the $15 cap.

## Method

- **Functions:** 20 Voxelburg game functions, Thumb mode, 16 to 200 bytes, sampled with `random.Random(20261107)` from the 55 that qualify (`lab/exports/transfer/fns.txt`). Both arms got the same set.
- **Crew:** `crew/` code, unmodified, through `crew.run.main`. The manifest is `FRANK_MANIFEST=lab/out/games/voxelburg/manifest.json`, the referee is `REFEREE_URL=http://127.0.0.1:7102`, and both are read by `crew/config.py`.
- **Same settings in both arms:** `muse-spark-1.3` (Wonder escalation), reasoning effort `high` from `.env`, 6 Diggers, `--max-usd-per-fn 0.5`, the manifest-difficulty attempt budget, `--budget-usd 5`, `--no-snap --no-gemini --no-rebuild`, and `--names`. With `--names` the cold arm runs the Distiller too, so naming calls cost the same in both arms. Both arms ran at the same time.
- **Cold:** `--library off`. `Library.search` and `CaseMemory.similar` return nothing.
- **Warm:** `--library on`, which is frozen: no learning, no writes. It uses `--library-path lab/exports/transfer/warm/library/idioms.json`. Doom's original local-JSON store (`runs/_library/`) no longer exists, and Doom's run used local JSON, not Atlas. So `lab/experiments/transfer_setup.py` rebuilds it in crew's own format from the published export `crew/exports/doom_r01`:
  - 38 idioms come from its `idiom.learned` events. The `example` field is empty because the events don't carry it.
  - 28 cases come from its Checker-accepted `recovered/*.c` plus Doom's asm, signed with `crew.library.asm_signature`.
- **MongoDB:** `MONGODB_URI` is blanked in both arms, so the backend is `local-json` (see `metrics.json`) and nothing touched Atlas.
- **Verification:** `lab/experiments/transfer_verify.py` re-judges every `recovered/*.c` with a fresh `Referee("voxelburg")` and counts a match only on MATCH. All 8 came back MATCH at 100.0 (`<arm>/r2/verify.json`).
- **Run numbering:** replicate r1 is void and excluded. This machine's python.org Python has no CA bundle, so every Muse call failed TLS. The crew turned each failure into `fn.abandoned` with 0 attempts and $0. Those runs are kept in `lab/exports/transfer/_void_no_ca_bundle/`. The wrapper now sets `SSL_CERT_FILE` from certifi.

## Limits

- One replicate per arm and 4 matches each. A 1-attempt or 1-function difference is noise. A real answer needs more functions or 3+ replicates, about $7 per pair.
- Snap and Gemini were off, so this measures only the library and case memory, not the full crew.
- The warm store has no idiom `example` text, and it doesn't carry Doom's adopted/retired statuses. Doom's run emitted no `idiom.judged` events, so every idiom was still a candidate anyway.

## Exact commands

```bash
python3 -m lab.referee serve --game voxelburg --port 7102 &   # Doom referee on :7101 untouched
python3 lab/experiments/transfer_setup.py                      # fns.txt + warm store
python3 lab/experiments/transfer_run.py cold 2 &               # -> runs/transfer_cold_2, copied to lab/exports/transfer/cold/r2
python3 lab/experiments/transfer_run.py warm 2 &               # -> runs/transfer_warm_2, copied to lab/exports/transfer/warm/r2
wait
python3 lab/experiments/transfer_verify.py                     # verify.json per run + results.json
```

Each `lab/exports/transfer/<arm>/r2/` holds `events.jsonl`, `metrics.json`, `names.json`, `recovered/*.c` and `verify.json`. `results.json` holds the table above.

## Notes for Lane B (no edits needed for this experiment; things that bit or could bite)

1. **`crew/target.py` `Target.context` reads `lab/out/ctx/<fn>.h` (Doom) before asking the referee.** Both ROMs start at 0x08000000, so a Voxelburg id that also exists in Doom would get Doom's header. None of these 20 collide, which I checked. Fix: read ctx from the directory next to the manifest's `asm_path`, or always use `referee.context`.
2. **An LLM error turns into a silent abandon** (`crew/digger.py` line 112). The void r1 runs show 20 functions "abandoned" at $0 with no error in `events.jsonl` or in stderr. Emit the `LLMError` text on `fn.abandoned`.
3. **`.env` is only loaded if python-dotenv is installed**, and it isn't on this machine's Python. Without it, `crew.run` runs with no key and fails the same silent way.
4. **`runs_dir` is fixed to `runs/`**, so Lab has to copy outputs out. A `FRANK_RUNS_DIR` env var would let other lanes write straight to their own export folder.
