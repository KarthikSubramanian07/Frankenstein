# Lane A handoffs

Owner: Eddy (Lane A, `lab/`). Updated 12:35. Requests to Lane A arrive in other lanes' `HANDOFFS.md` files and on issues; answers are here and on issue #1. Newest first inside each section.

## Responses to D (Creature), from `creature/HANDOFFS.md` and issue #2

1. **Static-face stub: delivered (12:45).** `python3 -m lab.demo.build_demo_roms` writes `lab/out/static_face.gba`: the face-state function `fn_0801B298` is replaced by a 44-byte stub that shows a random face frame every tick, so the face flickers like static (display rule: "code we haven't recovered yet shows as static"). `changed_functions` is exactly `["fn_0801B298"]`, SHA-1 `752c61e5…`. The "face restored" ROM is `lab/out/target.gba` (SHA-1 `d936259b…`), or a `rebuild` once the crew recovers `fn_0801B298`. Details, packaging and the on-stage wording: `lab/demo/README.md`. Not booted yet: please package both with the WAD and confirm the face flickers on one and is normal on the other.
2. **WAD packaging and boot (Windows).** GbaWadUtil.exe ships in the upstream repo's `GbaWadUtil/` folder (doomhack/GBADoom, with its Qt DLLs and `data\dgguspat\`). From that folder:
   `GbaWadUtil.exe -in DOOM1.WAD -rom <repo>\lab\out\target.gba -romout doom_variant.gba -gus data\dgguspat\timidity.cfg`
   Use the shareware `DOOM1.WAD`. The same command works on `lab\out\rebuilt.gba` and `lab\out\patched.gba`. Anything after the IWAD header is replaced, so a ROM can be re-packaged with another WAD.
3. Received.
4. **rebuild and patch usage.** See issue #1 (11:52 comment) and `lab/README.md`. A rebuild must report `identical: true`. A patch never matches the original hash by design; its proof is `changed_functions == [the fixed function]`.
5. **Save states.** An identical rebuild is the same bytes, so any save state works. A patch is written in place: every function keeps its address, and the patch may not add globals (`patch` refuses `.data`/`.bss`), so RAM layout is unchanged and save states stay compatible. The one unsafe moment is saving while the CPU is inside the patched function. Swap at a frame boundary (vblank) and it can't be.
6. **Licensing.** The engine ROM is GPL-2.0-or-later (GBADoom); our variant's source is offered (see `lab/out/NOTICE.md`, `variant.patch` published after judging). The shareware WAD may be redistributed only unmodified, and GbaWadUtil converts it, so a public download of the packaged ROM is a grey area. Lane A's recommendation: phones load it during judging only, the credits card names id Software, prBoom and doomhack, and we take the link down afterwards. Karthik decides.

## Notices to all lanes

- **13:05, real rebuild:** `python3 -m lab.referee rebuild --recovered crew/exports/doom_r01/recovered` gives `identical: true` for all 28 crew recoveries, with `pct_agent_code` 0.25 (they're small functions). To C and D: don't headline the badge as a byte percentage yet. Show "28 functions recovered, ROM identical" or the hud subsystem's share, and switch to the byte percentage once big functions land.
- **13:05, stricter lint:** the referee now also lints the macro-expanded source (new rules L010 and L011; see `lab/LINT.md`). All 28 `doom_r01` recoveries still MATCH. To B: if a Digger hits a new LINT_FAIL, the reason names the rule.

- `fn_` ids come from `lab/out/manifest.json`. Never hardcode an id without re-reading it.
- The referee, `rebuild` and `patch` run on any machine: `lab/setup_referee.sh`, then `python3 -m lab.referee serve` (127.0.0.1:7101).
- ASI:One agent: `agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0` (start ASI:One messages with the `@agent1q…` mention). "Recover" needs the crew jobs API on the same machine as the agent (Lane A's laptop for now).

## Requests from A

- **To B (Crew), six integration fixes:** `lab/INTEGRATION_CREW.md` lists six concrete fixes with file and line, found by checking the crew against the real referee (live probe: MATCH, PARTIAL and NO_COMPILE all parsed correctly). Most urgent: (1) one referee error stops `run.py` before `finish()`, so no `metrics.json`; (4) rebuilds never send `emit`, so the Stage never gets `build.rom`; (5) the prompt must say "non-static" and stop hardcoding Thumb (34 game functions are ARM).

- **To B (Crew):** tell us here or in `crew/HANDOFFS.md` which machine runs the demo crew, so the ASI:One agent's "Recover" can reach `/jobs`. Please confirm the crew calls `lab.referee` (devkitARM GCC 16.1.0 at `-O3`) for every real run, not the bench referee.
- **To D (Creature):** boot `lab/out/target.gba` packaged with the shareware WAD and play for 30 seconds. Nobody has run the variant yet. Report the result in `creature/STATUS.md`.
