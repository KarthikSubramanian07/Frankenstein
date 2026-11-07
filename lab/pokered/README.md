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

Candidates can also pass an id through `predef` and `predef_jump` (for example `predef rt_03_78a5`). Those macros paste a suffix onto their argument (`\1Predef`), so the referee also aliases `<id>Predef` and `<id>_id` (for `tx_pre`) to the real pointer-table entries, and scrubs them from the log the same way.

Lint rejects build-shaping directives (`ds`, `INCBIN`, `INCLUDE`, `SECTION`, `MACRO`, `DEF`, `EQU`, `REPT` and similar) and new global labels.

### Inline data rule

Some routines really do carry data in the middle of their code: pointer tables, text records, `text_asm` headers. Bytes emitted as `db`/`dw`/`dl` or by any pokered macro that expands to them (`text`, `text_far`, `dw_const`, `dba` and the rest; the list is computed from `macros/`) are allowed only where the original routine has data:

1. `python3 lab/pokered/referee.py ranges` builds the original source once with zero-byte marker labels inserted at every switch between code and data statements. The build must reproduce the reference ROM exactly. The `.sym` then gives each data run's exact offsets. The result is cached in `lab/secrets/pokered/data_ranges.json`, and each slice unit lists its ranges under `data`.
2. Before building, lint rejects every data statement in a routine whose original has no data ranges.
3. After building, the referee marks the candidate's own data runs the same way. Any run that isn't fully inside one of the original's ranges turns the result into `LINT_FAIL`, even when every byte matches.

So `db $af` in place of `xor a` fails, while the original's own tables pass. Raw bytes can only land where the original has data, and they're compared against that data.

## Commands

```
python3 lab/pokered/referee.py selftest                     # 5 routines: original source MATCH, one-byte edit PARTIAL
python3 lab/pokered/referee.py check rt_01_4496 cand.asm     # one candidate, JSON result
python3 lab/pokered/referee.py ranges                        # rebuild the inline-data ranges cache (~10 s)
python3 lab/pokered/make_slice.py                            # title/menu slice.json + secret names file
python3 lab/pokered/make_slice.py interactions               # slice_interactions.json + secret names file
python3 -m pytest -q lab/tests/test_pokered.py               # self-test + gap tests (skipped without lab/secrets/pokered)
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

## Slices

Both slices record ids, banks, addresses, sizes, call depth, `kind` (code, or pure data such as a pointer table) and inline-data ranges only. Original names, entry points and stop points are in `lab/secrets/pokered/` (`names_*.json`, `slice_config*.json`), which the crew must not read.

The closure follows `call`/`jp`/`jr`, the far-call macros, `predef`, `dw`-style pointer entries, and `ld hl/de/bc, T` when `T` is a pointer table. That last rule catches jump-table dispatch through the table-dispatch helpers and `jp hl`, which covers map script pointers and text pointers.

- `slice.json`, title screen and main menu: **165 routines (164 code), 9,139 bytes, 12 banks** (0, 1, 2, 3, 4, 7, 8, 13, 15, 16, 28, 31). Following jump tables raised it from 148 routines and 8,708 bytes. Same three entry points and five boundaries as before: the new-game intro, overworld entry, cable club, debug paths and soft reset.
- `slice_interactions.json`, new game to the first rival battle: **368 units (322 code, 46 data tables/text), 20,928 bytes, 20 banks** (0-8, 13-18, 22, 23, 28, 31, 44). Entry points: the new-game path and the intro speech, plus the scripts and text-pointer tables of Red's house (both floors), Pallet Town and Oak's lab. That covers naming, Oak stopping the player, choosing the starter, the rival's pick and the rival's challenge. It stops at 11 boundaries: overworld engine entry and loop, battle engine entry, start menu, soft reset, the later Pallet Town script, and every lab script after the rival battle starts (end of battle, rival leaving, Pokédex). The battle itself is not in this slice.

## Known limits

- A routine's size runs from its label to the next global label in the same section. Data that sits between two routines counts toward the first one.
- Checked end to end: the self-test, one predef routine, and one title routine with inline data. A test in `lab/tests/test_pokered.py` covers each of the four fixes.
- Routines whose original body uses `INCLUDE`, `DEF`, `MACRO` or `REPT` still LINT_FAIL on the original source (17 in the interaction slice, 7 in the title slice). They need a per-routine allowance.
- Fallthrough between labels (one label running into the next with no jump) isn't an edge. Neither is any target computed at runtime. A runtime trace would close both.
