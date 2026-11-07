# LANE B — The Crew (Agents)

> **Read `DECISIONS.md` → "Corrections" first. Where it disagrees with this file, DECISIONS.md wins (clock, compiler, rebuild, variant, finale, judging).**


Paste everything below the line into Claude Code as your first message, from the repo root.

---

You are the agents engineer on FRANKENSTEIN. Coding agents rebuild a Game Boy Advance game's lost C source, function by function, from disassembly; a compiler referee decides what counts. Run `git pull --rebase` first: the foundation (tag `v0-foundation`, made by `docs/LANE_0_BOOTSTRAP.md`) already has the folders, contracts, schemas, and fixtures. Read `docs/00_START_HERE.md` and `contracts/CONTRACTS.md` in full first. You own `crew/` only, and you write `runs/<run_id>/` files in the contract formats.

Until Lane A's referee is live (~11:30), run against `python -m lab.referee mock serve` or your own mock that returns the fixture JSON. Never wait.

## What you are building

Five roles, one scheduler, one memory, one experiment harness:

| Role | Model | Job | Personality (for event text) |
|---|---|---|---|
| Digger (N parallel) | Muse Spark 1.3 | Write C for one function until the referee says MATCH or budget runs out | Eager grad student. "Got it. Pretty sure." |
| Checker | Muse Spark 1.3 (optionally Gemini, see below) | Independently re-run the referee on every claim; review accepted code for period-plausible idioms; reject fakes | Stern examiner. "Byte 14 is lying." |
| Archivist | Muse Spark 1.3, low effort | Turn events into short narration lines; name recovered functions from what they do | Dry, nerdy museum curator |
| Distiller | Muse Spark 1.3 | After each MATCH, extract a reusable idiom (not the code) into the library | Quiet librarian |
| Cartographer | SubQ (`subq-preview`) | Whole-program pass over the full disassembly + recovered C; propose shared structs and function signatures | Mapmaker |

## Step 0 — Docs and keys (by 10:20)

- Read current docs: Meta Model API (dev.meta.ai docs; base `https://api.meta.ai/v1`, model `muse-spark-1.3`, OpenAI-compatible chat completions and Responses API, Anthropic-compatible `/v1/messages`, `reasoning_effort` minimal…xhigh with max announced, function calling, image input). Confirm the model id the API actually returns. Use the standard tier, never `-contributor` (it may train on prompts).
- SubQ docs (https://docs.subq.ai/): base `https://api.subq.ai/v1`, model `subq-preview`, OpenAI-compatible; production context up to 1M tokens. If no key by 12:00, skip the Cartographer and note it.
- MongoDB Atlas: Python driver, Atlas Vector Search index creation. Use an embedding model you can call (Voyage via Atlas if available, else any embedding endpoint you have a key for; note the choice).
- Write `crew/doctor.py`: pings each API, prints the model id, fails clearly.
- At 10:15, run a five-function smoke test: give Muse Spark 5 small Thumb functions from the fixture-style asm and ask for C. Report how close it gets. This decides prompt strategy early.

## Step 1 — The Digger loop (by 12:30 first real match)

Implement as a tool-calling agent over the Meta Model API (Responses API preferred for reasoning carry-over; chat completions acceptable). Tools:

- `get_asm(fn)` → the function's `.s` text
- `get_context(fn)` → the ctx header (types, externs, registers)
- `get_neighbors(fn)` → callers/callees ids, their recovered C if accepted, their signatures
- `search_idioms(query)` → top 5 idioms from the library (empty when the run's `library` is `off`)
- `get_draft(fn)` → an m2c draft (`m2c.py -t gba`) if Lane A or you can produce it; else Ghidra headless; else empty. Treat it as a hint, not truth.
- `referee_check(src)` → contract JSON from `REFEREE_URL`
- `submit_claim(text)` → the Digger states it believes the latest attempt matches. Emit `claim.made` before the Checker verifies.

Loop rules:
- Attempt budget per function scales with `difficulty` (e.g. 4 to 12 attempts) and a per-function dollar cap.
- After each `PARTIAL`, the next prompt gets the `first_diff`, the `diff` list, and the instructions around it. Keep the prompt small: asm, ctx, best attempt so far, diff, top idioms.
- Any `MATCH` from the Digger's own `referee_check` still goes to the Checker. The Digger never marks a function done.
- Emit `fn.claimed`, `attempt.submitted` (with tokens and cost from the API `usage` field × price, plus `src_preview`: the first 40 lines of the submitted C, so the Stage can stream it into the code window on the Split scene), `claim.made`, and on give-up `fn.abandoned`.
- After every 3 accepted functions (and at least every 2 minutes during the live run), call the Lab's `rebuild --fast` so the live game can be hot-swapped onto more agent-written code.
- Write accepted source to `runs/<run_id>/recovered/<fn>.c` only after the Checker accepts.

## Step 2 — The Checker (the "verify" theme; make it great)

- On every `claim.made`, independently call the referee with the exact submitted source. Never trust the Digger's tool output.
- Emit `verdict` with `claim_was_true`. A claim with a non-MATCH verdict is a **false claim**; count it.
- On MATCH, run a short idiom review: does this look like code a 2000s GBA programmer would write, or like compiler coaxing? Reject with a reason if it's a fakematch the linter missed (e.g. pointless temporaries, nonsense casts, volatile abuse). Be strict, but don't reject plausible code. Log reasons.
- Accept → `fn.matched`. Reject → back to the Digger with the reason.
- Optional second-model review: if a Google prize is confirmed (see `DECISIONS.md`), run the idiom review with Gemini as a second opinion and show "reviewed by a different lab's model" on the Time trial scene. Muse Spark remains the Digger model either way.
- Path guard: before any file read in the crew process, call `python -m lab.guard check <path>` or an equivalent in-process check; refuse anything under `lab/secrets/`. Add a test that proves it (T4).

## Step 3 — Memory that makes it better every run

Idiom library in MongoDB (`idioms` collection + vector index):
- After each accepted match, the Distiller writes 0–2 idioms: a title, `applies_when` (asm pattern in words), `do` (the C shape that produces it), a tiny generic example (≤ 6 lines, invented names), and the source function id for provenance.
- Hard rule: idioms must be generic. Reject any idiom whose example shares 3+ consecutive lines with the accepted source. This keeps held-out evaluation honest.
- Dedupe by embedding similarity; merge near-duplicates and increment `uses`.
- Emit `idiom.learned` and, when retrieved into a prompt, `idiom.used`.
- Also store every attempt and verdict in MongoDB (`attempts`, `runs`) as the system of record; `events.jsonl` remains the contract for the Stage. Optional: a change-stream relay that writes to `events.jsonl`, if you want MongoDB to be the live source.

## Step 4 — The Cartographer (SubQ, measured)

- Concatenate the full disassembly (all `.s`) + all accepted C + the ctx headers into one request (well under 1M tokens for this game).
- Ask for: shared struct definitions inferred across functions, function signatures, and which globals are arrays vs scalars. Output must compile as a header.
- Validate by compiling it with the referee's compiler; drop anything that breaks.
- Feed the accepted header to Diggers as `types.h` when the run flag `cartographer: on`.
- Emit `types.proposed`. Measure it in the ablation (Step 6). If it doesn't help, say so honestly; the honest finding is still a good slide.

## Step 5 — The Archivist (personality)

- Consume events; produce at most one `narration` line every 8 seconds, ≤ 90 characters, grounded strictly in the event (never invent facts).
- Moods: `dry` (default), `alarmed` (false claim), `proud` (milestones 25/50/75/100%), `hushed` (finale).
- Write 40 hand-written fallback lines in `crew/archivist/lines.yaml` with the team (fun, specific, human). The model may pick and lightly fill templates, e.g. "Another claim, another lie. Byte {offset} disagrees." / "That's the jump routine. Programmers in 2001 loved this trick." Keep the voice consistent.
- Function naming: when a function is accepted, the Archivist proposes a human name from the recovered C (and, if Lane D provides screenshots in `creature/shots/`, from Muse Spark image input of the game at that moment). Store names in `runs/<run_id>/names.json`. This is display-only.
- `speak: true` only for priority ≥ 2 lines, so the voice stays sparse.
- The Stage is a retro game (see `02_DESIGN.md`), so also emit short announcer lines (priority 3, `speak: true`, four words or fewer): "Round sixty-three. Fight." / "Claim rejected!" / "New lap record." / "Halfway recovered!" The dry, funny lines stay in the scrolling ticker (`speak: false`).

## Step 6 — Experiments (this is the "measurably better" proof; protect it)

All runs use the same model, reasoning effort, attempt budget, and dollar budget per function. Record everything in `metrics.json`.

| Run | Split | Library | Purpose |
|---|---|---|---|
| r01 | train | learning (starts empty, grows) | builds the library; shows the within-run curve bending up |
| r02 | heldout | on (frozen from r01) | treatment |
| r03 | heldout | off | control |
| r04 (if SubQ) | heldout | on + cartographer | does whole-program context help |
| r05 (stretch) | game 2 | on (frozen) | transfer |

Report per run: match rate, attempts per match, minutes per match, cost per match, false claims caught, fakematches rejected, a matched-over-time curve sampled every minute, and the `muse` usage block (contract 6c: calls, tool calls, image calls, tokens, reasoning effort, cost). The Meta prize is "best use of the Meta Model API": make the depth of use visible and true. Write `crew/EXPERIMENTS.md` with the setup and results in plain sentences. If r02 isn't better than r03, the slide says so; we don't hide results.

Schedule: start r01 by 12:30 at the latest; r02 and r03 in parallel right after. Keep a live run (`runs/live`) for the demo separate from experiment runs.

## Step 7 — Scheduler and safety

- N Diggers (start at 6; respect the API's rate limits; back off on 429 with jitter).
- Order: leaves before callers (callees recovered first give better context), easy before hard.
- `RUN_BUDGET_USD` hard cap; stop new claims when 90% spent.
- `crew/run.py --label "…" --split train|heldout --library on|off|learning --cartographer on|off --diggers 6 --live` writes a new `runs/<run_id>/` and, with `--live`, points `runs/live` at it.
- `crew/demo.py --fns fn_…,fn_… --live` for the on-stage segment: 2–3 small functions with fresh attempts, real API calls, real verdicts.

## Step 7b — Crew jobs API (Lane A's ASI:One agents depend on it; Fetch.ai prize)

`python -m crew.serve --port 7111` exposes the contract in `contracts/CONTRACTS.md` section 4b: `POST /jobs`, `GET /jobs/{id}`, `GET /status`, `GET /names/{fn}`. Ship `--mock` mode by 11:00 so Lane A can build against it; the real mode by 13:00. A job is a one-function recovery in its own run directory with its own small budget, using the same Digger + Checker path. Names returned here are always marked `inferred: true`.

## Step 8 — Tests

- Mock referee end-to-end: a run emits every event type and a valid `metrics.json` (validate against `contracts/schemas/`).
- Claim accounting: a scripted sequence of claims and verdicts yields the right false-claim count.
- Idiom leakage check rejects a copied example.
- Path guard test (T4).
- Budget cap stops the run.

## Hand-offs

- 11:00: your mock run writes a realistic `events.jsonl` that Lane C can point at (if their fixture isn't ready).
- 11:00: `crew.serve --mock` running for Lane A.
- 12:30: first real match. Post the function, attempts, and cost.
- 13:00: `crew.serve` real.
- 14:15: r01–r03 metrics posted with one-sentence findings.
- Freeze − 60: `crew/demo.py` rehearsed three times on the stage laptop.

## Rules

Follow `docs/00_START_HERE.md` section 15. Never fake a number or a verdict. Never read `lab/secrets/`. Start with Step 0 now; do not ask whether to begin.
