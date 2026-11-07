# Crew architecture

**Lost games, rebuilt and proven.** The crew rebuilds a game's lost source from the cartridge, and a compiler accepts only byte-identical pieces. Doom is our first patient.

This page covers one function's life, the run process and the play-to-recover loop. File formats are the contracts in [`../contracts/CONTRACTS.md`](../contracts/CONTRACTS.md) (4b jobs API, 5 events, 6 metrics), and the reasons are in [`../DECISIONS.md`](../DECISIONS.md). Everything is stdlib Python plus optional `pymongo`.

## 1. One function's life

```text
+--------------------------------+
| SCHEDULER                      |  order: director boost, then callees
| pops the next function, sets   |  already recovered, then Snap triage
| its attempt budget (4 to 12)   |  (whole-program difficulty)
+--------------------------------+
          |
          | fn.claimed
          v
+--------------------------------+    referee_check(src)      +--------------------------------+
| DIGGER  (one thread each)      |--------------------------->| CHECKER.judge                  |
| Muse Spark 1.3, effort ladder  |                            | POST /check to the referee     |
| Muse Wonder once escalated     |<---------------------------| emits verdict                  |
| tools: referee_check,          |    status, match_pct,      | cached by sha1(source):        |
| submit_claim, search_idioms,   |    first_diff, diff[:16]   | a resubmission costs 0 s       |
| get_neighbors                  |    attempt.submitted       +--------------------------------+
+--------------------------------+                                             | not MATCH, from
          |                 ^                                                  | the 2nd failure
          | MATCH:          | keep: next attempt, same model                   v
          | submit_claim    | escalate: Muse Wonder hereafter +--------------------------------+
          | -> claim.made   +---------------------------------| SNAP decide_next  (8 s cap)    |
          |                                                   | keep | escalate | abandon      |
          v                                                   | + p(match within 4 more)       |
+--------------------------+                                  +--------------------------------+
| CHECKER.verify_claim     |                                                   | abandon: conf
| fresh referee call,      |                                                   | 0.6+, 3+ fails
| never the cache; a miss  |                                                   v
| is a false claim         |                                  +--------------------------------+
+--------------------------+                                  | fn.abandoned                   |
          |                                                   | payload: attempts, best_pct    |
          | MATCH + lint ok                                   +--------------------------------+
          v
+--------------------------+
| FAKEMATCH REVIEW         |  rules: volatile, absolute address cast,
| 1. hard rules            |  3+ gotos, padded source, cast chains
| 2. Snap review           |  Snap: fakematch_p or recital_p
|    rejects at p >= 0.85  |  (period_plausible_p is logged only)
+--------------------------+
          |
          | accepted
          v
+--------------------------+
| fn.matched               |  every 3rd match: POST /rebuild (Lab)
| recovered/<fn>.c         |  Archivist milestone at 25/50/75/100%
+--------------------------+
          |
          | async: distiller pool, 2 threads, off the critical path
          v
+--------------------------------+                            +--------------------------------+
| DISTILLER  (Muse, effort low)  |--------------------------->| IDIOM LIBRARY                  |
| 0 to 2 generic idioms          |   leak check: no 3 lines   | Atlas, or local JSON           |
| + an inferred name             |   shared with the source   | idiom.learned  /  names.json   |
+--------------------------------+                            +--------------------------------+

Rejected (false claim or fakematch): the reason goes back to the Digger as the tool result and
the loop continues inside the same attempt budget. The Digger never marks anything done.
```

- **Budget.** The attempt budget is `round(4 + 8 * difficulty)`, clamped to 4..12. Difficulty comes from Snap triage when it ran, otherwise from the manifest. A Digger also stops at 3 model turns per budgeted attempt, at `--max-usd-per-fn` (default $1.50), and when the run has spent 90% of `RUN_BUDGET_USD`.
- **Effort ladder.** The base effort is `META_REASONING_EFFORT` (default `high`). A function with difficulty under 0.35 starts at `medium`; after 3 failures it goes back to `high`.
- **Escalation.** With Snap on, `decide_next` runs after every failed attempt from the second on. `escalate` moves the rest of the function to `META_ESCALATION_MODEL` (default `muse-wonder-1.0`). `abandon` takes effect only at confidence 0.6 or more and after 3 or more failures; it ends the budget there. With Snap off, a fixed rule escalates after 3 failures.
- **Two referee paths.** `judge` serves the Digger's working attempts and is cached by `(fn, sha1(src))`. `verify_claim` always makes a fresh call. A claim is true only if that fresh call says MATCH with lint ok; anything else counts as a false claim.
- **A forgotten claim.** If the last attempt matched but the model never called `submit_claim` before the budget ran out, the crew submits it through the same Checker path. A match is never auto-accepted.
- **The fakematch review.** The hard rules run first. Then the Snap review and, when `GEMINI_API_KEY` is set, a Gemini review run in parallel (25 s cap). Snap alone rejects at `fakematch_p` or `recital_p` of 0.85 or more. Gemini alone rejects only at 0.95 or more, or at 0.7 or more when Snap is at 0.5 or more on the same question. Both reviews are advisory: the referee is the floor.
- **What the Digger sees.** The first user message holds the asm, the ctx header, up to 3 idioms, up to 3 recovered neighbours and the Cartographer's slice of `types.h`. The system prompt and the four tool schemas never change, so the provider's prompt cache can hit.

## 2. The run process

```text
python -m crew.run  (one process, stdlib threads)
+------------------------------------------------------------------------------------------------+
|  main thread: Snap triage (one whole-program call) -> ordered queue -> start threads           |
|                                                                                                |
|  +------------------+  +------------------+       +------------------+   +-------------------+ |
|  | digger-1         |  | digger-2         |       | digger-N         |   | ticker            | |
|  | Muse + referee   |  | Muse + referee   |  ...  | (default 6)      |   | metric.tick / 5 s | |
|  +------------------+  +------------------+       +------------------+   +-------------------+ |
|           |                                                                                    |
|           | fn.matched                                                                         |
|           v                                                                                    |
|  +--------------------------+   +----------------------------+   +--------------------------+  |
|  | distiller pool x2        |   | director HTTP :7112        |   | rebuild thread           |  |
|  | idioms + names (Muse)    |   | + steer loop every 4 s     |   | every 3rd match          |  |
|  +--------------------------+   +----------------------------+   +--------------------------+  |
|                                                                                                |
|                                                                                                |
|  +------------------------------------------------------------------------------------------+  |
|  | EventLog: thread-safe, append-only, flushed per line, strictly increasing seq            |  |
|  | in-process listener: Archivist (template narration, no model call)                       |  |
|  +------------------------------------------------------------------------------------------+  |
|                                                                                                |
|  in the crew every write goes through the EventLog; the Lab and Lane D append from outside     |
|                                                                                                |
+------------------------------------------------------------------------------------------------+
            |
            |
            v
runs/<run_id>/  events.jsonl  metrics.json  names.json  recovered/fn_*.c  [types.h]
runs/live -> <run_id>   (--live: symlink .live.tmp, then os.replace: an atomic switch)

outside: Meta API (Muse)   referee :7101 (Lab) or :7121 (bench)   SubQ /v1/systemone   Atlas
```

- **Start-up.** Snap triage runs once per run (it is skipped for `--fns` runs). It puts the whole program's disassembly into one Snap `state` (budget 330K tokens) and asks 2 questions per function, 64 functions per request, with 4 requests in parallel. The queue is then sorted with leaves first, then by difficulty, then by size.
- **Picking work.** Each free Digger takes the first director-boosted function still in the queue. If there is none, it takes the first function whose callees are all recovered, and failing that, the head of the queue.
- **Thread inventory.**

| Thread | Count | Job |
|---|---|---|
| Diggers | `--diggers` (default 6) | Model calls and referee calls for one function at a time |
| ticker | 1 | `metric.tick` every 5 s |
| distiller pool | 2 | Idioms and an inferred name per match, after acceptance |
| rebuild | 1 per trigger | `POST /rebuild` on the Lab referee, every 3rd match (not on the mock or with `--no-rebuild`) |
| director HTTP | 1 (with `--director`) | `127.0.0.1:7112`: `POST` a heartbeat, `GET` the current boost |
| steer loop | 1 (with `--director`) | Calls `Director.steer()` every `--director-every` s (default 4) once heartbeats exist |

- **Outputs.** `runs/<run_id>/events.jsonl` (append-only, one line per event, flushed per line), `metrics.json` and `names.json` (written at the end), `recovered/<fn>.c` (written only after acceptance, with an observed and inferred header comment), and `types.h` plus `cartographer.json` when the Cartographer ran into that directory.
- **The jobs API.** `crew.serve` runs each `POST /jobs` as its own one-function run in `runs/r_asi_NN/` with 1 Digger, library `on`, no rebuild, and `max_usd` clamped to $0.10..$5.00. A `{"query": …}` body is first routed by Snap, and the top candidate is started. `GET /status` is computed from `runs/live/events.jsonl`.

## 3. Play to recover

```text
+------------------------------+                              +--------------------------------+
| LANE D tap                   |   POST /heartbeat  :7112     | DIRECTOR                       |
| the game running live        |----------------------------->| rolling window: 120 beats      |
| (emulator / phone)           |   {running: [fn ids],        | hot = running, unrecovered,    |
+------------------------------+    frame_png_b64}            | game scope only                |
                ^                                             +--------------------------------+
                | new frames                                                   |
                |                                                              | every 4 s
                |                                                              v
+------------------------------+                              +--------------------------------+
| LANE D hot-swap              |                              | SNAP choice  (op director)     |
| loads the rebuilt ROM        |                              | frame + asm heads of up to     |
| rom.swapped                  |                              | 40 hot functions -> top 3      |
|                              |                              | error: boost the hottest       |
|                              |                              +--------------------------------+
| the static on screen         |                                               |
| heals where the              |                                               | boosted ids
| player is looking            |                                               v
|                              |                              +--------------------------------+
|                              |                              | SCHEDULER queue boost          |
|                              |                              | next free Digger takes it      |
+------------------------------+                              +--------------------------------+
                ^                                                              |
                | build.rom                                                    |
                |                                                              v
+------------------------------+                              +--------------------------------+
| LAB rebuild                  |<-----------------------------| Digger + Checker               |
| object-splice, build.rom     |     every 3rd match          | fn.matched (proved)            |
+------------------------------+                              +--------------------------------+
```

The director only ranks function ids that a heartbeat actually reported, and only game-scope functions that are not yet recovered. It sends Snap the latest frame plus the first 12 asm lines of up to 40 hot functions, and boosts the top 3 by probability. On any Snap error it boosts the most-seen running function instead, which is still real data, and the event says `fallback: "hottest"`. A boost only changes the order of work; the boosted function goes through the same Digger, Checker and fakematch path as any other. `eyes()` (in `director.py`) closes the loop afterwards: given an original and a rebuilt frame from the same moment, Snap judges whether the claimed change is visible and whether everything else looks the same. That result is observed by looking, not proved by bytes, and it is labelled that way.

## 4. Events the crew emits

All events share the contract 5 envelope (`v`, `ts`, `run_id`, `seq`, `type`, `actor`, `fn`, `payload`). The crew adds fields to some payloads; it never removes contract fields.

| type | actor | When | Payload beyond the contract |
|---|---|---|---|
| `run.started` | scheduler | Once, after triage and before any Digger starts | `referee`, `reasoning_effort`, `escalation_model`, `cartographer`, `snap` |
| `snap.decision` | scheduler, checker, creature | Every Snap call that changes what the crew does | `op` is `triage`, `decide_next`, `review`, `director` or `eyes`, plus `latency_ms` and the probabilities. Gemini reviews also log as `op: review`, with `reviewer: "gemini"` |
| `fn.claimed` | scheduler | A Digger takes a function | |
| `idiom.used` | digger-N | An idiom goes into the first prompt or a `search_idioms` result | |
| `attempt.submitted` | digger-N | Every `referee_check` call | `model`, `effort` |
| `verdict` | checker | After every judged attempt (`claim_was_true: null`) and every claim (true or false) | `cached` on judged attempts |
| `claim.made` | digger-N | The Digger asserts a match, before verification | |
| `narration` | archivist | At most one Archivist ticker line per 8 s; announcer lines and a few direct notes bypass the gap | |
| `fn.matched` | checker | Accepted after the fresh re-check and the fakematch review | `models` (calls per model) |
| `fn.abandoned` | digger-N | Budget spent, Snap abandon, or the model failed | |
| `idiom.learned` | distiller | The library stored a new idiom | `do` |
| `metric.tick` | scheduler | Every 5 s, and once more at the end | |
| `types.proposed` | cartographer | `crew.cartographer --emit` | `source`, `tokens_in`, `n_functions`, `dropped`, `coverage_pct`, `compiled` |
| `run.finished` | scheduler | Once, after every Digger and the Distiller pool are done | |

The Lab writes `build.rom` into `runs/live/events.jsonl` after a rebuild. Lane D writes `rom.swapped`, `patch.verified` and `phone.published`. Snap's `route` result is returned by the jobs API and is not logged into a run.

## 5. `metrics.json`

The contract 6 fields are `v`, `run_id`, `label`, `split`, `library`, `model`, `reasoning_effort`, `fn_total`, `matched`, `match_rate`, `attempts_per_match`, `minutes_per_match`, `cost_per_match_usd`, `false_claims_caught`, `fakematches_rejected`, `cost_usd` and `curve` (matched count at each whole minute). The crew adds these:

| Field | Meaning |
|---|---|
| `muse` | Contract 6c: `calls`, `tool_calls`, `image_calls`, `tokens_in`, `tokens_out`, `reasoning_effort`, `cost_usd`, and `by_model` (`{model: {calls, cost_usd}}`), filled from the API's usage fields |
| `snap` | `null` when Snap was not loaded. Otherwise `on`, `model` (`subq-snap-1.1`), `snap_calls`, `errors`, `latency_ms_mean`, `input_tokens`, `cost_usd` (input at $0.04 per 1M tokens; output is free) and `by_op` (`{op: {calls, latency_ms_total, input_tokens}}`) |
| `snap_reviews`, `second_opinion_reviews` | Fakematch reviews Snap and Gemini actually answered |
| `attempts_total`, `elapsed_s` | All attempts, including on abandoned functions; wall-clock seconds |
| `referee` | `lab` or `mock` |
| `fixture_target`, `fixture` | `fixture: true` whenever the referee is the mock or the manifest is the fixture, so the run can never pass for a result |
| `library_backend`, `library_size` | `mongodb` or `local-json`, and the idiom count at the end |
| `cartographer` | Whether a `types.h` was fed to the Diggers |
| `cost_estimated` | `true` when any model other than Muse Spark was used, because those calls are priced at Spark's rate as an estimate |

## 6. Failure handling

| Failure | What happens |
|---|---|
| Meta API 429 or 5xx | Up to 5 tries with `min(30, 2^n + 0..2 s)` backoff. Network errors and timeouts back off `2^n` s. The call timeout is 180 s. |
| Meta API, any other HTTP error | `LLMError`. On the escalation model, the crew clears `escalation_model` for the rest of the process and carries on with Spark. On the base model, the function ends as `failed` with an `fn.abandoned` event. |
| Escalation model missing | Same as above: the first failed call switches the crew back to Spark, and `crew.doctor` reports which models the key can reach. |
| Snap `decide_next` error or timeout (8 s, 1 retry) | Never raises. It returns `keep` with confidence 0, the `snap.decision` event carries the `error`, and the Digger carries on as if Snap were absent. |
| Snap or Gemini review error | Advisory. `evidence.snap_error` or `evidence.gemini_error` is recorded, and the rest of the gate decides. With both down, the referee and the hard rules decide alone. |
| Snap triage error | `snap_scores` is empty, and the manifest's difficulty sets order and budgets. |
| Snap director error | Boosts the most-seen running function (`fallback: "hottest"`). |
| Snap 429 or 5xx (all ops) | Up to 3 retries with `min(8, 0.5 * 2^n + jitter)` s backoff (1 retry for `decide_next`). |
| Referee unreachable | 3 tries with 1, 2 and 3 s pauses, then `RefereeError`. The run stops rather than guess a verdict. A ctx-header fetch failure only means an empty header. Run `crew.doctor` first. |
| Referee HTTP error | `RefereeError` right away; there is no retry on a real answer. |
| Rebuild failure | Logged as a narration line ("Rebuild hiccup"); the run continues. |
| Distiller failure | Swallowed: no idiom and no name for that function. The match stands. |
| Event listener error | Swallowed, because narration must never break a run. |
| Atlas unreachable | The library falls back to local JSON at start-up, and `library_backend` says so. |
| Spend | New work stops at 90% of the run budget, and each function stops at its own dollar cap. |
| Jobs API job crash | The job's status becomes `failed` with an `error` string. |

## 7. Isolation

Every file read in the crew goes through `guard.safe_read`, which refuses `lab/secrets/`, `crew/bench/answers/` and `lab/out/viz_map.json` after resolving symlinks. The crew's only view of the game is `target.py`: the manifest, the per-function asm, the ctx headers, and C it has already recovered itself. The Snap router and director work from that same view, and they never see the hidden map.
