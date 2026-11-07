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
