# Raw footage for the one-minute video (Lane A, 15:25)

Real screen captures from Chrome on Eddy's laptop (chrome-devtools screencast, 2880×1490, re-encoded to 30 fps H.264). No narration, music or editing beyond trimming, cropping and the two labels on the side-by-side.

| File | Length | What it shows |
|---|---|---|
| `god_original.mp4` | 9.6 s | Unmodified rebuild (package `e1ddb8fb…`, :7401), fresh New Game, E1M1. The god-mode buttons (Up Up Down Down Left Left Right Right) show "DEGREELESSNESS MODE ON", the eyes turn gold, HEALTH stays **100%**. |
| `god_200.mp4` | 9.3 s | Same steps on `god_200` (package `5d434437…`, :7402): one line changed in the agents' recovered god-mode function `fn_080054C8`. HEALTH reads **200%**. |
| `side_by_side.mp4` / `.png` | 6.8 s | The two clips aligned on the god-mode message (left trimmed from 2.6 s, right from 2.4 s), game area cropped, labelled "unmodified" / "one line changed in the agents' C". |
| `equivalence.mp4` / `equivalence_end.png` | 5.5 s | `lab/demo/equivalence/web` (:7451) loading and showing "20,000 of 20,000 identical": the agents' C compiled to WebAssembly vs the original GBA machine code's outputs. It finishes almost instantly, so there's no visible count-up. |
| `god_original_end.png`, `god_200_end.png` | stills | Last frames of each clip. |

Both players run the agents' recovered god-mode function; only the right one has our one-line edit. The button reader (`fn_08005828`) is original code (see `lab/demo/iddqd.md`).

Notes for whoever edits: the player restores its last session, so record each clip in a fresh browser context; close other emulator tabs first (background emulators made the cheat input miss three times on god_200). Inputs were sent with 90 ms key holds and 110 ms gaps.
