# Frankenstein: the one-minute submission film

1920×1080, 30 fps, exactly 1800 frames (60.0 s). Built in code with Remotion (React + TypeScript), reusing the
craft from Eddy's Platypus ad. Built with Remotion under its free license for individuals and small teams (Eddy Zhao's use).

## Render

```bash
npm install            # or reuse an existing node_modules
npm run render         # → out/frankenstein_film_final.mp4
npm run stills -- Frankenstein 150 560 770 1000 1150 1300 1500 1620   # QA stills → out/stills/
```

Narration: drop `public/voice/narration.m4a` (or `.wav`/`.mp3`) in and re-render; it plays from frame 0. Without it
the film is captions only. No music and no generated audio.

## Real vs drawn

| Beat | Time | Real capture | Drawn in code |
|---|---|---|---|
| Hook | 0:00 | `clips/side_by_side.mp4`: god-mode cheat, unmodified vs one line changed (labels are part of the capture) | the "health 100% / 200%" readouts under it |
| Problem | 0:06 | none | cartridge and recipe card (SVG, a metaphor), the 87% line |
| How | 0:11 | the machine code and C text are real (`DATA.match`: `lab/out/target/fn_08013CA4.json`, the recovered C) | the two panels, the typing, the MATCH stamp |
| Trust | 0:20 | the claim and the referee's first differing instruction are a real event (`crew/exports/doom_r12`) | the cards and the REJECTED stamp; 24 / 30 / 0 from `tools/counts.py` |
| Proof | 0:28 | the SHA-1 and the count are real (`DATA.functions`, `DATA.sha1`) | the grid, the cards, the IDENTICAL stamp |
| Run over run | 0:36 | fn_0801ABC0 at 90% in `doom_hud02`, MATCH on attempt 10 in `doom_hud03` | the bars |
| Why source | 0:40 | `clips/god_200.mp4` (the 100% to 200% flip), then its real last frame; `clips/equivalence.mp4` | the counter in the film's type |
| Partners | 0:46 | Snap's line is a real `snap.decision` | the four cards |
| End | 0:53 | none | credits: built today / not ours, 7 s |

Every number and code line comes from `src/data.ts`, which names its source. Update it after the 16:00 freeze and
re-render (about 90 s). The "FOR EXPERTS" line at the bottom of each beat carries the technical detail.
