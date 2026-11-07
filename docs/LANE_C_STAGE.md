# LANE C — The Stage (UI)

> **Read `DECISIONS.md` → "Corrections" first. Where it disagrees with this file, DECISIONS.md wins (clock, compiler, rebuild, variant, finale, judging).**


Paste everything below the line into Claude Code as your first message, from the repo root.

---

You are the interface designer-engineer on FRANKENSTEIN. Coding agents rebuild a GBA game's lost source code, piece by piece, and a compiler referee rejects anything that isn't byte-identical. Your job is to make that visible, legible from the back of a room, and unforgettable in a 60-second video. Run `git pull --rebase` first: the foundation (tag `v0-foundation`, made by `docs/LANE_0_BOOTSTRAP.md`) already has the folders, contracts, schemas, and fixtures. Read `docs/00_START_HERE.md`, `contracts/CONTRACTS.md`, and `docs/02_DESIGN.md` in full first. Open `docs/design_system.html` in a browser to see every scene. It was written before the event, so it is a visual reference only: rebuild every screen in `stage/` today and never paste its HTML or CSS (the "New Work Only" rule disqualifies pre-written project code). Build for one laptop screen first: round one is 3 minutes in a judging room, and only the top six reach the stage. You own `stage/` only.

You build entirely against `contracts/fixtures/events.sample.jsonl` until a real run exists. You never wait for anyone.

## Stack

- Vite + TypeScript, no UI component library. DOM + CSS for the scenes, Canvas for the Time trial road and the cartridge meter if DOM drops frames. Web Audio for the coin sound.
- `stage/server/`: a tiny Node (or Python) server that tails `runs/live/events.jsonl` (follow symlink changes) and pushes each line over ws://127.0.0.1:7202; replay endpoint for finished runs with speed 1–20x; serves `runs/*/metrics.json` and `runs/*/names.json`.
- Fonts from Google Fonts per `02_DESIGN.md`, self-hosted copies in `stage/public/fonts/` so it works offline.
- Target: 1920×1080 projector, 60 fps with 150 patches animating; also must look right at 1280×720.

## Scenes (switch with number keys; the presenter never touches the mouse)

The Stage is one retro game played in scenes. Match the look of `02_DESIGN.md` and `design_system.html`, rebuilt from scratch.

### 0 — Title
Midnight sky with stars, the FRANKENSTEIN logo (Jersey 10, layered violet shadow), "Lost games, rebuilt and proven", a save-file menu (`FILE 1  DOOM  NN%`, `NN LIES CAUGHT`, `FILE 2  NEW GAME`) fed from the live run, and a blinking "PRESS START". Space bar = press start = go to Hi-score. This is also the first shot of the video.

### 1 — Split: Play / Rebuild (home during the run)
The heart of the demo; read the Split section of `docs/02_DESIGN.md`. You build the **right panel** (`/?scene=split`, 920×1080, transparent left side) and the beam layer; Lane D composes it in OBS next to the live mGBA window.
- Shared HUD across the top and narrator ticker along the bottom span the full 1920 width (render them in your page; OBS places your page full-screen above the game capture, with the left 1000 px transparent except the HUD, ticker, beams, and the badge).
- Right panel: six newest Hi-score rows; a code window streaming the active Digger's C (from `attempt.submitted` payloads with `src_preview`, see contracts); verdict stamp; picture-in-picture mini Versus card on false claims (the full Versus scene still exists on key 2).
- Badge under the game: "NOW RUNNING ON NN% AGENT-WRITTEN CODE" from `rom.swapped` events.
- Beams: on `fn.matched`, draw a 400 ms pixel beam from that row to the screen region of its subsystem (`viz_map.json` regions, in left-panel coordinates), then trigger the coin sound. Lane D's overlay heals the region; you only draw the beam.
- Heartbeat (optional): if `heartbeat` messages arrive (contracts), glow the rows of functions executing right now.

### 1b — Hi-score (full screen)
The arcade attract screen.
- Top HUD: `1UP` = functions recovered, `HI-SCORE` = total game functions, `LIES` = false claims caught.
- Logo (Bungee, yellow face with red and cyan offset shadows).
- The high-score table: the most recent 6 recovered functions slide in at the top, ranked by order recovered, colour cycling cyan, yellow, magenta. Name column shows the Archivist's inferred name in guess violet with "?" (from `names.json`), or the `fn_` id until a name exists. Match column always "100%".
- A liar row in alarm red appears briefly for each false claim before the Versus cut.
- The cartridge meter: a row of one cell per game function along the bottom, filled in mint as each is recovered, grey for library functions. This is the % recovered at a glance.
- The narrator ticker scrolls under the meter. Key in the corner: "? = our guess. Everything else is proved."
- Coin sound on each recovered function. Announcer line at 25/50/75/100%.

### 2 — Versus (every false claim)
Opens automatically when a `verdict` has `claim_was_true: false` (hold 1 s, show 4 s, return to Hi-score). Also key 2.
- Diagonal split: Digger (player blue) vs Referee (player red), names in Russo One italic, "VS" in K.O. gold.
- Health bars: Digger = the claim's `match_pct`, Referee = 100.
- The evidence, centred and large: `EXPECTED  <expected_ins>` / `GOT  <got_ins>` from `first_diff`, the differing operand in alarm red.
- The Digger's own claim words in a small speech line ("Matched it. Pretty sure.").
- Two-frame white flash, 200 ms shake, "K.O. CLAIM REJECTED". Round counter = attempt number. Announcer: "Claim rejected!"

### 3 — Time trial (the results)
Reads `runs/*/metrics.json`.
- Sunset sky, perspective road, the run board: each run is a lap (`RUN 1 … MIN PER PIECE`), best lap in mint with "NEW LAP RECORD".
- The held-out comparison as a race: library on is the player car, library off is the ghost car (translucent), with their match rate and minutes per piece side by side. If SubQ ran, it's a third car.
- Gauge: % recovered on the held-out set. Penalty board: false claims caught, fakematches rejected. Cost per piece on Muse Spark.
- **Memory test plate** (from `lab/out/memory_probe.json`): "MEMORY TEST: MODEL WROTE 20 DOOM FUNCTIONS FROM MEMORY. MATCHED: N." This answers the first judge question before it's asked.
- **Powered-by line** (from the `muse` block): "MUSE SPARK 1.3: N CALLS, N TOOL CALLS, N IMAGES READ, $N". For the Meta judges.
- Every number labeled with its run. Nothing typed by hand.

### 4 — Ending
The title screen again, cleared:
- `FILE 1  DOOM  NN%` (the true number) (or the true %), then `ORIGINAL CHECKSUM` and `REBUILT CHECKSUM` (full SHA-1s from `build.rom`), `IDENTICAL` in mint, and "IT'S ALIVE" in the logo face.
- On `patch.verified`: `PATCH 1.01: 1 FUNCTION CHANGED. BUG FIXED.`
- On `phone.published`: "PLAYER 2, PRESS START" with the QR code filling a third of the screen.

## Evidence rule

Proved things (counts, match %, the differing instruction, checksums, "1 function changed") are bright and solid. Guesses (names, descriptions) are guess violet with "?". The key "? = our guess. Everything else is proved." appears on Hi-score and Ending. Both the Fetch.ai and DeepMind judges care about this distinction.

## Narration voice

- Captions always on. Voice for `speak: true` lines via the Web Speech API; pick one macOS voice and keep it (test Daniel, Moira, or Serena; choose the most curator-like). Mute toggle on `m`.
- Never queue more than one spoken line; drop stale ones.

## Director mode (for the demo video and stage)

- `?director=1` loads a scripted sequence (`stage/director/show.json`): which run to replay, at what speed, when to cut to which screen, when to hold. Mirrors section 11 and 12 of `00_START_HERE.md`.
- `space` advances to the next beat. `r` restarts. The live on-stage segment switches the event source from replay to `runs/live` without a reload.
- Fixture data shows a small "sample data" mark in a corner. Replay shows "replay · 8x" (or the real speed). Live shows nothing extra.

## Quality floor

- Legible from 15 meters: nothing smaller than 28 px at 1080p on stage screens; numbers larger.
- Works with `prefers-reduced-motion` (no flash, no shake, no blink; rows appear instantly).
- Keyboard focus visible on the few controls that exist.
- No layout shift when numbers change (tabular figures).
- Screenshot every screen at 1920×1080 and 1280×720 and check them yourself after each change.

## Tests

- Feed the fixture stream at 20x: no dropped events, counters equal a recomputation from the file.
- Versus opens for every false claim in the fixture and only then.
- Time trial numbers equal `metrics.json` values exactly.
- Replay of a finished run makes zero network calls outside localhost.
- Kill and restart the server mid-stream: the page reconnects and shows the same state (rebuild state from the full file on connect).

## Hand-offs

- 11:30: Title, Split right panel with beams, and Versus running on fixtures. Post screenshots.
- 12:30: point at Lane B's first real run.
- 13:30: Time trial with real metrics as they arrive; Ending wired to `build.rom`, `patch.verified`, `phone.published`.
- 15:00: director mode drives the full run of show.
- Freeze − 60: export the demo video with Lane D (they own OBS; you own the Stage screens and director timing).

## Rules

Follow `docs/00_START_HERE.md` section 15 and the design rules in `docs/02_DESIGN.md`. No generic dashboard look and no chart library: every number lives inside the game scenes. No trademarked game art or sounds. Start now; do not ask whether to begin.
