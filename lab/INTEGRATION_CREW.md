# Crew and real referee: integration check (Lane A, 2026-11-07)

Read: `crew/{referee,target,config,guard,prompts,digger,checker,run,serve}.py`, `crew/README.md`, `crew/ARCHITECTURE.md`, against `lab/referee/{__main__,core,romlink,lint}.py`, `lab/agents/frankenstein_agent.py`, `contracts/CONTRACTS.md` section 4b and `contracts/schemas/crew_job.schema.json`.

## Requests to Lane B

1. **A single referee error kills the whole run's bookkeeping.** In `crew/run.py` line 254, wrap `out = d.dig(f["id"])` in `try/except RefereeError` and turn the error into `Outcome(fn=f["id"], status="failed")`. Right now `HttpReferee` raises `RefereeError` on any HTTP error (the real referee returns 404 for a non-game id; I confirmed this live) and after 3 failed retries. That error passes through `Checker.judge` and `Digger.dig`, and `f.result()` at line 266 re-raises it. `go()` then never reaches `finish()`, so no `run.finished` event, no `metrics.json` and no `names.json` get written. In `serve.py` the job turns into `failed` with `attempts`/`cost_usd` frozen.

2. **The jobs API accepts any `fn_` string.** In `crew/serve.py` after line 235, reject an id that is missing from the manifest or has `scope != "game"` with a 400 (`Target(self.cfg).fns.get(fn)`, cached). Without this check, `POST /jobs` for a library function or a typo starts a Run that fails with a `KeyError` at `run.py` line 114 or a referee 404. The ASI:One agent then reports "FAILED" when the right answer is "not a game function". The manifest has 227 library entries alongside the 568 game functions.

3. **Job run dirs get reused after a restart.** In `crew/serve.py` line 41, stop deriving `run_id` from a counter that resets to `r_asi_01` on every restart. Use `new_run_id(self.cfg.runs_dir, "r_asi_")` from `crew/run.py` under `self.lock`. The current code reuses `runs/r_asi_01/` (`run.py` line 60 uses `exist_ok=True`), so the new job appends to the old `events.jsonl` with `seq` starting over (this breaks contract section 5's "strictly increasing"), and `_evidence()` (serve.py line 118) can report the *previous* job's verdict as Observed.

4. **Rebuilds never emit `build.rom`.** In `crew/referee.py` line 73, send `{"recovered_dir": ..., "emit": emit}`, and in `crew/run.py` line 154 call `self.referee.rebuild(str(self.dir / "recovered"), emit=self.args.live)`. The Lab only appends `build.rom` when `emit` is true (`lab/referee/romlink.py` line 86). The comment on run.py line 154 says the opposite. As things stand the Stage never gets a `build.rom` from crew rebuilds, and `GET /status` `last_build` (serve.py line 155) is always `null`. Two smaller fixes while you're there:
   - Give `rebuild` a longer timeout, e.g. `HttpReferee(url, timeout=300)` just for that call. `_req` re-POSTs on a timeout, so a slow rebuild currently gets started 3 times.
   - Skip a rebuild while one is already running (a `threading.Lock` with `acquire(blocking=False)` around `Run.rebuild`). Rebuilds are started every 3 matches, and overlapping ones race on `lab/out/rebuilt.gba`.

5. **The prompt leaves out "non-static" and hardcodes Thumb.** In `crew/prompts.py` line 5, change "(ARM7TDMI, Thumb mode)" to "(ARM7TDMI; Thumb or ARM, as stated per function)". 34 of the game functions are ARM mode and get compiled with `-marm`. On line 10, change it to "Define exactly one non-static function, named exactly as the given fn_ id". I checked live that a `static` definition gets `NO_COMPILE` ("no function named fn_0801B724 in the object"), which wastes an attempt. Also add one line after line 14 with the rest of the real linter (`lab/LINT.md`): "Only `#include <system>` headers (L009); no asm text copied into comments or strings (L008); at most 8 source lines per target instruction (L007); no computed goto or more than 2 consecutive labels (L005)."

6. **The mock lint doesn't match the real one (low priority, affects mock runs only).** In `crew/referee.py` lines 16-21, the mock implements only L001-L004, and its L001 regex only catches `asm(`. The real L001 rejects the bare word `asm` anywhere outside comments. Either import `lab.referee.lint.lint` or copy L005-L009, so that mock wiring runs fail the same way real runs do.

## Notes for Lane A (not Lane B bugs)

- Crew jobs write to `runs/r_asi_NN/recovered/`. The agent's "how much is back" (when the crew is down) and "prove the rebuild" read only `runs/live/recovered`, so a function recovered through ASI:One doesn't count until somebody copies it over.
- `JOB_TIMEOUT_S = 90` in `frankenstein_agent.py` is shorter than a real Digger job (4-12 LLM turns), so a "Recover fn_X" request will usually come back "STILL RUNNING". That fits the "ask again" wording, but the demo should use a tiny function.

## Works (verified)

- **Referee switch:** `crew/config.py` line 35 reads `REFEREE_URL`, which defaults to `http://127.0.0.1:7101` (the effective value here is :7101, with manifest `lab/out/manifest.json`). `mock` selects `MockReferee` and the bench is opt-in via `REFEREE_URL=:7121` plus `FRANK_MANIFEST`. Mock and fixture runs are labelled as such in `run.started` and `metrics.json`.
- **Live probe** (`crew.referee.make_referee(Config().referee_url).check(...)` against the running referee, `{"ok": true, "mock": false}`):
  - `int fn_0801B724(const void *e){ (void)e; return 0; }` returns `MATCH`, 100.0, `first_diff: null`, lint ok, compile ok, in 0.11 s.
  - `return 1;` returns `PARTIAL`, 50.0, `first_diff {offset 0, expected "2000", got "2001", expected_ins "movs\tr0, #0", got_ins "movs\tr0, #1"}`.
  - `static ...` returns `NO_COMPILE` with the "non-static" hint in `compile.log`.
  - `GET /context/fn_0801B724` returns the header as text and the crew parses it correctly.
- **Result parsing:** the crew reads `status`, `match_pct`, `first_diff.{expected_ins,got_ins}`, `diff`, `lint.ok` and `compile.log` with exactly the real key names (`digger.py` lines 166-187, `checker.py` lines 45-60). Claims get a fresh, uncached referee call.
- **Inputs:** ids come from `lab/out/manifest.json` (`Target.fns`). The model gets `lab/out/asm/<fn>.s` (via the manifest's `asm_path`) and `lab/out/ctx/<fn>.h` (told it is prepended, which matches the referee's `-include`). The prompt requires the exact `fn_` name and `fn_`/`data_` ids for callees and globals, and forbids raw addresses.
- **Jobs API (contract 4b):** `POST /jobs {fn, max_usd}` returns `{job_id, run_id}`. `GET /jobs/{id}` has `status` in running|matched|abandoned|failed plus `attempts`, `best_pct`, `cost_usd`, `src_path` (repo-relative or null) and `false_claims`, which satisfies `crew_job.schema.json`. `GET /status` and `GET /names/{fn}` field names match the contract and what `frankenstein_agent.py` reads. No field-name or status-value mismatches.
- **Rebuild input:** `Run.accept` writes `runs/<run>/recovered/<fn>.c` (the comment header passes lint), which is the layout `lab.referee rebuild --recovered` globs (`fn_*.c`).
- **Guard:** `crew/guard.py` blocks `lab/secrets/` (and `crew/bench/answers/`) and the file `lab/out/viz_map.json` after `resolve()`, so symlinks are covered. Every crew read of `lab/` goes through `safe_read` (target.py, cartographer.py).
