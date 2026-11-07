# crew/ · Lane B · The Crew

`python` `multi-agent` `matching-decompilation` `muse-spark` `subq-snap` `fetch-ai` `mongodb-atlas`

> Software dies when its source code does. The crew brings it back from the binary, and a compiler proves every byte. Doom is just the first patient.

The crew is the part of Frankenstein that writes code. It gets one compiled function at a time as anonymized Thumb disassembly, writes C until the referee (a real compiler with the target's exact flags) says the bytes are identical, and then tries hard to prove itself wrong before anything is accepted. It learns generic compiler habits as it goes, so run N+1 is faster than run N. It never sees original names, hidden source, or the visual map. Doom is our proof case because we can check every answer against hidden source. The method works on any program you're allowed to rebuild.

Deep dive: [`ARCHITECTURE.md`](ARCHITECTURE.md). Results: [`EXPERIMENTS.md`](EXPERIMENTS.md). Contracts: [`../contracts/CONTRACTS.md`](../contracts/CONTRACTS.md) sections 4b, 5 and 6.

## The cast

| Role | Who | Personality |
|---|---|---|
| **Digger** (N in parallel) | Muse Spark 1.3; Muse Wonder 1.0 when escalated | Eager grad student. "Got it. Pretty sure." Is sometimes wrong, always confident. |
| **Checker** | the referee, re-run from scratch, plus SubQ Snap | Stern examiner. "Byte 14 is lying." Trusts nobody, least of all the Diggers. |
| **Distiller** | Muse Spark, low effort, off the critical path | Quiet librarian. Files the lesson and throws away the answer. |
| **Archivist** | templates, no model call on the hot path | Dry museum curator. "Somewhere, a 2004 programmer nods." |
| **Cartographer** | SubQ `subq-preview` (pending early access) | Mapmaker. Reads the whole program at once and draws the structs. |
| **Director** | SubQ Snap, watching live frames | Stage manager. Rebuilds whatever you're looking at first. |

## Every sponsor is load-bearing

Take any one of these away and something specific stops working.

**Meta Muse Spark + Muse Wonder: the hands.** Every line of recovered C is written by Muse. Diggers run a tool-calling loop on Spark with the referee as a tool. Stubborn functions escalate to Wonder. Metrics carry a per-model `muse.by_model` block (calls and cost), and every `fn.matched` records which models wrote it. No Muse, no code.

**SubQ Snap 1.1: the judgment.** Snap is the only model here that reads the whole game at once and returns calibrated probabilities. It makes six kinds of decision:
1. **Triage.** One whole-program pass scores every function's difficulty with its callees in view. That sets the work order and each function's attempt budget.
2. **Keep, escalate or abandon.** After each failed attempt (from the second on), Snap decides whether to keep going on Spark, move to Wonder, or stop spending.
3. **Fakematch gate.** Every byte MATCH also has to clear Snap's fakematch and recital probabilities (reject at 0.85 or higher) before the Checker accepts it.
4. **Play-to-recover director.** It watches live frames and heartbeats and picks what to rebuild next, so the part of the screen you're looking at heals first.
5. **Eyes.** A behavioural check: two frames, original and rebuilt, and the question "did it change the way we said it would, and nothing else?"
6. **Router for ASI:One.** It turns plain words ("bring back Doomguy's face") into candidate functions, from the disassembly alone. Measured against the hidden map, outside the crew: hud precision@10 was 1/10 (random 0.2) and weapons 4/10 (random 0.55). So it is a hint, always labelled inferred, and the referee still proves any recovery.

**The Cartographer runs on `subq-preview`, which is pending early access.** Until Subquadratic grants that access, we do not claim it. `--provider meta` exists only to test the pipeline and is labelled `meta-fallback` everywhere.

**Fetch.ai ASI:One: the front door.** Anyone can verify or request a recovery from an ASI:One chat. The Frankenstein Referee agent on Agentverse calls the crew jobs API (`python -m crew.serve`, port 7111) and re-checks with the referee before it reports success. The API offers `POST /jobs` with `{"fn": "fn_…"}` or a plain-words `{"query": "…"}`, `POST /route`, `GET /jobs/{id}`, `GET /status` and `GET /names/{fn}`.

**MongoDB Atlas: the memory.** Atlas holds the idiom library, which is what makes run N+1 faster, and it is meant to be the system of record. Today only the idiom library goes to Atlas; attempts and verdicts live in `events.jsonl`, and mirroring them to Atlas is not wired yet. **Until `MONGODB_URI` is set, the library falls back to a local JSON file**, and `metrics.json` says so in `library_backend`. Demo runs set the URI.

## Quickstart

```bash
python -m crew.doctor                       # pings Meta, SubQ, the referee and Atlas; says plainly what works

# Wiring run: real Muse calls, FAKE verdicts. Labelled "(mock referee)" and fixture: true.
REFEREE_URL=mock python -m crew.run --limit 3 --max-size 64 --label "wiring"

# Real run against your local referee (lab/setup_referee.sh, then python3 -m lab.referee serve on :7101)
python -m crew.run --split train --library learning --diggers 6 --live
python -m crew.run --split heldout --library on  --label "heldout · library on"

# Bench: 20 original functions, real compiler, never Doom. Results are always labelled "bench".
python -m crew.bench.referee serve --port 7121 &
REFEREE_URL=http://127.0.0.1:7121 FRANK_MANIFEST=crew/bench/out/manifest.json \
  python -m crew.run --split train --label "bench · train · library learning"

# Jobs API for ASI:One (add --mock for instant fixture answers)
python -m crew.serve --port 7111
curl -s localhost:7111/jobs -d '{"query": "bring back the face"}'

# On stage: three small functions, live, with a terminal timer
python -m crew.demo --pick 3 --live

# Play to recover: Lane D's tap posts heartbeats, Snap steers every 4 s
python -m crew.run --split train --director --live
curl -s localhost:7112/heartbeat -d '{"running": ["fn_0801B34C"], "frame_png_b64": "…"}'

# Cartographer: corpus stats with no API call, then the real pass, then feed the header to a run
python -m crew.cartographer --run-dir runs/r01 --dry-run
python -m crew.cartographer --run-dir runs/r01 --emit
python -m crew.run --split heldout --library on --cartographer runs/r01/types.h

make test-crew                              # offline: scripted model, mock referee, no keys, no network
```

Keys go in `.env`: `META_API_KEY`, `SUBQ_API_KEY`, `MONGODB_URI`. Without `SUBQ_API_KEY` the crew still runs, but on a fixed rule (escalate after 3 failures, no triage, no gate), and `metrics.snap` is `null`.

## Latency

The crew is model-bound. Here is where the time goes:

| Step | Time | Source |
|---|---|---|
| One Muse call (a Digger turn) | seconds | DECISIONS 11:40 |
| Referee check | 0.1 to 0.2 s | DECISIONS 11:24 |
| Snap keep / escalate / abandon, fakematch review | 0.4 to 1.2 s (review median 0.57 s, slowest seen 2.8 s) | `snap.decision` latency_ms |
| Snap director (frame plus up to 40 functions) | about 2.4 s | `snap.decision` latency_ms |
| Snap eyes (two frames) | about 0.7 s | `snap.decision` latency_ms |
| Snap triage, whole program, 208 functions | about 3.4 s | `snap.decision` latency_ms |
| Bench run, 14 functions, 6 Diggers | 80 s in total | `runs/bench_r01` |

What we do about it:
- **Parallel Diggers.** N threads (default 6), each with its own referee calls.
- **Cache-friendly prompts.** The system prompt and tool list are byte-stable across every call, so the provider's prompt cache hits. Everything specific to one function goes in the user message.
- **Everything up front.** The first user message already holds the asm, the ctx header, the top idioms, already-recovered neighbours and the Cartographer's types, so most functions need no lookup round trips.
- **Effort ladder.** Easy functions (difficulty under 0.35) start at medium reasoning effort. After 3 failures effort goes back to high, and Snap can escalate to Wonder.
- **Verdict cache.** Verdicts are cached by SHA-1 of the source, so an identical resubmission costs nothing. A claim is still always re-checked fresh.
- **Off the critical path.** The Distiller and naming run in a 2-thread pool after the match. Narration is template-based and makes no model call.
- **Snap timeouts.** Keep / escalate / abandon and director calls are capped at 8 s (the review at 20 s). Every Snap failure has a safe fallback: keep going, boost the hottest running function, or let the referee and the hard rules decide alone.
- **Atomic live switch.** `runs/live` is swapped with a symlink rename, so the Stage never reads a half-switched run.

**Language note.** Python stays. A model call takes seconds and a referee check takes 0.1 to 0.2 s; our own code is microseconds of glue. Rewriting it in Rust, Go or Zig would cost hours and make nothing measurably faster.

## Honesty rules

- **Never fake a verdict.** Only the referee's MATCH, re-checked by the Checker and passed by the fakematch review, counts as recovered. The Digger never marks its own work done.
- **Mock and fixture runs are labelled.** Their label says `(mock referee)` or `(fixture target)` and `metrics.json` carries `fixture: true`. The mock jobs API marks its answers `fixture: true` too.
- **The bench is labelled bench.** It is never presented as a Doom result.
- **Names are inferred.** Every name in `names.json` and `/names/{fn}` has `inferred: true`. Only bytes, SHA-1s and match percentages are observed.
- **The crew can't read the answers.** `crew/guard.py` blocks `lab/secrets/`, `crew/bench/answers/` and `lab/out/viz_map.json` for every file read in the crew process, and `crew/tests/test_guard.py` proves it.
- **Idioms are generic.** An idiom whose example shares 3 or more consecutive lines with the accepted source is rejected, so the held-out runs stay honest.
- **Results we don't like still ship.** If the library or the Cartographer doesn't help, `EXPERIMENTS.md` says so.

## Files

| File | What it does |
|---|---|
| `run.py` | The run: scheduler, threads, acceptance, Distiller, director HTTP server, `metrics.json` and `names.json` |
| `digger.py` | The Digger's tool-calling loop, attempt budget, effort ladder, escalation, claims |
| `checker.py` | Verdicts (cached), fresh claim re-verification, fakematch rules and the Snap gate |
| `snap.py` | SubQ Snap Decisions API: triage, review, decide_next, route, usage stats |
| `director.py` | Play to recover (heartbeats and frames, then Snap picks) and `eyes()` |
| `cartographer.py` | Whole-program `types.h` pass on `subq-preview`, validated with a real compiler |
| `library.py` | Idiom library: Atlas or local JSON, leak check, dedupe |
| `archivist.py` | Template narration and announcer lines, at most 90 characters each |
| `prompts.py` | Byte-stable Digger system prompt and tools; Distiller prompt |
| `llm.py` | Stdlib OpenAI-compatible client for the Meta API; the `muse` usage block |
| `referee.py` | HTTP client for Lane A's referee, and the labelled mock |
| `target.py` | The crew's only view of the game: manifest, asm, ctx, neighbours |
| `events.py` | Append-only, thread-safe `events.jsonl` writer |
| `guard.py` | Isolation: the paths the crew may never read |
| `serve.py` | Crew jobs API on :7111 for ASI:One |
| `demo.py` | On-stage live segment with a terminal timer |
| `doctor.py` | Dependency check |
| `config.py` | The one place that reads the environment |
| `bench/` | Real-compiler bench: 20 original functions and a contract-compatible referee ([`TOOLCHAIN.md`](bench/TOOLCHAIN.md)) |
| `tests/` | Offline tests: archivist, cartographer, checker, digger, guard, library, llm, run, serve, snap |
