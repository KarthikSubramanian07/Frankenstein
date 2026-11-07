# Stage → Lane D (answers to creature/HANDOFFS.md "Requests to C")

1. **Launch and routes.** `cd stage && npm install && npm run server` (http 127.0.0.1:7201, ws 127.0.0.1:7202), then `npm run dev` (http://127.0.0.1:5173, strict port). Scenes: `/?scene=title|split|hiscore|versus|timetrial|ending`; keys `0` Title, `1` Split, `5`/`h` Hi-score, `2` Versus, `3` Time trial, `4` Ending (`space` on Ending flips to the Built today / Not ours card, or open `/?scene=ending&page=credits`). Replay: `&replay=<run dir>&speed=1-20&t=<seconds in>`. OBS: add `&obs=1` for a transparent background.
2. **Game geometry on Split at 1920×1080.** The game window is **x 20, y 92, 960×640**: GBA 240×160 at an integer 4× with no crop. With `?obs=1` that rectangle and the page background are transparent; a 4 px violet outline sits 8 px outside it. Capture is OBS: mGBA window capture under the Stage browser source, full screen. The Stage only draws beams that land on `viz_map.json` regions in those coordinates (x = 20 + 4·gx, y = 92 + 4·gy).
3. **Agreed:** face restoration inside the ROM is primary; the region overlay comes later.
4. **Agreed and already true:** the badge says "NOW RUNNING ON ORIGINAL CODE" until a `rom.swapped` event arrives, then shows its `pct_agent_code`. Ending reads `build.rom`, `patch.verified` (`PATCH 1.01: N FUNCTION(S) CHANGED`) and `phone.published` (it loads `qr_png` through `http://127.0.0.1:7201/file?path=<path under creature/>`; a missing image shows "QR IMAGE NOT FOUND", never a fake code).
5. **Ending.** It shows the true % recovered (no 100% assumed), the original checksum from `manifest.game.rom_sha1`, the rebuilt one from `build.rom`, and IDENTICAL only when the lab says identical and the hashes agree (otherwise DIFFERENT in red). The Built today / Not ours card is one key away.

## Update 13:00 (Lane C)

- **Director mode:** `/?director=1` runs the judging-room show (`stage/director/show.json`) on `space` / `b` / `r`. Beat 2 replays the real `doom_r01` export at 8x (labelled REPLAY · 8X); beat 5 switches the Stage to `runs/live` without a reload, so point `runs/live` at the live run before the demo.
- **Game window unchanged:** x 20, y 92, 960×640. Without `?obs=1` the Stage draws its own cartridge map there (one cell per function, static until proved); with `?obs=1` that area is transparent for your mGBA capture.
- **The face:** when `fn_0801B298` matches, Split beams to the middle of the status bar and shows "DOOMGUY'S FACE?" (violet until `names.json` marks it `inferred: false`).
- **Origins:** the Stage server now answers browsers only from `http://127.0.0.1:5173` or `http://localhost:5173` (set `STAGE_ORIGINS` to add one). Load the OBS browser source from one of those.

## Update 13:20 (Lane C): minimal redesign

- **Game window unchanged:** still x 20, y 92, 960×640 on Rebuild (`?scene=split`). With `?obs=1` it is transparent. Without OBS the Stage no longer draws the function grid there: it is an empty bevelled frame, or your browser player if the URL has `?game=http://127.0.0.1:7401/` (the Stage page is now cross-origin isolated, COOP `same-origin` + COEP `require-corp`; keep your player's own isolation headers).
- **Badge:** "Running on N% agent-written code" appears under the game window only after a real `rom.swapped`.
- **Alive (`?scene=ending`):** IDENTICAL plus both checksums and IT'S ALIVE only when `build.rom` says identical and the hashes agree; the QR only after `phone.published` (it loads `qr_png` through `http://127.0.0.1:7201/file?path=…`). Credits unchanged in content (`space`, or `?page=credits`).
- **Keys:** Hi-score is gone; `5`/`h` open Rebuild. Director beats: Title, Rebuild (replay 8x), Caught, Rebuild live, Faster, Alive, credits.
- **Frozen demo build:** `cd stage && npm run demo` (no hot reload).

## Update 14:05 (Lane C): one screen plus an ending card

- **Default Stage (`http://127.0.0.1:5173/`):** one main screen. The game window stays at **x 20, y 92, 960×640** (transparent with `?obs=1`, your browser player with `?game=http://127.0.0.1:7401/`); on the right a big "N / 568 pieces rebuilt" and a plain-English log, newest first (✓ name? proved / ✗ name? REJECTED, claimed right, why). Silent: no sounds, voice or beams.
- **`space`** toggles the main screen and the ending card (IDENTICAL + both checksums + IT'S ALIVE only when `build.rom` proves it; "Play it on your phone: <url>" after `phone.published`). **`c`** on the card shows Built today / Not ours.
- **Old scenes and director mode** are kept but only with `?legacy=1`.
- Replay (`?replay=doom_r01&speed=8`), REPLAY / SAMPLE DATA labels and `npm run demo` are unchanged.

## Update 14:13 (Lane C): **the game window moved and grew** (breaking for OBS)

- Default Stage game window is now **x 40, y 140, 1200×800** (GBA 240×160 at an integer **5×**), was x 20, y 92, 960×640. Please move the mGBA capture in OBS to match. `?obs=1` still makes it transparent; `?game=http://127.0.0.1:7401/` still embeds your player there.
- The log is a narrow column on the right (x 1290 to 1880). No other changes for you.

## Update 15:45 (Lane C): readiness for the integrated rehearsal (supersedes the geometry and face notes above)

- **READY.** Stage code last changed in d46eedf. Build `npm --prefix stage run build`; typecheck clean, 13/13 tests pass on macOS.
- **Blocker on D's side:** 0ce5df0 (controls model, 14:27) rewrote `creature/phone/serve.mjs` after 49abd44 and dropped `--stage`. Re-apply the stage mount before the one-origin :7416 run.
- **Geometry (default view, 1920×1080):** game iframe at left 40, top 140, 1200×800 (GBA 5×); live log at left 1290, top 140, 590×800. The REPLAY/SAMPLE label sits in the game window's top border.
- **One origin :7416:** `STAGE_ORIGINS=http://127.0.0.1:7416,http://localhost:7416,http://127.0.0.1:5173,http://localhost:5173 node stage/server/index.mjs`. Built assets use root paths `/assets/` and `/fonts/`.
- **Routes:** main `/stage/?game=<player url>&replay=<run>&speed=N` (no `replay` = live tail). `space` toggles main and the ending card; `c` on the card toggles the credits; `6` opens the road view. Lane A's Split beat: `?legacy=1&scene=split`; its fallback is a second tab with `&replay=doom_r01&speed=4` (key `1` does not start a replay).
- **The face:** Split no longer labels or announces `fn_0801B298` as the face (approved by Lane A); the face is not recovered.
- **Launch owner:** C runs the frozen Stage (vite preview :5173) and the data server on Aidenn's laptop only. On Enzo's laptop D launches everything.
