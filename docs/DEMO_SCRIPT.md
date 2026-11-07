# Demo script

**Lost games, rebuilt and proven.** Three minutes, one laptop, a few judges. The judge presses the button.

Rehearsed on Karthik's laptop at 12:43 to 13:10 with `make up` (replay of `crew/exports/doom_r01`), Playwright
screenshots at 1920×1080 and one live micro-segment. Rehearse again any time with `make rehearse` (stopwatch plus
a screenshot per beat into `runs/_rehearsal/<time>/`, real time, spends nothing) and `make demo-live`.
Every number below comes from a run file or `DECISIONS.md`; the source is named next to it. A number we have not
measured yet is written as `[pending: source]` and is never said aloud until it is filled.

## Cast

| Who | Job in the room |
|---|---|
| **Karthik** (B) | Speaks. Owns the story and the numbers. |
| **Aidenn** (C) | Drives the laptop: scene keys, tab switches. Never speaks during the 3:00. |
| **Enzo** (D) | Phones: holds the QR phone, hands a phone to a judge, keeps a second phone on the game. |
| **Eddy** (A) | Answers referee questions in Q&A. Keeps the ASI:One tab ready. |

## The laptop before the judges walk in

- Window 1, full screen: **Doom** in the browser player (`http://127.0.0.1:7401/`) with the static-face ROM loaded and a level already running. This is the first thing the judge sees.
- Window 2: the **Stage** (`http://127.0.0.1:5173/?scene=split`), served from the built bundle, not the dev server (see checklist).
- Window 3: a terminal with `make demo-live` typed and **not** started. Font 28 pt. It waits for Enter.
- Phone A (Enzo): the same Doom page, landscape, running. Phone B: spare.
- Printed card on the table: "Real vs staged" (bottom of this file).

## The judging-room cut (3:00)

Key column: what Aidenn presses. Stage keys: `1` Split, `2` Versus, `5` Hi-score, `3` Time trial, `4` Ending, `space` credits (on Ending).

| Time | Screen | Key / click | Karthik says (exact words) | Number said aloud | If it fails |
|---|---|---|---|---|---|
| **0:00–0:10** | Doom running, the face in the status bar flickering like static. | Nothing. It is already running. | "This is Doom. See the face? That's static, because that code is lost. 87% of classic games are endangered, and for most of them the source code is gone." | **87%** (DECISIONS 12:12, VGHF and SPN 2023) | No playable ROM on the laptop: open the recorded boot clip (`creature/shots/`), say "recorded this morning". Never show a still as if live. |
| **0:10–0:22** | Terminal: `Judge: press ENTER to hire the agents.` | Turn the laptop to the judge. **Judge presses Enter.** Aidenn then presses `1` in the Stage window. | "We rebuild it from the cartridge. One rule: code only counts if it compiles to the exact original bytes. Press Enter. You just hired two agents." | none | Referee down: `make demo-live` refuses with a red line. Say "the referee is down, so nothing can count; here is the last real run", press `1` on the replay (badge says REPLAY). |
| **0:22–1:00** | Stage Split, live run: Digger card writes C, MATCH stamp, the judgment rail (MUSE / SNAP / GEMINI / PROOF lines). | None. Let it breathe. | "Muse Spark reads the machine code and writes C. The compiler checks it in a fifth of a second. Then two labs, SubQ Snap and Gemini, screen every match for fakes. Victor Frankenstein never checked his work. Ours checks everything." (at the MATCH): "There. Byte for byte." | **0.1 to 0.2 s** per check (DECISIONS 11:24). Read the live **time to match** off the screen (rehearsal: **38 s**, `runs/r01`). | Nothing lands by 0:55: "Agents are slow; the referee isn't. Here's the run from this morning." Press `1` on the replay tab. |
| **1:00–1:20** | Versus (`2`): the Digger's own claim vs the referee's re-run. | `2` | "Agents lie. The referee doesn't. Every claim is re-run. Today the Checker caught 24 lies and threw out 30 fakes, tricks that coax the right bytes from the wrong code. It let 0 through." | **24 lies caught, 30 fakes rejected, 0 accepted** (DECISIONS 14:52, `tools/counts.py`) | Versus shows only TRUE CLAIM UPHELD (today it does): say the line over the Road (`6`), which shows the tallies. |
| **1:20–1:45** | Hi-score (`5`), then Time trial (`3`). | `5`, then `3` at 1:35 | "170 of Doom's 568 functions are back, each proven byte for byte. That's only 4.78% of the bytes: the big ones are left. Run over run, warm start, salvage and the permuter turned near-misses into matches. On functions it had never seen, habits on vs off: 29 vs 29 of 40 easy, 6 vs 6 of 20 hard. No measured gain, so we don't claim it." | **170 of 568, 4.78% of bytes** (`tools/counts.py`, DECISIONS 14:52). Held-out **29 vs 29 of 40, 6 vs 6 of 20** (DECISIONS 13:58, 14:06) | Time trial labels overlap today (see friction #6): stay on Hi-score and say the held-out line. |
| **1:45–2:05** | Ending (`4`): ORIGINAL and REBUILT checksums, **IDENTICAL**. | `4` | "Now the proof. We put 169 of the agents' functions back into Doom and rebuilt it. Same checksum. Not similar. Identical." | **169 spliced in, SHA-1 d936259b… identical**, verified on two machines (union rebuild 14:55, DECISIONS 14:52) | Ending says NOT REBUILT YET: the live segment hasn't reached its rebuild (60 s). Stay on Split 10 s more, or switch to the replay of an export that has `build.rom` (ask B #1). |
| **2:05–2:40** | Finale: the QR on the Ending; Enzo hands Phone A to a judge. If the patch is ready: before / after frames with **EYES: CHANGE CONFIRMED · 0.99** on the rail. | Enzo: phone to the judge. Aidenn: `4` stays. | "Recovered code can change again. We changed one recovered function, rebuilt, and Snap's eyes checked the screen: that change, and nothing else. Scan it. You're playing the rebuilt game." | Eyes probability read off the screen (**0.999** measured at 12:00, DECISIONS) | No patch: skip the change sentence, say "Scan it. It's Doom, in your browser." No QR (no `phone.published`): Enzo hands Phone A over. No phone works: skip; never show a placeholder QR. |
| **2:40–3:00** | Credits (`space` on Ending): Built today / Not ours. | `space` | "Muse writes it. Snap judges it. The compiler proves it. ASI:One lets anyone ask for it. Everything on the left we built today; everything on the right is theirs. Games don't have to die." | none | — |

**Stop at 3:00 even mid-sentence.** Hand the floor to the judges.

### The face is a display rule, not a recovery

Lane B stopped the face run at 12:49: `fn_0801B298` (1,164 bytes at -O3) got 2 attempts in 24 minutes, best 0.7%,
$0.52 (`crew/STATUS.md`). So the static face is a **display rule** we say out loud at 0:00 ("code we haven't
recovered yet shows as static"), and the face is never shown coming back. If a judge asks: "That's the hardest
piece in the status bar, 1,164 bytes. Today the crew rebuilt the small ones; the face is next." If Lane D lands a
smaller recovered HUD function with a visible static stub, it replaces the face at 0:00 with the same words.

## The stage cut (top six, bonus, about 3:00, criteria weighted equally)

Same order, three upgrades, only if each worked in a 16:30 rehearsal:

1. **The judge's words, live** (option b below): a judge types in ASI:One, the Stage shows `ROUTED → fn_… · P 0.xx`, and the job digs on the big screen.
2. **The room plays**: QR at full size on the projector for 20 s; "There are N phones in Doom right now" only if Lane D counts real loads.
3. **Snap's eyes** with before and after frames side by side (option c).

## The 60-second video (record 16:10, one take of the real system, captions burned in, 34 px or more)

| Time | Shot (real capture only) | Caption |
|---|---|---|
| 0–5 | Doom running, the face flickering as static | Lost games, rebuilt and proven. Static = code we haven't recovered yet. |
| 5–15 | Terminal Enter, then Split: Muse writes C, live | Agents rebuild the C from the cartridge. LIVE. |
| 15–23 | MATCH stamp and the judgment rail | The compiler proves it byte for byte. Two labs screen for fakes. |
| 23–31 | Versus: a caught lie | Agents lie. The referee doesn't. 24 lies caught, 30 fakes rejected, 0 accepted. |
| 31–39 | The Road: 170 of 568 | 170 of 568 Doom functions, each proven byte for byte. |
| 39–47 | Ending: IDENTICAL checksums | Rebuilt with 169 agent-written functions. Identical checksum. |
| 47–54 | A phone playing (and the eyes line if the patch exists) | Play it, and we rebuild it. |
| 54–60 | Credits card | Built today / Not ours. Games don't have to die. |

Replay footage carries its REPLAY badge on screen; never crop it out. Show only today's work. Export, then watch it
once start to finish with a timer, then play it on a second device.

## Pre-demo checklist (T minus 15 minutes, every time)

Run in order. The first three are automatic.

1. `git pull --rebase --autostash origin main`, then `make preflight`. Every line green or explained.
2. `make up` (replay of the export with `build.rom`), then `make status`: referee `mock=False`, crew-api up, Stage up, phone up **with a ROM** (`FRANK_PHONE_ROM=<static-face playable .gba>`).
3. `make rehearse PACE=0.25`: the report must end with `NO ISSUES`, or only issues listed as known below.
4. **Freeze the Stage:** stop the dev server and serve the build (`cd stage && npm run build && npx vite preview --port 5173 --strictPort`), or ask every teammate to stop saving files under `stage/src`. The 12:43 rehearsal reloaded the Stage mid-demo four times because teammates saved files.
5. Window 1: the Doom page, static-face ROM, level running, sound off. Window 2: the Stage on Split. Window 3: `make demo-live` typed, not started. Close Slack, mail and notifications (Do Not Disturb).
6. Credit: `make demo-live` spends about $0.05 per press (rehearsal: $0.045). Check Muse and SubQ credit pages once.
7. No other live run is on stage: `make status` shows `state finished`. `make demo-live` refuses anyway.
8. Phones: Phone A loaded on the game URL, landscape, brightness up, auto-lock off, charged. Phone B spare.
9. Wi-Fi: laptop on the venue network for the Muse, Snap and Gemini calls. A hotspot is the backup **for the laptop's API calls only** (not a tunnel, not for teammates).
10. Recorded fallbacks open in a hidden tab: the boot clip, and the last good rehearsal screenshots (`runs/_rehearsal/<time>/`).
11. Printed "Real vs staged" card on the table.

## Rehearsal measurements (13:10, this laptop)

| What | Measured | Source |
|---|---|---|
| Live micro-segment, 2 functions (`crew.demo --pick 2`, real Muse Spark, Snap, Gemini, referee) | **60.2 s end to end**: first Muse attempt back at 25.0 s, both MATCH at 27.1 and 27.9 s, claims re-checked at 32 s, Snap reviews at 34.1 s, Gemini at 37.7 s, `fn.matched` at 37.7 and 38.1 s, rebuild proof (`build.rom`, identical, SHA-1 `d936259b…`) at 60.2 s. 1 attempt each, **$0.045**. | `runs/r01/events.jsonl`, `metrics.json` |
| Dead air in that segment | 0 to 25 s: no visible event (Muse thinking at high effort). 38 to 60 s: nothing until the rebuild lands. | same |
| SubQ Snap router through the crew API, `POST /route` | "bring back Doomguy's face": **23.5 s**, top three were `fn_0801A2C8`, `fn_0801CAE4`, `fn_0801A2E4` (p 0.85 to 0.83); the face `fn_0801B298` was **not** in the top three this time. "make the shotgun fire faster": **8.3 s**. | live calls at 12:56 |
| Stage replay walk, real time (`make rehearse`) | Every beat hit within 1.8 s of its mark at 1920×1080. 6 issues: no playable ROM in the player, Versus has no lie, Ending says NOT REBUILT YET, `memory_probe` 404, and the Stage **hot-reloaded twice**; the second reload put it back on Title, so `space` at 2:45 opened Hi-score instead of the credits. | `runs/_rehearsal/210021/REHEARSAL.txt` (local) |
| Phone page on localhost, emulated Pixel 7 (Chrome) and iPhone 14 (WebKit) | Ready in **0.65 to 1.1 s** (Chrome) and **1.75 s** (WebKit); both cross-origin isolated with SharedArrayBuffer; after PRESS START both reached `playing`, and the engine-only ROM printed "No IWAD in ROM", so core and engine run. No playable ROM exists on this laptop, so no Doom frame was measured. Emulation is not a real phone. | Playwright, 12:48 and 13:08 |
| Phone payload | HTML 5 KB, CSS 10 KB, JS 19 KB, `mgba.js` 249 KB (57 KB gzipped), `mgba.wasm` 1.85 MB (599 KB gzipped), playable ROM 5.70 MB (engine part gzips to 27%). About **7.8 MB raw per phone**, about 39 MB for five phones. | `creature/STATUS.md`, measured |

## Phone finale: requirements and test checklist

**The path:** QR on the Ending → HTTPS URL → page (34 KB) → emulator core (2.1 MB, 0.66 MB gzipped) → ROM (5.7 MB) → PRESS START (the tap unlocks audio) → first frame → touch controls.

Requirements:

- **HTTPS with COOP `same-origin` and COEP `require-corp`** on every response (the threaded core needs `crossOriginIsolated`). Plain HTTP on a LAN IP is not a secure context and fails on every phone. Cloudflare Pages supports both headers through a `_headers` file; GitHub Pages does not.
- **No tunnel and no LAN share** (DECISIONS 11:28). The phone URL is a static deploy; it never talks to the laptop.
- **Compression:** serve the core and the ROM gzipped or brotli (Pages compresses known types; set `Content-Type: application/wasm` for the core). The Node server already gzips (`serve.mjs`); the Python server does not.
- **Cache:** `Cache-Control: public, max-age=3600, immutable` on `mgba.wasm`, `mgba.js` and the ROM with a hashed file name, so a second load is instant.
- **First frame under 10 s** on venue Wi-Fi, from scan to Doom title.
- **The ROM's licence:** the packaged ROM contains the shareware WAD converted by GbaWadUtil. Lane A recommends judging-only hosting with the link taken down afterwards (`lab/HANDOFFS.md`, response 6). **Karthik decides before anything is public.**
- **The QR is real:** it comes only from a `phone.published` event (`qr_png` under `creature/`); a missing QR stays visibly missing.

Test checklist (Lane D runs it; tick each with a time and a device name in `creature/STATUS.md`):

- [ ] iPhone, iOS Safari: scan → title in under 10 s; `crossOriginIsolated` true; PRESS START gives sound; D-pad, FIRE and USE respond; portrait and landscape; no page scroll or pinch zoom while playing; Home Screen launch works.
- [ ] Android, Chrome: the same, plus FULL SCREEN works.
- [ ] Five phones on the venue Wi-Fi at once: all five reach the title; note the slowest time.
- [ ] Laptop as a phone fallback: the same URL on the demo laptop runs.
- [ ] Second load from cache under 2 s.
- [ ] The QR scans from 1.5 m off the laptop screen at 50% brightness.
- [ ] Battery: 10 minutes of play on Phone A doesn't drop below 50%.
- [ ] Credits on the page name id Software, prBoom, doomhack and mGBA.

## Top friction found in rehearsal

| # | Severity | What the judge would see | Owner | Ask |
|---|---|---|---|---|
| 1 | Blocker | **No Doom on this laptop.** No mGBA, no OBS, no wine, and no playable ROM here (GbaWadUtil is a Windows exe); the phone server on :7401 has no ROM. The first 10 s have nothing to show. | D (with A) | Put the static-face and restored playable ROMs on the demo laptop (`creature/HANDOFFS.md`, demo director 1). |
| 2 | High | **The Split never shows the game** without OBS: the left half is the function grid. The product is not on the Stage. | C, D | Two windows (above) today; C may embed the player (demo director C2). |
| 3 | High | **No lie to catch.** Every run has 0 false claims; Versus says TRUE CLAIM UPHELD. The 4 real fake rejections per held-out run leave no event, so no screen can show them. | B | Emit the rejection as an event with its reason (B1); C stamps it. |
| 4 | High | **The Ending says NOT REBUILT YET** on the replay export: `doom_r01` has no `build.rom`. | B | Re-export with `build.rom` (B2). The live segment does produce it at 60 s. |
| 5 | High | **The Stage reloads mid-demo**: the dev server hot-reloads whenever a teammate saves (4 reloads in 3 minutes at 12:43). | C | A frozen build for the demo (C1). |
| 6 | Medium | **Time trial is misleading and illegible**: it compares `doom_r04` (Snap off) with the ghost and calls it NEW LAP RECORD; "YOU · LIBRARY ON" and "GHOST · LIBRARY OFF" overlap. | C | Compare r02 vs r03 and label it "within noise" (C3). |
| 7 | Medium | **25 s of dead air** before the first live attempt shows, then 22 s more before the rebuild. | B | Show the live attempt sooner; medium effort for the live segment (B3). |
| 8 | Medium | **The router is not repeatable**: the face was #1 at 12:20 (p 0.88) and not in the top three at 12:56, and a route took 23.5 s. A judge's live ASI:One request can land on the wrong function. | B, A | Don't promise the face live; constrain the live query (option b). |
| 9 | Low | **Too many denominators**: 14/30, 11/459, 14 of 568, 1.1%, 1.8% on neighbouring screens. | C | One number per scene (C4). |
| 10 | Low | **"Quarter… Halfway… Three quarters… Fully recovered!"** all announced within a second on a 2-function run; `memory_probe` 404s on every load. | B, A | Skip milestones under 8 functions (B4); commit `memory_probe.json` (A1). |

## Ambitious options (evaluated, recommendation first)

| Option | Recommendation | Who builds what | Time | Honesty and risk | Fallback |
|---|---|---|---|---|---|
| **(c) Snap's eyes live on the finale**: before and after frames, "EYES: CHANGE CONFIRMED · 0.99" | **Do it, before freeze.** Cheapest real proof that a patch changed exactly what we said. | A: pick and verify the one-function patch (`lab.referee patch`). D: capture two frames from the browser player at the same game moment (canvas to PNG) and run `python -m crew.eyes before.png after.png --claim "…" --run runs/live --fn <fn>`. C: already renders `op: eyes` on the rail; add the two frames side by side on the Ending. B: done (`crew/eyes.py`). | A 30 min, D 30 min, C 20 min | Real Snap call, 0.68 s (DECISIONS 12:00). Frames must be captured, never drawn. Say the probability shown. | Frames captured in rehearsal, labelled "RECORDED 14:xx". |
| **(b) The judge types into ASI:One and the Stage switches** | **Lite version in the judging room, full version on stage.** Lite: the judge types "Prove the rebuild is exact" or "How much of DOOM is back?" in ASI:One; the agent answers with both checksums or the count. Deterministic, no spend, about 5 s. Full: "bring back the shotgun", `POST /jobs {"query", "live": true}`, Stage shows ROUTED and the dig. | A: the agent must run where the crew API runs (the seed handover, STORY gap A3), and forward plain words to `/jobs` with `live: true`. B: start the API with `--live-jobs`; restrict routed live jobs to functions under 120 bytes so a match is possible in a minute. C: show the query (done in `judgment.ts`). | A 20 min, B 30 min | Routing is inferred and was not repeatable in our test (friction 8); the Stage must show "ROUTED → fn_… · P" as a guess. Never claim the face live. | The lite question; or a pre-recorded ASI:One transcript labelled RECORDED. |
| **(a) Crowd Play-to-recover**: phones send frames, Snap's director picks what the crew rebuilds next | **Not before freeze. Do the local version only.** The director (`:7112`) is localhost-only by design, and DECISIONS forbids tunnels. A public intake would need a relay (for example a Cloudflare Worker with a per-session token in the QR URL, a rate limit of one frame per phone per 5 s, a 64 KB cap, PNG only, no audio, no IP logging) that the laptop **polls outbound**. That is new security-sensitive infrastructure at the freeze. Local version: the laptop's own browser player posts its canvas to `127.0.0.1:7112/heartbeat` during a live run. | Local: D adds an opt-in `?director=http://127.0.0.1:7112` to the player that posts a 240×160 PNG every 3 s; B adds CORS for `http://127.0.0.1:7401` on `/heartbeat`. Public relay (after judging only): B and D. | Local 30 min (D 20, B 10). Relay 2 h or more. | Frames only, no personal data; Snap's pick from pixels is inferred and shown as `PLAY → fn_…`. The room-wide version is only true if real phones post. | The tap-based director already measured (2.4 s per decision, DECISIONS 12:00), shown from a recorded run. |

## Q&A: one breath each (numbers from run files and DECISIONS only)

- **"Isn't it staged?"** The real source is hidden from the agents and used only as the answer key; they see machine code and `fn_` ids. That's the only way to prove it's exact. (Eddy can open `lab/out/target/<fn>.json` to show what the referee compares.)
- **"Didn't the model just remember Doom?"** "From memory alone, 0 of 20 compiled. Given the real headers and compiler errors, 3 of 20 matched, none of them functions we'd changed." (DECISIONS 13:28)
- **"Emulators already save games."** Emulators keep games playable. Source code keeps them alive. We just changed one.
- **"Is the improvement real?"** Run over run, warm start, salvage and the permuter turned near-misses into matches. On functions it had never seen, habits on vs off: 29 vs 29 of 40 easy, 6 vs 6 of 20 hard. No measured gain on held-out code, so we don't claim it.
- **"Does Snap actually do anything?"** It decides keep, escalate or abandon after every miss (19 escalations in one held-out run), screens every match for fakes, and routes plain words to code. Snap on vs off on 40 held-out functions: 30 vs 29, within noise (DECISIONS 12:38).
- **"How do you catch a fake?"** The compiler says MATCH; then the Checker rejects tricks that coax the bytes, and two labs score fake and recital odds. 30 fakes rejected, 0 accepted (DECISIONS 14:52).
- **"What does it cost?"** 28 real Doom functions for $0.73 of Muse and $0.06 of SubQ Snap, in 4.5 minutes (`doom_r01`). Two live functions: under 5 cents.
- **"How big is this?"** "170 of 568 functions, but only 4.78% of the bytes. The big ones are left: the face, the renderer."
- **"What's the face?"** `fn_0801B298`, 1,164 bytes, the hardest function in the status bar. Not recovered today: 2 attempts, best 0.7% (`crew/STATUS.md`). The static is a display rule.
- **"Where's MongoDB?"** Every habit the crew learns lives in Atlas, one collection per library, so frozen held-out libraries stay frozen; every event and every run's metrics are mirrored there (DECISIONS 13:05).
- **"Who would pay?"** Preservation groups and rights holders: games you're allowed to rebuild, never any game.

## Real vs staged (print this)

- **Real:** every MATCH (re-run by the referee, 0.1 to 0.2 s), the checksums, the costs, the Snap and Gemini calls, the live segment.
- **A display rule we wrote:** the static face. Code we haven't recovered yet shows as static.
- **Replay:** anything with the yellow REPLAY badge is a recorded real run, played back faster.
- **Inferred, shown violet with "?":** function names, what a function does, Snap's routing.
- **Not ours:** Doom (id Software), prBoom, GBADoom (doomhack), the shareware WAD, mGBA, devkitARM, and the Meta, Subquadratic, Fetch.ai, MongoDB and Google platforms.
