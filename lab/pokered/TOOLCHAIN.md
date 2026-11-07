# Pokémon Red toolchain

| Item | Version / identity |
|---|---|
| Source | pret/pokered, shallow clone of commit `0dbf95cd12f5b1511c62ce69efe283000f780a8f` (2026-10-31), in `lab/secrets/pokered/` (gitignored) |
| Assembler | RGBDS 1.0.4 (`rgbasm`, `rgblink`, `rgbfix` all report v1.0.4), the version pinned in pokered's INSTALL.md |
| Install | `brew install rgbds` on the host. Homebrew's stable bottle is 1.0.4. The devkitARM `frank-lab` container is untouched. |
| Host tools | GNU Make 3.81, Apple clang 21.0.0 (builds pokered's `tools/`), macOS 26 (Darwin 25.5.0), arm64 |

## Build identity

`make red` was run twice, each time after `make clean`. Both builds produced the same file:

```
pokered.gbc  sha1 ea9bcae617fdf159b045185467ae58b2e4a48b9a
```

This matches the `pokered.gbc` line of pret's `roms.sha1` (`shasum -c roms.sha1` prints `pokered.gbc: OK`). No ROM was downloaded; the game was assembled from the public source.

Rebuild:

```
cd lab/secrets/pokered && make clean && make red && shasum -c roms.sha1
```
