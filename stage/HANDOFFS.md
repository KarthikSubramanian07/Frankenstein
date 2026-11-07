# Lane C (Stage) handoffs

## Active assignment from Enzo: implement the genuine coverage map

Read [docs/POKEMON_IMPLEMENTATION.md](../docs/POKEMON_IMPLEMENTATION.md). Publish STARTED / QUEUED AFTER DOOM (exact gate) / BLOCKED (exact input). Next checkpoint: an actual spatial-map/progression scene next to gameplay, with current-position/route, proof-vs-visited legend, scope boundary and node evidence. Use clearly labelled fixture topology until A supplies the real graph. Preserve the working Doom scenes.

Owner: Aidenn. Created by the demo director at 13:15 because the coordination protocol asks every lane for this file; Lane C, take it over.

## Requests from the demo director (13:15, see `docs/DEMO_SCRIPT.md`)

1. **A frozen Stage for the demo.** The Vite dev server hot-reloads on every teammate save: 4 reloads in 80 s at 12:43, and in the real-time rehearsal a reload sent the Stage back to Title, so `space` opened Hi-score instead of the credits. Document `npm run build` plus a static server on :5173 (for example `npx vite preview --port 5173 --strictPort`) as the demo mode.
2. **The game on the Split without OBS.** In the room there is no OBS, so the Split's game window shows the function grid and Doom is never on the Stage. Option: `?game=http://127.0.0.1:7401/` puts the browser player in the game window as an iframe with `allow="cross-origin-isolated"`; the Stage page then needs COOP `same-origin` and COEP `require-corp` too (Vite `server.headers` and `preview.headers`). Until then the demo uses two windows.
3. **Time trial: compare the right runs, honestly.** It compares `doom_r04` (Snap off) with the ghost and shows NEW LAP RECORD. Compare library on vs off with Snap on (`doom_r02` 30/40 vs `doom_r03` 28/40) and label it "within noise" (DECISIONS 12:38). "YOU · LIBRARY ON" and "GHOST · LIBRARY OFF" overlap at 1920×1080.
4. **One number per scene.** Split shows 14/30, 11/459 and 14 of 568 at once; the Title shows 1.1%. Keep the hero number and dim the rest.
5. **Versus for a rejected fake.** When Lane B emits a fake rejection (crew request 1), stamp "BYTE MATCH · REJECTED" with the Checker's reason.
6. **Title wraps** "6 PROVED · 0 LIES CAUGHT" onto two lines, and the red reads as an error.

## Responses from Lane C (Aidenn, 13:25): the Stage is being redesigned, minimal and Doom-inspired

Aidenn's direction: one idea per screen, readable in 3 seconds, one big number, at most three elements. Screens: Title, Rebuild (was Split), Caught (was Versus), Faster (was Time trial), Alive (Ending + credits). Hi-score is folded into Rebuild (keys `5`/`h` now open Rebuild).

1. **Frozen Stage:** `cd stage && npm run demo` builds and serves the bundle on :5173 (`vite preview`, strict port). No hot reload.
2. **Game on the Split without OBS:** `/?scene=split&game=http://127.0.0.1:7401/` puts the player in the game window (x 20, y 92, 960×640) as an iframe. The Stage page is now cross-origin isolated (COOP `same-origin`, COEP `require-corp`, on dev and preview); the player page must keep sending its own isolation headers (localhost ports are same-site, so CORP `same-site` or `cross-origin` works).
3. **Time trial → "Faster":** two bars, With memory vs Without memory (minutes per piece), Doom only, same split, library on vs off; under a 10% gap it says "within noise". It needs `doom_r02` and `doom_r03` in `crew/exports/` (only `doom_r01` and `bench_r01` are on GitHub); until then the off bar reads "not measured yet".
4. **One number per scene:** done by the redesign.
5. **Fake rejection:** Caught shows REJECTED with the Checker's reason from `fakematch.rejected`, and a lie or a fake during Rebuild cuts to Caught for about 4 s.
6. **Title wrap:** gone (the Title is now the name, the line, PRESS START).

**Heads-up for `docs/DEMO_SCRIPT.md`:** the judgment rail (MUSE / SNAP / GEMINI / PROOF lines) is no longer on screen; sponsors are one line on Rebuild ("Muse writes · Snap checks · Compiler proves"). `judgment.ts`, its tests and the reducer hook are kept. Please update the 0:22 beat and the `5` key.
