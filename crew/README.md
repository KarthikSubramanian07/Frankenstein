# crew/ · The Crew

`video-game-preservation` `multi-agent` `matching-decompilation` `muse-spark` `subq-snap` `fetch-ai` `mongodb-atlas`

**Lost games, rebuilt and proven.**

87% of classic games are endangered, and most of their source code is gone. The crew rebuilds it from the cartridge, one function at a time. A compiler checks every byte.

1. **Dig.** Agents read the compiled game and write C, one function at a time.
2. **Check.** A compiler rebuilds every piece. Byte-identical or it's out. Lies get caught.
3. **Learn.** Every match teaches the crew a habit, so the next game goes faster.

Doom is our first patient: famous, hidden from the agents, and checkable byte for byte. Agents lie. The referee doesn't.

Deep dive: [`ARCHITECTURE.md`](ARCHITECTURE.md). Results: [`EXPERIMENTS.md`](EXPERIMENTS.md). Contracts: [`CONTRACTS.md`](../contracts/CONTRACTS.md) sections 4b, 5 and 6.

## The cast

| Role | Runs on | Personality |
|---|---|---|
| **Digger** (6 in parallel) | Muse Spark 1.3, Muse Wonder 1.0 when stuck | Eager grad student. "Got it. Pretty sure." |
| **Checker** | the referee, re-run fresh, plus Snap and Gemini | Stern examiner. "Byte 14 is lying." |
| **Distiller** | Muse Spark, low effort, after the match | Quiet librarian. Keeps the lesson, throws away the answer. |
| **Archivist** | templates, no model call | Dry museum curator. "Somewhere, a 2004 programmer nods." |
| **Cartographer** | SubQ `subq-preview` (pending access) | Mapmaker. Reads the whole program and draws the structs. |
| **Director** | SubQ Snap, watching live frames | Stage manager. Play it, and we rebuild it. |

## Sponsors are the organs, not the logos

| Partner | Role | One line |
|---|---|---|
| Meta Model API (Muse Spark, Muse Wonder) | The hands | Writes every line of recovered C. |
| Subquadratic (SubQ Snap) | The judgment | Reads the whole game at once and decides where every attempt goes. |
| Fetch.ai (ASI:One) | The front door | Ask for a recovery in a chat. Get proof back. |
| MongoDB Atlas | The memory | Remembers every trick, so the next game is faster. |
| Google Gemini | The second opinion | A different lab double-checks every match. |

**Muse.** Diggers run a tool-calling loop on Spark, with the referee as a tool, and stubborn functions escalate to Wonder. `metrics.json` splits calls and cost per model in `muse.by_model`.

**Snap makes six calls.**
- **Triage:** one whole-program pass sets the work order and each function's attempt budget.
- **Keep, escalate or abandon:** after each failed attempt from the second on.
- **Fakematch gate:** every MATCH must also clear Snap's fakematch and recital checks (it rejects at 0.85).
- **Director:** watches live frames and heartbeats, and heals what you're looking at first.
- **Eyes:** compares original and rebuilt frames. Did it change as claimed, and nothing else?
- **Router:** turns plain words into candidate functions for ASI:One. It is a useful hint, 5 to 7 times better than random, labelled inferred and not precise.

**Cartographer.** It needs `subq-preview` early access, and until Subquadratic grants it, we don't claim it. Its `--provider meta` mode is only for testing the pipeline, and it is labelled `meta-fallback`.

**ASI:One.** The Frankenstein Referee agent on Agentverse calls the jobs API (`crew.serve`, port 7111) and re-checks with the referee before it answers. The endpoints are `POST /jobs` (with `fn` or a plain-words `query`), `POST /route`, `GET /jobs/{id}`, `GET /status` and `GET /names/{fn}`.

**MongoDB.** Atlas holds the idiom library; attempts and verdicts still live in `events.jsonl`. Until `MONGODB_URI` is set, the library falls back to local JSON, and `library_backend` in `metrics.json` says so.

**Gemini.** It runs in parallel with Snap on every MATCH, so it adds no wait. It rejects alone only at 0.95, or at 0.7 when Snap agrees, and `--no-gemini` turns it off.

## Quickstart

```bash
python -m crew.doctor                        # what works, said plainly

# Wiring: real Muse calls, FAKE verdicts, labelled "(mock referee)" and fixture: true
REFEREE_URL=mock python -m crew.run --limit 3 --max-size 64 --label "wiring"

# Real runs against your local referee on :7101 (lab/setup_referee.sh, then python3 -m lab.referee serve)
python -m crew.run --split train --library learning --diggers 6 --live
python -m crew.run --split heldout --library on --label "heldout · library on"

# Bench: 20 original functions, real compiler, never Doom, always labelled "bench"
python -m crew.bench.referee serve --port 7121 &
REFEREE_URL=http://127.0.0.1:7121 FRANK_MANIFEST=crew/bench/out/manifest.json \
  python -m crew.run --split train --label "bench · train · library learning"

# Jobs API for ASI:One (--mock for instant fixture answers)
python -m crew.serve --port 7111
curl -s localhost:7111/jobs -d '{"query": "bring back the face"}'

# On stage: 3 small functions, live, with a timer
python -m crew.demo --pick 3 --live

# Play to recover: Lane D posts heartbeats, Snap steers every 4 s
python -m crew.run --split train --director --live
curl -s localhost:7112/heartbeat -d '{"running": ["fn_0801B34C"], "frame_png_b64": "…"}'

# Cartographer: dry run, real pass, then feed the header to a run
python -m crew.cartographer --run-dir runs/r01 --dry-run
python -m crew.cartographer --run-dir runs/r01 --emit
python -m crew.run --split heldout --library on --cartographer runs/r01/types.h

make test-crew                               # offline: no keys, no network
```

Keys go in `.env`: `META_API_KEY`, `SUBQ_API_KEY`, `MONGODB_URI` and `GEMINI_API_KEY`. Without SubQ the crew still runs on a fixed rule (escalate after 3 failures), and `metrics.snap` is `null`.

## Latency

The models set the pace. Our code is glue.

| Step | Time | Source |
|---|---|---|
| One Muse call (a Digger turn) | seconds | DECISIONS 11:40 |
| Referee check | 0.1 to 0.2 s | DECISIONS 11:24 |
| Snap keep / escalate / abandon, fakematch review | 0.4 to 1.2 s (review median 0.57 s, slowest 2.8 s) | `snap.decision` events |
| Snap director (frame plus up to 40 functions) | about 2.4 s | `snap.decision` events |
| Snap eyes (two frames) | about 0.7 s | `snap.decision` events |
| Snap triage, 208 functions | about 3.4 s | `snap.decision` events |
| Bench run, 14 functions, 6 Diggers | 80 s | `runs/bench_r01` |

What we do about it:
- **Parallel Diggers:** 6 threads by default.
- **Cache-friendly prompts:** the system prompt and tools are byte-stable, so the prompt cache hits.
- **Everything up front:** asm, ctx, idioms, neighbours and types go in the first message, so there are no lookup round trips.
- **Effort ladder:** easy functions start at medium effort; after 3 failures it goes back to high, and Snap can call in Wonder.
- **Verdict cache:** keyed by the source's SHA-1, so a resubmission is free. Claims are always re-checked fresh.
- **Off the critical path:** the Distiller and naming run after the match, and narration is templates.
- **Snap timeouts:** decide and director calls are capped at 8 s and the review at 20 s, and every failure has a safe fallback.
- **Atomic live switch:** `runs/live` flips with a symlink rename.

**Why Python.** A model call takes seconds and a referee check takes 0.1 to 0.2 s. Rust, Go or Zig would cost hours and save nothing you could measure.

## Honesty rules

- **Never fake a verdict.** Only a fresh referee MATCH that passes the fakematch review counts. The Digger never marks its own work done.
- **Mock and fixture runs say so.** They are labelled `(mock referee)` or `(fixture target)`, with `fixture: true` in `metrics.json`.
- **Bench is bench.** It is never presented as Doom.
- **Names are guesses.** Every name carries `inferred: true`. Only bytes, SHA-1s and match percentages are observed.
- **No peeking.** `crew/guard.py` blocks `lab/secrets/`, `crew/bench/answers/` and `lab/out/viz_map.json`, and `tests/test_guard.py` proves it.
- **Idioms stay generic.** An idiom whose example shares 3 lines with the answer is rejected.
- **Bad results ship too.** If something doesn't help, `EXPERIMENTS.md` says so.

Games don't have to die. Anywhere the only thing left is the compiled program, Frankenstein can bring the source back.

## Files

| File | What it does |
|---|---|
| `run.py` | Scheduler, threads, acceptance, Distiller, director server, `metrics.json`, `names.json` |
| `digger.py` | Tool-calling loop, attempt budget, effort ladder, escalation, claims |
| `checker.py` | Cached verdicts, fresh claim checks, fakematch rules, Snap and Gemini gate |
| `gemini.py` | Gemini second-opinion review (advisory) |
| `snap.py` | SubQ Snap: triage, review, decide_next, route, usage stats |
| `director.py` | Play to recover, and `eyes()` |
| `cartographer.py` | Whole-program `types.h` on `subq-preview`, compile-checked |
| `library.py` | Idiom library: Atlas or local JSON, leak check, dedupe |
| `archivist.py` | Narration and announcer lines, 90 characters max |
| `prompts.py` | Byte-stable Digger prompt and tools; Distiller prompt |
| `llm.py` | Stdlib Meta API client; the `muse` usage block |
| `referee.py` | Lab referee client, plus the labelled mock |
| `target.py` | The crew's only view of the game |
| `events.py` | Append-only, thread-safe `events.jsonl` writer |
| `guard.py` | Paths the crew may never read |
| `serve.py` | Jobs API on :7111 for ASI:One |
| `demo.py` | On-stage segment: 2 or 3 small functions, live calls, real verdicts, a timer |
| `doctor.py` | Dependency check |
| `config.py` | The one place that reads the environment |
| `bench/` | Real-compiler bench: 20 original functions and a referee ([`TOOLCHAIN.md`](bench/TOOLCHAIN.md)) |
| `tests/` | Offline tests, including the two-lab review |
