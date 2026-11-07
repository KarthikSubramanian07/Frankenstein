# FRANKENSTEIN — Shared Contracts

> v1 includes the audit corrections logged in `DECISIONS.md` (compiler, rebuild method, memory probe). Schemas in `contracts/schemas/` are authoritative.

These are the only things lanes share. If you build to these, you never wait on anyone.
Copy this file to `contracts/CONTRACTS.md` in the repo. Each lane creates its own mock that produces exactly these shapes.

Contract version: **v1**. Changing a contract: bump to v1.1, write one line in `DECISIONS.md`, post in the team channel. Additive fields are always allowed; renames and removals are not.

---

## 1. Repo layout

```
frankenstein/
  README.md                 # written last by whoever is free; judge-facing
  DECISIONS.md              # every assumption, contradiction, partner prize answer
  .env.example
  contracts/
    CONTRACTS.md            # this file
    schemas/                # JSON Schemas for every shape below (Lane A writes first draft at 10:15, others may add)
    fixtures/               # sample payloads every lane can build against
      manifest.sample.json
      referee_result.match.json
      referee_result.partial.json
      events.sample.jsonl   # ~400 lines: a full fake run, all event types
      metrics.sample.json
      sprite_frame.sample.json
  lab/        # Lane A only
    agents/                 # Fetch.ai uAgents: referee_agent, excavator_agent, curator_agent (ASI:One)
    secrets/                # answer key (original game source). gitignored. never mounted for crew
    out/                    # manifest.json, asm/, ctx/, target ROM, viz_map.json
  crew/       # Lane B only
  stage/      # Lane C only
  creature/   # Lane D only
  runs/
    <run_id>/
      events.jsonl          # append-only, written by B (and D for patch/build events)
      metrics.json          # written by B at run end
      recovered/<fn_id>.c   # accepted sources, written by B
    live -> <run_id>        # symlink to the run currently on stage
```

Lane 0 (`docs/LANE_0_BOOTSTRAP.md`) creates this skeleton plus the fixtures from section 9, tags `v0-foundation`, and pushes by ~10:15. That is the only shared setup step; the kit Markdown lives in `docs/`.

## 2. Environment

`.env.example` (never commit real values):

```
META_API_KEY=
META_BASE_URL=https://api.meta.ai/v1
META_MODEL=muse-spark-1.3
META_REASONING_EFFORT=high
SUBQ_API_KEY=
SUBQ_BASE_URL=https://api.subq.ai/v1
SUBQ_MODEL=subq-preview
MONGODB_URI=
MONGODB_DB=frankenstein
GEMINI_API_KEY=                 # optional, only if a Google prize exists
AGENTVERSE_API_KEY=             # optional (Lane A stretch)
RUN_BUDGET_USD=40
REFEREE_URL=http://127.0.0.1:7101
FRANK_RUN_DIR=./runs/live
```

Ports: referee 7101 · crew jobs 7111 · stage http 7201 · stage websocket 7202 · creature bridge 7301 · overlay page 7302 · phone page 7401.

## 3. Target manifest — `lab/out/manifest.json` (Lane A writes, everyone reads)

```json
{
  "v": 1,
  "game": {
    "id": "doom",
    "title": "GBADoom (prBoom, Doom shareware)",
    "license": "see DECISIONS.md",
    "rom_path": "lab/out/target.gba",
    "rom_sha1": "…",
    "compiler": { "name": "devkitARM GCC", "version": "devkitARM r<NN> (gcc <x.y.z>)", "flags": "GBADoom Makefile flags minus -flto=8 (fallback -O2 if -O3 inlining blocks matches)" }
  },
  "functions": [
    {
      "id": "fn_08000A1C",
      "addr": "0x08000A1C",
      "size": 84,
      "mode": "thumb",
      "scope": "game",
      "split": "train",
      "asm_path": "lab/out/asm/fn_08000A1C.s",
      "callees": ["fn_08000B40"],
      "callers": ["fn_080003F0"],
      "difficulty": 0.31
    }
  ]
}
```

- `id` is the address-based name. Original names never appear here.
- `scope`: `game` (to recover) or `library` (crt0, libgcc, libtonc: counted as pre-recovered, shown greyed out).
- `split`: `train` or `heldout` (about 30% heldout, stratified by size). Lane B's experiments depend on this.
- `difficulty`: 0–1, Lane A's estimate from size and branch count.

### Visual-only map — `lab/out/viz_map.json` (Lane A writes; only C and D read)

```json
{ "v": 1, "subsystems": [ { "id": "player", "label": "the ship", "functions": ["fn_08000A1C", "…"] } ] }
```

Derived from the hidden source file each function came from. **The crew must never read this file.** It exists only so the screen can show which part of the game heals. Say this on stage if asked.

## 4. Referee — Lane A provides, B calls, D calls for the patch

Two equivalent interfaces. Same JSON in and out.

CLI:
```
python -m lab.referee check --fn fn_08000A1C --src path/to/candidate.c [--json]
python -m lab.referee context --fn fn_08000A1C          # prints the ctx header to prepend when compiling
python -m lab.referee rebuild --recovered runs/live/recovered --json
python -m lab.referee patch --fn fn_08000A1C --src fixed.c --json
python -m lab.referee serve --port 7101
python -m lab.referee mock serve --port 7101              # fixture-backed fake for B and D
```

HTTP (`serve`): `POST /check {fn, src}` · `GET /context/{fn}` · `POST /rebuild {recovered_dir}` · `POST /patch {fn, src}` · `GET /health`.

`check` result:
```json
{
  "v": 1,
  "fn": "fn_08000A1C",
  "status": "MATCH",
  "match_pct": 100.0,
  "first_diff": null,
  "diff": [],
  "lint": { "ok": true, "violations": [] },
  "compile": { "ok": true, "log": "" },
  "elapsed_ms": 412,
  "referee": "lab@<git sha>"
}
```

`status` is one of `MATCH`, `PARTIAL`, `NO_COMPILE`, `LINT_FAIL`.
When `PARTIAL`, `first_diff` is `{ "offset": 14, "expected": "1c08", "got": "1c10", "expected_ins": "adds r0, r1, #0", "got_ins": "adds r0, r2, #0" }` and `diff` lists every differing instruction (max 64 entries).
A function is accepted only when `status == "MATCH"` and `lint.ok == true`.

`rebuild` result: `{ "v":1, "rom_sha1": "…", "original_sha1": "…", "identical": true, "recovered": 61, "from_original": 23, "method": "source-tree" }`
Rebuild method (v1, per audit): drop each recovered function's C into the original source tree in place of the original function and run the normal Makefile. No per-function raw `.s` scaffold. Say on stage: "recovered functions are built from the agents' C, the rest from the original."
`patch` result: `{ "v":1, "rom_path": "…", "rom_sha1": "…", "changed_functions": ["fn_08000A1C"], "unchanged": 83 }`

## 4b. Crew jobs API — Lane B provides, Lane A's ASI:One agents call

Lane B runs `python -m crew.serve --port 7111`. Lane A builds against `python -m crew.serve --mock` (or its own fixture-backed fake) until then.

- `POST /jobs {"fn": "fn_08000A1C", "max_usd": 1.5}` → `{"job_id": "j_17", "run_id": "r_asi_01"}` (starts a one-function recovery in its own run dir)
- `GET /jobs/{job_id}` → `{"status": "running"|"matched"|"abandoned"|"failed", "attempts": 3, "best_pct": 92.4, "cost_usd": 0.31, "src_path": "runs/r_asi_01/recovered/fn_08000A1C.c"|null, "false_claims": 1}`
- `GET /status` → `{"live_run_id": "r07", "pct_recovered": 73.8, "matched": 62, "fn_total": 84, "false_claims": 9, "last_build": {"rom_sha1": "…", "identical": true}}`
- `GET /names/{fn}` → `{"fn": "fn_08000A1C", "name": "update_ship_jump", "inferred": true, "basis": "recovered code + screenshot"}`

Every answer an agent gives to a human must keep two buckets apart:
- **observed**: anything the referee or a rebuild proved (status, match %, first differing byte, SHA-1 equality)
- **inferred**: names, types, descriptions of behavior, guesses about intent

## 5. Event stream — `runs/<run_id>/events.jsonl`

One JSON object per line, append-only, UTF-8, flushed after every line. Lane B writes all crew events; Lane D writes patch/build/phone events into the same file of the live run. Lane C reads. Never rewrite a line.

Common envelope:
```json
{ "v": 1, "ts": "2026-11-07T19:02:11.481Z", "run_id": "r03", "seq": 1842, "type": "verdict", "actor": "checker", "fn": "fn_08000A1C", "payload": {} }
```
`seq` is strictly increasing per writer; C orders by `ts` then `seq`. `actor` is one of `scheduler`, `digger-1…digger-N`, `checker`, `archivist`, `distiller`, `cartographer`, `lab`, `creature`, `human`.

| type | payload | When |
|---|---|---|
| `run.started` | `{label, split, library: "on"\|"off"\|"learning", diggers, model, budget_usd, game_id, fn_total}` | start |
| `fn.claimed` | `{digger, difficulty}` | a Digger picks a function |
| `attempt.submitted` | `{attempt, tokens_in, tokens_out, cost_usd, src_preview}` | Digger sends C to the referee (`src_preview` = first 40 lines) |
| `claim.made` | `{attempt, text}` | Digger asserts it matched (before verification) |
| `verdict` | `{attempt, status, match_pct, first_diff, lint_ok, claim_was_true: bool\|null}` | Checker's independent result |
| `fn.matched` | `{attempts, minutes, cost_usd, src_path, lines}` | accepted |
| `fn.abandoned` | `{attempts, best_pct}` | gave up |
| `idiom.learned` | `{idiom_id, title, applies_when}` | Distiller stored an idiom |
| `idiom.used` | `{idiom_id}` | retrieved into a Digger prompt |
| `types.proposed` | `{source: "subq", structs, signatures}` | Cartographer output |
| `narration` | `{text, mood: "dry"\|"alarmed"\|"proud"\|"hushed", speak: bool, priority: 0-3}` | Archivist line (≤ 90 chars) |
| `metric.tick` | `{pct_recovered, matched, attempted, false_claims, cost_usd, elapsed_s}` | every 5 s |
| `build.rom` | `{rom_sha1, identical, recovered, from_original, pct_agent_code, rom_path}` | after a rebuild |
| `rom.swapped` | `{rom_sha1, pct_agent_code}` | Lane D swapped the rebuilt ROM into the live game |
| `patch.verified` | `{fn, changed_functions, rom_sha1}` | Lane D after `lab patch` |
| `phone.published` | `{url, qr_png}` | Lane D |
| `run.finished` | `{matched, abandoned, pct_recovered, cost_usd, elapsed_s}` | end |

## 6. Metrics — `runs/<run_id>/metrics.json` (Lane B writes, C reads)

```json
{
  "v": 1,
  "run_id": "r03",
  "label": "heldout · library on",
  "split": "heldout",
  "library": "on",
  "model": "muse-spark-1.3",
  "reasoning_effort": "high",
  "fn_total": 26,
  "matched": 17,
  "match_rate": 0.654,
  "attempts_per_match": 3.1,
  "minutes_per_match": 1.8,
  "cost_per_match_usd": 0.42,
  "false_claims_caught": 9,
  "fakematches_rejected": 2,
  "cost_usd": 7.14,
  "curve": [ { "t_min": 0, "matched": 0 }, { "t_min": 1, "matched": 1 } ]
}
```

The Time trial scene reads every `runs/*/metrics.json` and compares runs that share a `split`.

## 6b. Memory probe — `lab/out/memory_probe.json` (Lane A writes, C reads)

```json
{ "v": 1, "model": "muse-spark-1.3", "fn_count": 20,
  "unmodified": { "matched": 6, "match_rate": 0.3, "best_pct": 100.0 },
  "variant":    { "matched": 0, "match_rate": 0.0, "best_pct": 41.5 },
  "method": "same from-memory sources compiled against (a) unmodified GBADoom and (b) our private variant" }
```
Report both numbers. A high unmodified score is the reason the variant exists; a variant-only number fails by construction.
```
```

## 6c. Muse Spark usage (add to every `metrics.json`)

`"muse": { "calls": 1834, "tool_calls": 5120, "image_calls": 42, "tokens_in": 9100000, "tokens_out": 1200000, "reasoning_effort": "high", "cost_usd": 16.48 }` — Lane B fills it from the API's usage fields. The Time trial scene shows it as the "powered by" line for the Meta judges.

## 7. Sprite frame — Lane D bridge → overlay (ws://127.0.0.1:7301)

```json
{
  "v": 1,
  "frame": 18231,
  "sprites": [ { "i": 0, "x": 104, "y": 72, "w": 16, "h": 16, "tile": 32, "pal": 1, "subsystem": "player" } ],
  "heal": { "player": 0.83, "rocks": 0.41, "hud": 1.0, "boss": 0.0 }
}
```

`heal[s]` = matched functions in subsystem `s` ÷ game functions in `s`, computed by Lane D from `fn.matched` events and `viz_map.json`.

## 7b. Heartbeat (optional) — Lane D bridge → Stage (ws://127.0.0.1:7303)

`{ "v": 1, "frame": 18231, "running": ["fn_08000A1C", "fn_08003F10"] }` — functions observed executing in the last frame. Only real samples; never synthesized.

## 7c. Play to recover — Lane D tap → crew director (HTTP 127.0.0.1:7112, v1.1 additive)

Started by `python -m crew.run --director ...` (the live run). Lane D posts what the game is doing right now:

`POST /heartbeat {"running": ["fn_0801B298", "fn_08004698"], "frame_png_b64": "<optional PNG, base64, no data: prefix>"}`
→ `{"ok": true, "boosted": ["fn_0801B298"]}`  ·  `GET /heartbeat` → `{"boosted": [...], "last": <last decision>}`

- `running`: function ids observed executing (program-counter samples mapped through the manifest). Only real samples; never synthesized. Unknown ids are ignored.
- Every few seconds SubQ Snap looks at the frame plus the running code and picks what the crew rebuilds next; those functions jump the queue. Each decision is a `snap.decision` event with `op: "director"` in the live run's `events.jsonl`.
- Send at most ~4 heartbeats per second; frames at most once per second (240×160 PNG is plenty).

## 7d. Run exports (GitHub, so every lane gets real runs)

`runs/` is gitignored. Finished runs are published with `python -m crew.export <run_id>` to `crew/exports/<run_id>/`
(`events.jsonl`, `metrics.json`, `names.json`, `recovered/`, `EXPORT.json` with the manifest SHA-1, target ROM SHA-1
and a hash of every file). Point the Stage or the bridge at an export directory to replay a real run.

## 8. Stage websocket — Lane C server → browser (ws://127.0.0.1:7202)

Lane C's tiny server tails `runs/live/events.jsonl` and pushes each line unchanged as a websocket message, plus `{"type":"stage.hello","run_id":…,"backlog":N}` on connect. Replay mode serves any finished run's file at a chosen speed. No other lane talks to this socket.

## 9. Fixtures (commit at 10:00, before anyone codes)

Lane 0 (`docs/LANE_0_BOOTSTRAP.md`) generates these with `contracts/make_fixtures.py`. They must be internally consistent:

- `manifest.sample.json`: 84 game functions + 12 library, addresses ascending from `0x08000200`, 26 heldout.
- `referee_result.match.json`, `referee_result.partial.json` (first diff at offset 14, as in section 4).
- `events.sample.jsonl`: a believable 20-minute run with 6 diggers: ~60 matches, ~9 false claims, ~3 lint fails, ~12 idioms learned, ~40 narration lines, `metric.tick` every 5 s, one `build.rom` with `identical: true`, one `patch.verified`, one `phone.published`.
- `metrics.sample.json`: two runs on `heldout`, one `library: on`, one `off`.
- `sprite_frame.sample.json`.

Mark every fixture file with `"fixture": true` at the top level (or a first JSONL line `{"type":"fixture"}`) so nothing fake can be mistaken for a real run. The Stage shows a small "sample data" tag whenever it reads a fixture.

## 10. Integration checkpoints

| When | Who | Check |
|---|---|---|
| 11:30 | A → B | B points `REFEREE_URL` at A's real referee; one known-good source returns MATCH |
| 12:15 | B → C | C sets `runs/live` to B's first real run; tiles move |
| 13:15 | A → C, D | `viz_map.json` real; D's heal computes from real events |
| 14:30 | all | golden path dry run #1 |
| freeze − 30 min | all | golden path dry run #3, demo video exported |
