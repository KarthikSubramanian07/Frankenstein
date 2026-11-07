# Stage design audit (Lane C, before polish)

Audited 2026-11-07 on branch `design/stage-polish`. Screenshots are in `/tmp/design_audit/before/` at 1920×1080 and 1280×800. Data: the real `doom_r01` export (REPLAY), the `fx01` fixture (SAMPLE DATA) for the REJECTED and IDENTICAL states, and an unreachable server for NO SIGNAL. This is an audit only, so no code was changed.

## Verdict

The Stage doesn't look vibe coded. It has a real point of view: warm near-black, Anton display type, hard drop shadows with no glow, one colour per meaning, and one idea per screen. There is no purple gradient, no glassmorphism, no emoji, no card grid and no rounded corners. Nothing reads as a dashboard. The honesty marks work.

What weakens it on a judging laptop:

1. The Rebuild screen, which is the heart of the demo, gives a third of its area to an empty box labelled GAME WINDOW.
2. A leftover navy colour from the old palette flashes over every scene change.
3. The direction moved away from `docs/02_DESIGN.md` (midnight, pixel fonts) to "Doom minimal" (Lane C HANDOFFS, 13:25), and the result now has very few signals that say "game". Title, Faster and Credits could pass for a bold sports poster.
4. Some empty and partial states are louder than the data. On Faster, the biggest text on screen says what is missing. On Alive, a missing QR becomes a glaring white square with red error text.

Health score, using impeccable's audit dimensions: accessibility 3, performance 3, responsive 4 (the fixed 1920×1080 stage letterboxes cleanly at 1280×800), theming 3, implementation integrity 3. Total 16/20, "Good".

## How to split the work

Do pass A, the global pass, first with one agent. It is the only pass that touches the shared files `src/style.css`, `src/fx.ts`, `src/main.ts` and `index.html`. After it lands, the scene passes B1 to B5 can run in parallel. Each one touches only its own `src/scenes/<scene>.ts` and `.css`.

| Pass | Files | Issues |
|---|---|---|
| A, global | `src/style.css`, `src/fx.ts`, `src/main.ts`, `public/fonts/` | G1 to G6 |
| B1, Rebuild | `src/scenes/split.ts`, `split.css` (and it may import `mosaic.ts` read-only) | S1 to S6 |
| B2, Caught | `src/scenes/versus.ts`, `versus.css` | V1 to V3 |
| B3, Faster | `src/scenes/timetrial.ts`, `timetrial.css` | T1 to T4 |
| B4, Alive and credits | `src/scenes/ending.ts`, `ending.css` | E1 to E4 |
| B5, Title | `src/scenes/title.ts`, `title.css` | Ti1 to Ti2 |

If a scene pass wants the new HUD font from G2, it uses `var(--hud)` and does not edit `style.css`.

## Ranked list (all scenes)

| Rank | Id | Severity | Where | One line |
|---|---|---|---|---|
| 1 | S1 | P0 | split | Empty GAME WINDOW placeholder covers 30% of the hero screen |
| 2 | G1 | P0 | fx.ts | Scene dissolve paints navy `#0B0B2E` from the old palette |
| 3 | S2 | P1 | split | "Waiting for the first piece" never renders (empty state bug) |
| 4 | T1 | P1 | timetrial | A lone bar at full width says "slowest" on a "shorter is faster" chart |
| 5 | T2 | P1 | timetrial | Biggest text on screen is "NO MEMORY-OFF RUN TO COMPARE YET." |
| 6 | E1 | P1 | ending | Missing QR shows a 520 px white square with red "QR image not found" |
| 7 | G2 | P1 | style.css | Few game signals left; add one pixel HUD face for labels |
| 8 | S3 | P1 | split | Progress bar is a generic filled-track slab; 5% reads as nothing |
| 9 | V1 | P1 | versus | "NO CLAIMS YET" is `--metal-hi`, contrast 2.5:1 (fails 3:1 large) |
| 10 | S4 | P1 | split | Newest name is fitted flush to the right edge with no air |
| 11 | G3 | P2 | style.css | Letterbox bars `#000` against stage `#0c0a09` show a seam at 1280×800 |
| 12 | Ti1 | P2 | title | Replay mark on a screen that shows no run data |
| 13 | E2 | P2 | ending | Credits h1 repeats both column headings word for word |
| 14 | T3 | P2 | timetrial | Footer "doom_r01 · train" is jargon |
| 15 | V2 | P2 | versus | Real `doom_r01` has 0 false claims, so Caught only shows CONFIRMED in the real replay |
| 16 | G4 | P2 | judgment.css, rail.ts | Dead code with undefined tokens and a side-tab border |
| 17 | G5 | P2 | split.css, timetrial.css | Bars animate `width`; use `transform: scaleX` |
| 18 | S5 | P2 | split | Sponsor line reads like a footer tagline |
| 19 | G6 | P2 | main.ts | Director cue box is visible to judges |
| 20 | E3 | P2 | ending | NOT REBUILT YET in grey reads as a disabled state |

## Global (pass A, shared files, one agent, first)

### G1, P0: scene dissolve flashes the old navy
- Where: `src/fx.ts:105`, `c.fillStyle = '#0B0B2E'`.
- Seen in: every scene change (keys 0 to 4, director beats, the auto cut from Rebuild to Caught).
- Problem: every transition fills a 30×17 block grid with midnight blue from the pre-redesign palette. On a warm near-black stage it looks like a glitch, and it happens about ten times in a three-minute demo.
- Fix: read the token once, `getComputedStyle(document.querySelector('.stage')!).getPropertyValue('--bg')`, or hard-code `#0c0a09`. Optional: use `--metal` (`#3b2c24`) so the blocks read as rust plates.

### G2, P1: the retro-game layer is too thin
- Where: `src/style.css:6-25` (fonts and tokens). It affects `#mark`, `.sp-tag`, `.vs-claim`, `.vs-ins .lbl`, `.tt-runs`, `.en-sum .l` and `#cue`.
- Seen in: `title-*`, `timetrial-*`, `ending-credits-*`.
- Problem: the brief is "Frankenstein, the game". After the minimal redesign the only game grammar left is PRESS START, the bevel and the block dissolve. Anton plus Barlow on near-black is a common "bold poster" pairing, which is the closest thing here to a template look.
- Fix (one token, no new layout): self-host one OFL pixel face, either VT323 (the rail already referenced `--code` VT323) or Press Start 2P. Add `--hud: 'VT323', var(--mono);` and use it only for small uppercase labels (the corner mark, PROVED tag, EXPECTED/GOT, original/rebuilt, run footers, director cue). Keep Anton for the big words and Barlow for sentences. Minimum size stays 28 px; VT323 needs about 36 px to match Barlow 28. Don't add scanlines, CRT curvature or noise; the existing grit is enough.

### G3, P2: letterbox seam
- Where: `src/style.css:31,34`, `html, body` and `#viewport` use `background: #000`.
- Seen in: every `*-1280x800.png` (40 px bars above and below).
- Fix: `background: var(--bg)` on both. Keep `transparent` for `body.obs`.

### G4, P2: dead rail code with undefined tokens
- Where: `src/judgment.css` (uses `--ink`, `--hud`, `--code`, `--magenta`, `--cyan`, `--yellow`, `--midnight`, `--sunset-b`, none of which are defined) and `src/rail.ts`. Neither is imported by `main.ts`. The detector flags `judgment.css:24` (`border-left: 8px`, a side-tab).
- Fix: nothing shows on screen today. If the rail ever comes back, re-token it first. Otherwise leave it alone; deleting it is Lane C's call because `judgment.ts` tests still run.

### G5, P2: width transitions
- Where: `src/scenes/split.css:29` and `src/scenes/timetrial.css:16` (detector: layout-transition).
- Fix: animate `transform: scaleX()` with `transform-origin: left`. This is a small cost on one element, so do it only if a scene pass is already in that file.

### G6, P2: director cue visible to judges
- Where: `src/style.css:61` (`#cue`), `src/main.ts:192-201`.
- Seen in: `director-1920x1080.png`, a grey "1/7 · 0:00" box bottom left.
- Fix: drop it to `opacity: .5` at 28 px in `--hud`, or show it only when `?director=1&cue=1`.

Reduced motion (`style.css:70-72`) kills every animation and transition, and `main.ts:23` mutes audio. That is acceptable for a demo because every state change still happens without the motion. Leave it.

## Rebuild (`split`, pass B1)

### S1, P0: empty game window
- Where: `src/scenes/split.ts:33-37,66-69` and `split.css:4-12`.
- Seen in: `split-replay-1920x1080.png`, `split-replay-1280x800.png`, `split-live-empty-1920x1080.png`.
- Problem: unless Lane D composites the capture over x 20, y 92 (OBS) or the URL has `?game=`, judges see a 960×640 black box saying GAME WINDOW. On one laptop with no OBS, that's the most likely case. It's a placeholder on the most important screen.
- Fix: when there is no `?game` and no `?obs`, mount the existing `Mosaic` (`src/scenes/mosaic.ts`, one cell per game function grouped as WORLD / MONSTERS / WEAPONS / STATUS BAR, proved cells solid) in `.sp-win`. It is real data from the lab viz map, already 960×640, and its header says it was built for this case. Keep "Game window" only as the error text when the viz map fails to load. Keep the window position (x 20, y 92) because Lane D's capture depends on it.

### S2, P1: empty state never shows
- Where: `src/scenes/split.ts:28,86-95`. `newestKey` starts as `''`, and with no piece yet `nk` is also `''`, so `renderNewest` returns before it writes "Waiting for the first piece".
- Seen in: `split-live-empty-1920x1080.png` (an empty gap under the bar).
- Fix: initialise `private newestKey = '\u0000';` and set the same value in the `reset` branch (line 127).

### S3, P1: generic progress slab
- Where: `split.css:25-30` and `split.ts:77-79`.
- Seen in: `split-replay-1920x1080.png`, a 40 px green nub inside an 820 px brown slab.
- Problem: a filled-track bar is the stock dashboard component, and at 28/568 it says "almost nothing" next to a number that is supposed to feel like progress.
- Fix: make it a segmented cartridge or ammo meter. Use about 71 blocks of 8 pieces each, drawn with a `repeating-linear-gradient` mask or 71 spans with a 4 px gap, lit blocks in `--toxic` and unlit ones in `--metal`. Each new proved block lights with `steps()`. Every block maps to a real count, so it stays honest.

### S4, P1: newest name touches the edge
- Where: `split.ts:14,111-116` and `split.css:37-40`.
- Seen in: `split-replay-1920x1080.png`, where "GUARDED ARRAY FIELD CLEAR?" ends at x 1880, which is the right edge of the column.
- Fix: fit against `clientWidth - 40`, or give `.sp-nm` `padding-right: 40px`. Lower NAME_MAX to 80.

### S5, P2: sponsor line reads as a footer
- Where: `split.css:47-50`.
- Problem: "Muse writes · Snap checks · Compiler proves" in 36 px ash, 120 px below the content, is the only sponsor mention on screen, and sponsors are scored as load-bearing.
- Fix: move it up under `.sp-new` (top about 860) at 40 px, put the three names in `--bone` and the verbs in `--ash`. Keep it to one line.

### S6, P2: left margin
- `.sp-win` sits at x 20 with a 12 px frame, so it is 8 px from the stage edge, while the right column ends 40 px from the edge. Lane D's capture contract fixes the position, so leave it and record it here so nobody "fixes" it.

## Caught (`versus`, pass B2)

### V1, P1: low contrast in the "none" state
- Where: `versus.css:18`, `color: var(--metal-hi)` (#6b4a36 on #0c0a09 is 2.5:1).
- Seen in: `versus-none-1920x1080.png`.
- Fix: `color: var(--ash)` (6.1:1).

### V2, P2: the real run never shows REJECTED
- `crew/exports/doom_r01/events.jsonl` has 28 claims and 0 false claims or fakes, so in the director's real replay Caught always says CONFIRMED. REJECTED only appears with fixture data, which is correctly marked SAMPLE DATA (`versus-rejected-fx01-*`, `split-fx01-sample-*`). This is a content risk for the "Trust but Verify" beat, not a styling bug. Flag it to the demo owner and never stage a lie.

### V3, P2: stamp easing
- `versus.css:22` uses `cubic-bezier(.2,.9,.3,1.2)`, which the detector flags as bounce. Here it is a deliberate rubber-stamp overshoot, so keep it. This is a false positive.

Who caught the lie is missing ("Agent claimed it was right" has no counterpart). Optional: add a second small line under the detail in `--hud`, "CHECKER RE-RAN THE COMPILER", so the fighting-game duel from 02_DESIGN survives in one line.

## Faster (`timetrial`, pass B3)

### T1, P1: a single bar at full width
- Where: `src/scenes/timetrial.ts` around lines 34-46 (the bar width is `v / top * MAX`, so a lone bar equals MAX).
- Seen in: `timetrial-1920x1080.png`.
- Problem: under "shorter is faster", a bar that fills the track reads as the slowest possible result.
- Fix: when only one side is measured, drop the bar and show the number alone at hero size (`0.38 min` in Anton 200 px, fire), with "with memory" as its label. Draw bars only when both exist.

### T2, P1: hierarchy is upside down
- Where: `timetrial.css:31-34` (`.tt-say`, Anton 88 px, bone, uppercase).
- Problem: the absence ("NO MEMORY-OFF RUN TO COMPARE YET.") is the loudest element on screen.
- Fix: when there's no pair, use Barlow 600 48 px in `--ash`, sentence case: "No memory-off run to compare yet." Keep 88 px Anton for the real comparison sentence.

### T3, P2: footer jargon
- `tt-runs`, "doom_r01 · train". Use "run doom_r01, training split" in `--hud`.

### T4, P2
- The empty "not measured yet" box uses `--metal-hi` dashes at 2.5:1. That's acceptable for a decorative border; switch it to `--ash` if T1 keeps the box.

## Alive and credits (`ending`, pass B4)

### E1, P1: missing QR is a white error slab
- Where: `ending.ts:53-56` and `ending.css:36-44`.
- Seen in: `ending-fx01-1920x1080.png`.
- Fix: add `img.onerror` that sets a `.qr-missing` class. In that state, hide `.img` (the white plate) and show the URL large instead (Barlow 700 48 px bone, under "PLAYER 2, PRESS START"). Never show "QR image not found" to judges.

### E2, P2: credits heading repeats
- Where: `ending.ts:34` (`<h1>BUILT TODAY / NOT OURS</h1>` above h2s with the same words).
- Fix: change the h1 to "CREDITS", or drop it and move `.cc` up (padding-top 150 px to 120 px). Keep the h2 wording because the rules require it.

### E3, P2: NOT REBUILT YET reads as disabled
- `ending.css:10-16`. Grey 190 px Anton says "inactive". Keep the honesty. Option: put it in `--bone`, with "28 of 568 pieces proved" as the coloured hero line.

### E4, keep
- Hash rows in mono and the "IDENTICAL / IT'S ALIVE" stack read well from 3 m.

## Title (`title`, pass B5)

### Ti1, P2: replay mark on a data-free screen
- Where: `main.ts:85-90` uses `scene.sample()`. `TitleScene` has no `sample()`, so the stream mark shows "REPLAY · 20X · END" on a screen with no data.
- Fix, in the scene file only: add `sample() { return false; }` to `TitleScene`. That makes `own` non-null, so the REPLAY label hides while NO SIGNAL still shows. Check that `renderMark` keeps the `!connected` branch.

### Ti2, P2: one game cue
- The title is the most template-like layout (centered word, tagline, CTA). One honest addition in `--hud` below the tagline, such as a save slot "FILE 1   DOOM   28/568" from `ctx.state` (real numbers only), would bring back 02_DESIGN's save-file idea without breaking "one idea per screen". Skip it if Lane C wants the title bare.

## Checks run

- Contrast on `--bg` #0c0a09: bone 15.7, toxic 15.5, guess 8.3, fire 6.9, ash 6.1, blood 3.3 (display sizes only, which passes 3:1 large), rust 2.9 (decorative only), metal-hi 2.5 (V1, T4). The corner marks pass: bg on fire 6.9, bone on blood 4.8.
- `impeccable detect` on `stage/src`: 5 warnings. G4 side-tab in dead code, G5 width transitions twice, V3 stamp easing (false positive), and the bevel inset shadow on `.sp-bar i` (false positive, it's the intentional bevel).
- No em or en dashes in visible strings. No emoji. No text under 28 px.

## Keep

- The palette discipline: toxic green only for proved, violet with "?" only for guessed names, blood only for rejected. Don't add colours.
- Hard offset shadows (`0 10px 0 #000`, the rust edge on the logo) instead of glows.
- The honesty marks: SAMPLE DATA, REPLAY · NX · END, NO SIGNAL · RECONNECTING. They're readable, in the corner, and correct per scene.
- One giant number per screen (28 / 568, REJECTED, IDENTICAL), readable from 3 m at 1280×800.
- The EXPECTED / GOT instruction diff with the wrong register underlined in blood.
- PRESS START blinking with `steps(1)`, and the block dissolve itself (only its colour is wrong).
- The fixed 1920×1080 stage scaled to the window: nothing reflows at 1280×800.
- Self-hosted OFL fonts, so it works offline.
