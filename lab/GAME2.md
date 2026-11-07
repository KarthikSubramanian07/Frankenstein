# Game 2 spike (2026-11-07)

Goal: a second legal GBA game in C, after DOOM, to show that each game makes the next one faster.

## Comparison

| | Attack on Voxelburg | Celeste Classic GBA |
|---|---|---|
| Repo | MutantStargoat/voxelburg @ `c9f9ebc` | JeffRuLz/Celeste-Classic-GBA @ `6d4051f` |
| Code license | GPLv3 or later (`COPYING` plus README "License") | **None.** No LICENSE file, and GitHub's license API returns 404, so all rights are reserved |
| Asset license | Same author. Art ships in the GitHub release `jam` (`voxelburg_jam.tar.gz`, `data/`) next to `COPYING` and the GPLv3 notice. There's no separate asset license, so ask the author if a judge wants one in writing. | Art, map and music are Maddy Thorson and Noel Berry's PICO-8 originals (`gfx.h`, `map.c`, `maxmod_data/*.xm`). The README credits them but grants nothing. **Not redistributable.** |
| Builds (pinned devkitARM r68, GCC 16.1) | Yes, after two workarounds listed below | Not built because of the license |
| Reproducible | Yes. Two clean builds give the same output: `.gba` SHA-1 `c93ffa6d252c7e1d0879170363a2fd1857a12046` (754,452 B), `.elf` `6132d7b4aea3ba7a200565dfd6be6dbcfe161774` | n/a |
| C functions (nm t/T on game objects) | **98**, 17,484 B in total | about 87 by a rough source grep (`main.c` 77, `pico8.c` 10) |
| Size distribution | <64 B: 46, 64-255: 35, 256-1023: 15, 1-4 KB: 2, >4 KB: 0. Median 68 B. Largest: `gamescr_frame` 2172, `xgl_draw` 1760, `polyfill_flat` 960 | n/a |
| Blockers | No LTO and no C++. One asm file (`src/gba/asmutil.s`, a debug-panic helper that is easy to exclude). 9 functions are `ARM_IWRAM` (`target("arm")` set per function, not per file), and the flags differ from Doom's (`-O3 -fomit-frame-pointer -fcommon ... -DBUILD_GBA -DNOSOUND`, no `-std`) | License (fatal) |
| Recognisable to non-gamers | Low as a name, but it looks like a flight game over 3D voxel terrain at first glance | Medium-high (Celeste is famous) |
| Visual "healing" | Strong. A broken `vox_render_*` or `polyfill_*` visibly breaks the terrain or the pods, and fixing it restores the 3D scene | Would be good, but moot |
| Browser emulator | Plain GBA ROM in bitmap mode, no save hardware, sound compiled out (`-DNOSOUND`). It should run in the same mGBA/browser setup as Doom. **Not tested in the browser yet.** | moot |

Celeste note: the clone is still in `lab/secrets/game2/celeste` (git-ignored, never built). My delete was blocked by a hook, so remove it by hand. We have no right to use it.

Other candidates considered: none beat Voxelburg in the time available. Most well-known open GBA homebrew is C++ (Butano games, Apotris, OpenLara) or ships commercial data (Wolf3D and Tomb Raider ports).

## Recommendation: Attack on Voxelburg

- It's the only candidate whose code and art are clearly licensed for modification and redistribution (GPLv3, the same family as GBADoom).
- It already builds byte-reproducibly on our pinned image with no LTO to strip.
- At 98 functions it's about 1/8 the size of Doom, which fits the "second game goes faster" story. Most functions are small (81 of 98 are under 256 B), and the few big ones (the voxel renderer, the polygon filler) are the visual payoff.
- It's a 3D renderer like Doom, so agents can carry over what they learned (fixed-point maths, column renderers, the GBA register idioms).
- Downside: few people know it by name. Pitch it as "a 3D flight shooter".

## Build workarounds (done in `lab/secrets/game2/voxelburg`)

1. `data/` lives in the author's SVN. I copied it from the GitHub release tarball instead: `gh release download jam -R MutantStargoat/voxelburg -p voxelburg_jam.tar.gz` and then `data/` from it.
2. The Makefile wants to rebuild the `.raw`/`.pal` files from PNGs with a host tool that needs libpng, which the image doesn't have. I moved `data/*.png` aside (to `lab/secrets/game2/dl/png/`) so make uses the prebuilt raws. `tools/lutgen` builds with the container's host `cc`, and `data/lut.s` came out the same in both builds.
3. Build: `docker exec -w /work/lab/secrets/game2/voxelburg frank-lab bash -lc 'export PATH=$DEVKITARM/bin:$DEVKITPRO/tools/bin:$PATH; make clean; make'`. `gbafix` has to be on PATH.

## Making it a second target

Everything is Doom-hardcoded today. Steps:

1. **`lab/games/<game>.toml` (or a dict in one `lab/games.py`)**: `src_dir`, `obj_glob` (Doom `build/*.o`, Voxelburg `src/**/*.arm.o`), `elf`, `gba`, `thumb_flags`, `arm_flags`, `include_dirs`, `subsystems`, `clean_cmd`, `make_cmd`, plus the `pre_build` steps above.
2. **`lab/build_target.sh <game>`**: take `SRC`, the ROM/ELF names and the Makefile patch from that config. The `sed -flto` step becomes Doom-only, and Voxelburg needs `PATH=$DEVKITARM/bin:$DEVKITPRO/tools/bin`. Write to `lab/out/<game>/target.gba` and `lab/secrets/<game>/target.elf` so Doom's outputs are never overwritten.
3. **`lab/dump_target.sh <game>`**: change `target.elf`, the `gbadoom/build/*.o` glob and `dump/` to per-game paths, and skip `asmutil.arm.o`.
4. **`lab/split.py --game <game>`**: `SRC`, `DUMP`, `OUT`, `SECRETS/target.elf`, the `git -C gbadoom` provenance line, and `SUBSYSTEMS` all come from the config. Voxelburg subsystems: `terrain` (`voxscape`), `3d` (`xgl`, `polyfill`), `game` (`gamescr`), `menus` (`menuscr`, `logoscr`, `ctrlscr`), the rest goes to "world". Leave `debug.c` out of the manifest.
5. **`lab/referee/core.py`**: `THUMB_FLAGS`, `ARM_FLAGS`, the `-iquote lab/secrets/gbadoom/...` includes, the `gbadoom/` source and object paths, and `romlink.py`'s `OUT/target.gba` all move to the config. Voxelburg Thumb flags: `-O3 -fomit-frame-pointer -fcommon -mcpu=arm7tdmi -mtune=arm7tdmi -mthumb -mthumb-interwork -DBUILD_GBA -DNOSOUND -I. -Isrc -Isrc/gba -Ilibs/maxmod`. The 9 `ARM_IWRAM` functions carry their own `target("arm")` attribute, so the file-level ARM/Thumb choice doesn't matter for them. Check that `ctx/<id>.h` keeps the `ARM_IWRAM` macro.
6. **`lab/export_targets.py`**: same path parameterisation.
7. Check: run the T1 double build for Voxelburg, then rebuild one known function through the referee and confirm a byte match before the agents start.
