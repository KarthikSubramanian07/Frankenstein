# Integration audit: Creature (Lane D) against Lab (Lane A)

Lane A, 2026-11-07, before the 14:55 freeze. Everything below was checked against Lab's real outputs on Lane A's machine, not fixtures. Commands run:

    python3 -m lab.referee rebuild --recovered crew/exports/doom_r01/recovered
    python3 -m lab.referee patch --fn fn_0801B298 --src lab/demo/static_face.c
    python3 creature/runtime/prepare_swap.py ...   (5 combinations, outputs in /tmp)

Real outputs right now:

| File | SHA-1 | Notes |
|---|---|---|
| `lab/out/target.gba` | `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2` | engine only, 1,403,776 bytes, IWAD header at 1,403,744 |
| `lab/out/rebuilt.gba` | `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2` | `identical: true`, 28 recovered, `pct_agent_code` 0.25 |
| `lab/out/static_face.gba` = `lab/out/patched.gba` | `752c61e50fc1255e301e8efa4011082bf380c3e2` | `changed_functions: ["fn_0801B298"]`, 44 of 1164 bytes |

The rebuild report has `rom_sha1`, `original_sha1`, `identical`. The patch report has `rom_sha1` and `changed_functions` but no `original_sha1`.

## Requests to Lane D

1. **Fix the hero swap, which preflight currently rejects.** `creature/runtime/prepare_swap.py:89-100` handles target→rebuilt (rebuild) and target→static_face (patch), and both pass. Static_face→restored, the face-comes-back moment in `creature/obs/RUN_OF_SHOW.md:37`, fails in both modes. As a rebuild it fails with "rebuild must be byte-identical to the playable baseline", and as a patch with "patch must report exactly one changed function". Add a third mode, `--mode restore`, that takes two reports. `--baseline-report` is the patch report: its `rom_sha1` must equal the baseline engine and `changed_functions` must have length 1. `--report` is the rebuild report: `identical: true` and `rom_sha1` equal to the candidate engine. Keep the package/WAD checks. If that can't land by 14:55, run the hero moment as a ROM reopen at a menu and label it that way, as `runtime/README.md:11` already allows.
2. **Pass `--gus` the same way for every package.** `creature/runtime/package_rom.py:84,103` makes `-gus` optional and `creature/runtime/BOOT.md:28` says to omit it. The Lab command and `lab/demo/README.md` include `-gus data\dgguspat\timidity.cfg`. A package built with the music bank and one built without it have different processed-WAD payloads, so `prepare_swap.py:78` will reject the swap. Pick one setting (with `--gus` gets you music) and use it for target, static_face, rebuilt and patched.
3. **Don't say "real face recovery" until it is real.** `creature/obs/RUN_OF_SHOW.md:40`: `fn_0801B298` is **not** among the 28 functions recovered in `doom_r01`. The "restored" face today is the original ROM (`target.gba`, which `rebuild` reproduces byte for byte). Say "the face comes back when the agents recover this function" (wording in `lab/demo/README.md`), and only say it was recovered after a rebuild whose recovered set includes `fn_0801B298`.
4. **Update the stale line in `creature/runtime/README.md:9`.** It says Lane A must supply a playable-file hash or a separate engine/package path. That is already solved by D's own packaged mode (`PACKAGE_SWAP.md`). Point to that instead.
5. **Patch mode should check the baseline against the manifest.** `creature/runtime/prepare_swap.py:93-100` never checks that the patch baseline is the original engine, and the patch report has no `original_sha1` (Lab will add one, see below). Until then, compare the baseline engine SHA-1 to `lab/out/manifest.json` `game.rom_sha1`.
6. **Copy the manual GbaWadUtil command into `creature/runtime/BOOT.md`** as a fallback in case `package_rom.py` can't run on the demo host:
   `GbaWadUtil.exe -in DOOM1.WAD -rom <repo>\lab\out\<rom>.gba -romout <out>.gba -gus data\dgguspat\timidity.cfg` (run from the upstream `GbaWadUtil\` folder).
7. **Finish Lab's open request:** play the packaged `target.gba` for 30 seconds continuously (`creature/HANDOFFS.md:7` says it's still pending), then do the same with static_face, and record in `creature/STATUS.md` whether the face flickers.

## Requests D made that Lab still owes

| D request | Status | Suggested answer |
|---|---|---|
| `creature/HANDOFFS.md:28`: publish the static-face binary and its full patch report and hash on GitHub | **Owed.** `.gitignore:19` ignores `*.gba` except `target.gba`, so `static_face.gba` never reaches main, and D's Windows host can't run the container. | Add `!lab/out/static_face.gba` to `.gitignore` and commit the ROM (1.4 MB, the same GPL engine as `target.gba`), plus `lab/out/static_face.patch.json` = the patch report above. Full SHA-1 `752c61e50fc1255e301e8efa4011082bf380c3e2`. Commit `lab/out/rebuild.json` too, so D has both reports `prepare_swap.py` needs. |
| `creature/HANDOFFS.md:29` (to A+B): pick one accepted recovered Thumb-ROM function for a visible single-function change | **Owed.** | Honest answer: none of the 26 Thumb-ROM recoveries in `doom_r01` would change anything visibly. The largest is 48 bytes, and almost all are flag setters in the world group. The best candidate is `fn_0800FDFC` (30 bytes, an approximate-distance helper), but any change to it would be subtle and not something you could read on screen. Recommendation: the finale should be the static-face patch itself (a real referee-verified in-place patch, one function, hand-written display code, labelled as such), or wait for the crew to recover a larger HUD function. |
| `creature/WORKPLAN.md:25`: WAD-packaging command, how to get the WAD, face function and stub activation, state compatibility | Answered in `lab/HANDOFFS.md` items 1, 2 and 5 and in `lab/demo/README.md`. | None needed. |
| `creature/runtime/README.md:9`: playable hash or package path | D solved this itself (packaged mode). | None needed, see request 4. |

Lab-side follow-up: add `original_sha1` to the `patch` JSON (`lab/referee/romlink.py`) so D's preflight can tie a patch to its baseline.

## Works

- **Paths and fields.** The bridge (`creature/bridge/server.py:18-20,243-244`) reads `manifest.functions[].{id,addr,size,scope}` and `viz_map.subsystems[].{id,functions}`, and every one of those fields exists. The viz ids are `hud`, `weapons`, `enemies` and `world`, which match the overlay. `addr` parses with `int(x, 0)`.
- **Pinned export.** `creature/runtime/sync_inputs.mjs:31-42` checks hold against the current repo: `EXPORT.json manifest_sha1` = `a6ff9e7e…` = SHA-1 of the current `manifest.json`, and `target_rom_sha1` = `manifest.game.rom_sha1` = `target.gba`.
- **Rebuild preflight.** `prepare_swap.py --mode rebuild` with target→rebuilt and the real rebuild report passes.
- **Patch preflight.** `prepare_swap.py --mode patch --state-compatible` with target→static_face and the real patch report passes. Without `--state-compatible` it refuses, as designed.
- **Package layout.** All four Lab engines (target, rebuilt, patched, static_face) pass `package_rom.header_offset`. Each is engine-only with the same header offset (1,403,744), so packaged mode's layout check will hold. Packaged mode itself wasn't run here because it needs `GbaWadUtil.exe` on Windows.
- **Face function.** D knows the face function is `fn_0801B298` and that `static_face.gba` is the hero ROM (`creature/HANDOFFS.md:8`), and correctly doesn't hardcode the id in code. Ticker `fn_0801B728` and drawer `fn_0801B7FC` exist in the manifest.
- **Address stability.** A patch is in place, so PC→function mapping in the bridge stays valid across the swap.
- **Phone page.** Correctly refuses an engine-only ROM (`creature/phone/README.md:18`) and serves one explicit `--rom`.
