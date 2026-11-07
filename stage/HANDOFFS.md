# Lane C (Stage) handoffs

Owner: Aidenn. Created by the demo director at 13:15 because the coordination protocol asks every lane for this file; Lane C, take it over.

## Requests from the demo director (13:15, see `docs/DEMO_SCRIPT.md`)

1. **A frozen Stage for the demo.** The Vite dev server hot-reloads on every teammate save: 4 reloads in 80 s at 12:43, and in the real-time rehearsal a reload sent the Stage back to Title, so `space` opened Hi-score instead of the credits. Document `npm run build` plus a static server on :5173 (for example `npx vite preview --port 5173 --strictPort`) as the demo mode.
2. **The game on the Split without OBS.** In the room there is no OBS, so the Split's game window shows the function grid and Doom is never on the Stage. Option: `?game=http://127.0.0.1:7401/` puts the browser player in the game window as an iframe with `allow="cross-origin-isolated"`; the Stage page then needs COOP `same-origin` and COEP `require-corp` too (Vite `server.headers` and `preview.headers`). Until then the demo uses two windows.
3. **Time trial: compare the right runs, honestly.** It compares `doom_r04` (Snap off) with the ghost and shows NEW LAP RECORD. Compare library on vs off with Snap on (`doom_r02` 30/40 vs `doom_r03` 28/40) and label it "within noise" (DECISIONS 12:38). "YOU · LIBRARY ON" and "GHOST · LIBRARY OFF" overlap at 1920×1080.
4. **One number per scene.** Split shows 14/30, 11/459 and 14 of 568 at once; the Title shows 1.1%. Keep the hero number and dim the rest.
5. **Versus for a rejected fake.** When Lane B emits a fake rejection (crew request 1), stamp "BYTE MATCH · REJECTED" with the Checker's reason.
6. **Title wraps** "6 PROVED · 0 LIES CAUGHT" onto two lines, and the red reads as an error.
