# DECISIONS

A dated log. Every assumption, contradiction, and partner-prize answer goes here, one line each. Newest at the bottom.

## Corrections to the kit (2026-11-07, foundation, from the pre-hack audit). These override `docs/`.

**Clock.** Hacking runs 10:45 to 17:00 (6 h 15 min), not 10:00 to 17:30. Feature freeze is 15:30 (deadline minus 90 min). Every gate now lands before freeze:

| Time | Gate | If it fails |
|---|---|---|
| 11:00 | Lane 0: foundation pushed, tag `v0-foundation`, everyone cloned | Anyone pushes what exists |
| 11:30 | A: GBADoom builds twice with an identical SHA-1 (devkitARM, no LTO) | Last call to switch target is 11:45 |
| 12:00 | A: referee MATCH on the original source of 5 functions, PARTIAL on a 1-line edit | B, C, D stay on mocks |
| 12:30 | B: first real match verified by the Checker through the real referee | Smallest functions first |
| 12:45 | A: memory probe, both numbers (unmodified and variant) | Say "not measured" on stage |
| **13:00** | **D: finale decided.** A real bug confirmed, or switch to the "it can change again" modification | Use the modification |
| 13:30 | C: Stage tails a real `events.jsonl`. A: ASI:One verify works end to end | D pairs with A |
| 14:00 | D: heal overlay reacts to real `fn.matched` events | Whole-screen heal by % |
| 14:15 | B: ablation (library on vs off) on held-out functions has numbers | One run, said honestly |
| 14:30 | A: `rebuild` (source-tree) and `patch` proven with tests | |
| 14:45 | A + D: patched ROM verified (exactly one function changed) | |
| 15:00 | D: phones load the patched ROM. A: Excavator and Curator working | Laptop only |
| **15:30** | **Freeze.** Three clean golden-path runs, the 60 s video exported | Cut per the cut list |
| 15:30 to 17:00 | Submit early. Rehearse the 3-minute judging-room demo three times | |

**Compiler (Lane A).** Skip agbcc entirely. Use devkitARM's GCC (install devkitARM via devkitPro, not Homebrew `arm-none-eabi-gcc`; GBADoom needs `$DEVKITARM`, `gba_rules`, its `gbadoom.specs`, and a GCC new enough for `-std=gnu23`). Pin the version in `lab/TOOLCHAIN.md`. Use the upstream Makefile flags (checked at doomhack/GBADoom@7763f5f: `-O3 -flto=8 -mcpu=arm7tdmi -mthumb -mthumb-interwork -std=gnu23 …`) **minus `-flto=8`**: LTO objects hold compiler IR, not machine code, and the linker inlines and merges functions across files, so per-function matching is impossible. Fall back to `-O2` if `-O3` inlining blocks matches. The contract `compiler` field says this.

**Rebuild (T7).** Do not rebuild the ROM from per-function raw `.s` files. Drop each matched function's C into the source tree in place of the original and run the normal Makefile; the ROM has the same SHA-1. Contract: `rebuild_result.from_original` and `method: "source-tree"` (renamed from `from_asm`, before anyone coded). On stage: "recovered functions are built from the agents' C, the rest from the original."

**Memory probe.** Run the same from-memory sources against both the unmodified GBADoom build and our variant, and report both numbers (`memory_probe.unmodified` and `.variant`). A high unmodified score is the reason the variant exists, so show it.

**Variant edits.** Renaming symbols does nothing, because agents only see `fn_` ids. Reordering struct fields breaks Doom, because several structs are read straight from the WAD in a fixed byte layout. Limit edits to function bodies in the target files: `st_stuff.c` first, then the weapon code (`p_pspr.c`). Play for 30 seconds after the edits to confirm nothing broke.

**Finale bug.** The famous ouch-face bug is already fixed in GBADoom (`source/st_stuff.c` lines 149 and 205 keep the vanilla line commented above the fix). The "demo compatibility is broken" README line is not a 6-second visible bug in one function. Decide by 13:00; otherwise do the honest "it can change again" modification.

**Judging.** Round one is 3 minutes in a judging room on one laptop; only the top six reach the stage. Build the demo for one laptop screen and a few judges first; projector, OBS, and the "room plays" moment are the bonus.

**Video.** 60 seconds, captions burned in. No vertical cut.

**Original contributions (a disqualification rule).** The README, the last beat of the demo, and the video end card carry a "Built today / Not ours" panel.

**New Work Only.** `docs/design_system.html` was written before the event. It is a visual reference and is listed as prior work. Lane C rebuilds the screens in `stage/` after 10:45 and never pastes it.

**Opener.** Cut it to about 20 seconds, with the glitching game on screen the whole time. Show the product by 0:15. Drop the "cartridge in a drawer" line (Doom's source is public). Keep "Ours checks everything" and the Doom reveal.

## Seed decisions

- Target game: **GBADoom** (https://github.com/doomhack/GBADoom, prBoom port in C, GPL-2.0-or-later, Doom shareware IWAD). No commercial ROMs, ever. Fallbacks, only if GBADoom won't build by 11:45: Attack on Voxelburg, then Celeste Classic GBA. Owner: Lane A.
- Our repo is MIT and contains none of GBADoom's code or data. The answer key lives in gitignored `lab/secrets/`.
- Visual direction: "Frankenstein, the game" (five scenes) per `docs/02_DESIGN.md`.
- Partner prizes: Meta $5,000 (best use of the Meta Model API), Fetch.ai $2,500 1st and $2,500 2nd. Others: ask at kickoff and record here.
- Submission deadline: 17:00 Pacific per the event guide. Confirm at kickoff.
- Fixtures: `metrics.sample.json` wraps three runs as `{"fixture": true, "runs": [...]}`. `make sample-runs` installs them as real-looking run dirs (`runs/fx01..fx03`, each marked `fixture: true`) for Stage and Creature development. The sample live run is about 11 minutes long (60 matched, 9 false claims, 3 lint fails).
- Added `contracts/tests/` (pytest) and `make test`. No CI or root frameworks, per Lane 0.
