# Lane A toolchain (pinned 2026-11-07)

Everything runs in Docker, so every teammate gets the same compiler. The native devkitPro installer needs sudo; nobody needs it.

| Piece | Version |
|---|---|
| Image | `devkitpro/devkitarm@sha256:116afba8df8453961de2936ffab20dd441edf4d682856c1ec8b0e53d7ed0bbf5` |
| devkitARM | r68 |
| GCC | arm-none-eabi-gcc (devkitARM) 16.1.0 |
| Binutils | 2.46.0 |
| newlib | 4.6.0.20260123 |
| libgba | 0.5.4 |
| Target | doomhack/GBADoom @ `7763f5f` |

Flags: GBADoom's Makefile unchanged except `-flto=8` removed from the Thumb C flags (`-O3 -mcpu=arm7tdmi -mthumb -mthumb-interwork -std=gnu23 -fno-inline-functions-called-once …`). IWRAM files keep upstream's `-fno-lto -marm`.

Build: `lab/build_target.sh` (clones nothing; expects `lab/secrets/gbadoom`). It builds twice from clean and checks the SHA-1s match (T1).

Result: `lab/out/target.gba`, SHA-1 `a6c18b5d4d0f7fb503423a7350a88237f43f2bb1`, 1,403,968 bytes, 840 defined functions in the ELF (game plus library). No WAD inside; Lane D patches the shareware WAD in with GbaWadUtil for playable ROMs.

Binutils inside the container are not on PATH: use `$DEVKITARM/bin/arm-none-eabi-*`.

At `-O3`, GCC inlines static helpers into their callers: `st_stuff.o` has 6 functions (`ST_calcPainOffset` is inside `ST_updateFaceWidget`, 0x488 bytes).
