# Playable Doom on Eddy's laptop (Lane A, 15:07)

## Packaging on macOS

GbaWadUtil (doomhack, GPL) is built natively from the copy of its source in the pinned GBADoom repo (`tools/GbaWadUtil`, which writes IWAD version 15). The standalone GitHub repo's HEAD writes version 12 and does not work with our engine. Qt 6 comes from Homebrew.

```sh
S=lab/secrets/gbadoom/tools/GbaWadUtil; mkdir -p /tmp/gwu && (cd /tmp/gwu && qmake6 "$PWD/../../$S/GbaWadUtil.pro" && make -j8)
# the build writes lab/secrets/gbadoom/GbaWadUtil/GbaWadUtil, next to the pinned .exe and its data/gbadoom.wad (gitignored)
U=lab/secrets/gbadoom/GbaWadUtil
(cd $U && ./GbaWadUtil -in doom1.wad -rom ../../../out/<engine>.gba -romout ../../../out/play/<engine>.gba)
```

Every package below passes `creature/runtime/package_rom.py`'s `validate_package` (engine bytes preserved, version 15, GBAVER lump, episode-one data). The original's package is byte-identical to Lane D's (`e1ddb8fb…`, made on Windows with the pinned .exe) and to Lane B's `tools/package_rom_native.py`. Packaged ROMs are gitignored and never committed.

| Engine (`lab/out/`) | Engine SHA-1 | Package (`lab/out/play/`) SHA-1 |
|---|---|---|
| `target.gba` (original) | `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2` | `e1ddb8fb96764422d5fb6b1c84c83b85c98236bd` |
| `rebuilt_union.gba` (169 agent functions spliced) | `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2` | `e1ddb8fb96764422d5fb6b1c84c83b85c98236bd` (same) |
| `god_200.gba` (recovered `fn_080054C8` edited) | `7acc0dc9122dbbabcab271afd735ebcde7dcfa34` | `5d43443779b97dfe1bcec8205f51ec11ce30a787` |
| `instant_raise.gba` | `a997215e40fa…` | `930051edbcef856ef78a96857167dee4d1a2f70f` |
| `hud_shift.gba` | `19dcd9017bf1c869cb960ea0cdfd175832eafcb1` | `ba7214777059448c3344727ce0b6871ea59bc1ee` |
| `static_face.gba` | `752c61e50fc1255e301e8efa4011082bf380c3e2` | `337fbb15462b57eb6cc5a35bcf11e36646e130e2` |

## Playing

```sh
cd creature/phone && npm install --ignore-scripts && npm run prepare:core
node serve.mjs --port 7401 --rom "$PWD/../../lab/out/play/rebuilt_union.gba"   # original-equivalent
node serve.mjs --port 7402 --rom "$PWD/../../lab/out/play/god_200.gba"         # the change
```

Keys: Enter opens the menu, X selects (GBA A), arrows move, Z fires, E changes weapon. New Game, then X three times reaches E1M1.

## Observed (Chrome, mGBA WASM core, 15:05)

- Both packages boot to the title, the menu and E1M1 in a browser on this laptop.
- **god_200 works.** In E1M1, the god-mode sequence (Up Up Down Down Left Left Right Right; the GBA has no keyboard, so nobody types IDDQD) shows "DEGREELESSNESS MODE ON", the eyes turn gold, and HEALTH reads **200%** (`shots/god_200_after.png`; before: `shots/god_200_before.png`, 100%).
- **Control:** the same sequence on the unmodified rebuild gives the same message and eyes, with HEALTH at **100%** (`shots/original_god_after.png`). Only the health number differs.
- So the code that runs when you enter the cheat is the agents' recovered C (`fn_080054C8`, referee MATCH), and editing that C changes the game.

## Not tested here

- `instant_raise`: packaged and valid, not playtested (needs a second weapon, and the change is timing, not a still frame).
- `hud_shift`: packaged, not playtested here. Lane B reports it moves menu text and the 3D view, not the status bar.
- Real phones, sound, and save-state swaps.
