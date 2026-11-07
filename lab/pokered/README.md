# Pokémon Red target adapter (Lane A spike)

Second target for Frankenstein, scoped to the title screen and main menu. The game is assembled from pret's public pokered source with RGBDS 1.0.4; no ROM file was downloaded. Toolchain and build hash are in [TOOLCHAIN.md](TOOLCHAIN.md).

pokered is prior work by the pret project. Frankenstein uses it here as the answer key and the build environment, and it never goes into a blind recovery prompt.

## What this proves

The Game Boy's SM83 code was written in assembly, so no original C compiler exists to match against. The proof here is byte matching for each routine: a candidate writes RGBDS assembly for one routine, and the referee splices it into the full source tree under that routine's label, rebuilds the whole ROM, and compares the routine's bytes with the reference build. Assembling in context means `farcall`, bank numbers and cross-bank references resolve exactly as they do in the real game.

It does not prove any C reconstruction, and it does not cover the whole game. A MATCH means one routine's assembly reproduces the original bytes. Nothing here has been recovered blind yet: the self-test feeds the referee pret's own source.

## Ids

A routine id is `rt_BB_AAAA`: ROM bank and address in lowercase hex, taken from the build's `pokered.sym`. Bank 0 is the fixed home bank; banks 1 and up are switchable, so the same address can appear in many banks and the id needs both parts.

Candidates refer to other code and data by id, for example `call rt_00_3e5c` or `farcall rt_0d_7258`. The referee aliases each known id to its real label inside a scratch copy only, then replaces original names and the source file path with ids and `<context>` in the compile log. Any other `xx_BB_AAAA` token, such as a RAM address, becomes a plain constant.

## Result shape

`check(routine_id, asm_src)` returns the same fields as the Doom referee: `status` (`MATCH`, `PARTIAL`, `NO_COMPILE`, `LINT_FAIL`), `match_pct`, `first_diff`, `diff`, `lint`, `compile`, `elapsed_ms`, plus `bank`, `size` and `got_size`. Each diff entry gives a byte offset, expected and got bytes; the `*_ins` fields are null because no SM83 disassembler is wired in yet.

Lint rejects raw-byte and build-shaping directives (`db`, `dw`, `ds`, `INCBIN`, `INCLUDE`, `SECTION`, `MACRO`, `DEF`, `EQU`, `REPT` and similar) and new global labels. Without this, a candidate could emit the target bytes as data. Data blobs and text records (those that use `db`) therefore can't be submitted as routines.

## Commands

```
python3 lab/pokered/referee.py selftest                     # 5 routines: original source MATCH, one-byte edit PARTIAL
python3 lab/pokered/referee.py check rt_01_4496 cand.asm     # one candidate, JSON result
python3 lab/pokered/make_slice.py                            # rewrite slice.json and the secret names file
```

A check copies the source tree to a temp directory and rebuilds, which takes about 2 to 3 seconds. Checks don't share state, so they can run in parallel.

## Self-test (2026-11-07)

| id | size | original source | one-byte edit (`ret` to `reti`) |
|---|---|---|---|
| rt_01_4496 | 43 | MATCH | PARTIAL 97.7%, first diff at +42 |
| rt_01_44dd | 60 | MATCH | PARTIAL 98.3%, first diff at +59 |
| rt_01_5bff | 11 | MATCH | PARTIAL 90.9%, first diff at +10 |
| rt_01_5e8a | 310 | MATCH | PARTIAL 99.7%, first diff at +141 |
| rt_01_609e | 44 | MATCH | PARTIAL 97.7%, first diff at +34 |

The same routines also MATCH when every original name in the source is rewritten to its anonymised id (tested on rt_01_4496 and rt_01_5e8a).

## Slice

`slice.json` lists the title screen and main menu slice: **148 routines, 8,708 bytes, in 12 banks** (62 in bank 0, 59 in bank 1, the rest spread across 10 others). It records ids, banks, addresses, sizes and call depth only. The original names are in `lab/secrets/pokered/names_slice.json`, which the crew must not read.

The slice is the static call closure from the three title and menu entry points, following `call`/`jp`/`jr`, the far-call macros and `predef`. It stops at five boundary routines: the new-game intro, entry to the overworld, the cable club menu, the debug paths and the soft reset. Jump tables and `jp hl` dispatch are not followed, so routines reached only that way are missing. A runtime trace would close that gap.

## Known limits

- The `predef` macro takes a symbolic name, so a candidate can't pass an id through it. Candidates need to write the expanded form instead.
- A routine's size runs from its label to the next global label in the same section. Data that sits between two routines counts toward the first one.
- Only the routines that appear in the self-test have been checked end to end. Routines with inline data will LINT_FAIL until lint gets a per-routine allowance like Doom's.
- Nothing here covers the first Pokémon interactions yet. The next step is to extend the closure from the new-game boundary (the intro, then Oak's lab).
