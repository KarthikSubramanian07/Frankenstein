# DECISIONS

A dated log. Every assumption, contradiction, and partner-prize answer goes here, one line each. Newest at the bottom.

## Corrections to the kit (2026-11-07, foundation, from the pre-hack audit). These override `docs/`.

**Clock (from `tools/hackclock.py`, judged live, and `docs/PLAYBOOK_LESSONS.md`).** Hacking 10:45 to 17:00 (6 h 15 min). **Freeze 14:55.** Record the video 16:10. Submit 16:30. Run `make clock` for the schedule; the repo's `.claude/settings.json` injects the current phase into every Claude Code prompt.

| Time | Phase / gate | If it fails |
|---|---|---|
| 10:45 to 11:20 | SPIKES. A: GBADoom builds and boots, then builds without LTO; one `st_stuff.c` function matched by hand. B: Muse Spark tries 5 small functions; count matches. D: emulator page plus QR on a public URL. A: an Agentverse agent answers in ASI:One | |
| **11:20** | **Go / no-go.** | No devkitARM build: devkitPro Docker image. No matches at `-O3`: rebuild at `-O2`. Muse 0 of 5: Muse keeps the Checker, naming and ASI:One; another model writes first attempts and metrics report per-model counts. ASI:One silent by 12:20: drop Fetch.ai |
| 11:20 to 12:20 | SKELETON. The whole demo path on hardcoded data: static face, one green function, face returns, game on a phone. In parallel: restructure the target functions, rebuild, play 30 s. Run the memory probe on both builds | |
| 12:20 to 14:55 | BUILD in 38-minute timeboxes: live Digger loop, Checker, idiom library with held-out check, face rebuild, the bug hunt (**decided by 13:00**), ASI:One workflow. Lunch at 13:00 is the hero run | Ask "can we demo right now?" every 38 min |
| **14:55** | **FREEZE.** No features. Start the long run over all target functions and save its numbers. Repo public, README built-today split, reset script | Cut per the cut list |
| 14:55 to 16:10 | Harden and write: fresh-state demo runs, submission text, pitch | |
| 16:10 | RECORD the 1-minute video of the real system | |
| 16:30 | SUBMIT after the disqualifier audit (repo public, video under 1 min and only today's work, all teammates added, ASI:One submission agent done) | |
| 16:30 to 17:00 | Rehearse three timed 3-minute run-throughs | |

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

**Settled conflicts with the gameplan (`docs/PLAYBOOK_LESSONS.md`).**
- Fetch.ai: one ASI:One agent must answer by 12:20 or the layer is dropped (the gameplan overrides the kit's "never cut"); Excavator and Curator are bonus.
- Models: Diggers start on `muse-spark-1.3`; escalate to `muse-wonder` (confirm the id with `GET /v1/models`) after 3 failed attempts. Gemini as a second-model Checker is optional. If Muse matches 0 of 5 at the 11:20 spike, another model writes first attempts and metrics report per-model counts.
- Hero shot: the static-face stub built into the ROM (an honest display rule: "code we haven't recovered yet shows as static") is the primary; the OBS heal overlay is a bonus.
- Scope: keep the existing contract tests, but add no more tests or CI outside the referee and crew core. SubQ Cartographer is back in scope (see the 11:10 prize update below).

## Seed decisions

- Target game: **GBADoom** (https://github.com/doomhack/GBADoom, prBoom port in C, GPL-2.0-or-later, Doom shareware IWAD). No commercial ROMs, ever. Fallbacks, only if GBADoom won't build by 11:45: Attack on Voxelburg, then Celeste Classic GBA. Owner: Lane A.
- Our repo is MIT and contains none of GBADoom's code or data. Prior work we brought: the planning kit in `docs/` and `tools/hackclock.py` (event clock). The answer key lives in gitignored `lab/secrets/`.
- Visual direction: "Frankenstein, the game" (five scenes) per `docs/02_DESIGN.md`.
- Partner prizes: Meta $5,000 (best use of the Meta Model API), Fetch.ai $2,500 1st and $2,500 2nd. Others: ask at kickoff and record here.
- Submission deadline: 17:00 Pacific; form at cerebralvalley.ai/e/aie-code-2026-hackathon/hackathon/submit. Judging weights round one: Technical Demo 35%, Implementation Difficulty 30%, Impact 20%, Creativity 15%.
- Never call the UI a dashboard ("a dashboard as the main feature" is banned). Lead with Doom running.
- Check the Doom shareware license before hosting the patched ROM publicly; fallback is venue network only or demo screen only.
- Fixtures: `metrics.sample.json` wraps three runs as `{"fixture": true, "runs": [...]}`. `make sample-runs` installs them as real-looking run dirs (`runs/fx01..fx03`, each marked `fixture: true`) for Stage and Creature development. The sample live run is about 11 minutes long (60 matched, 9 false claims, 3 lint fails).
- Added `contracts/tests/` (pytest) and `make test`. No CI or root frameworks, per Lane 0.

## 2026-11-07 11:10 · Prize update (Cerebral Valley blast, 10:54)

- Overall: 1st $3,000, 2nd $2,000, 3rd $1,000 (each plus Gemini API credits, Google DeepMind swag, $500 MongoDB credits).
- Best Use of Meta Model API: $5,000. Best Use of Fetch.ai: $2,500 1st, $2,500 2nd.
- **Best Use of Subquadratic: $5,000 + 5,000 credits 1st, $1,000 + 1,000 credits 2nd (new cash prize).**
- Consequence: the SubQ Cartographer (Lane B Step 4) is in scope again, right after the first real Digger match. It must be load-bearing and measured: run r04 (held-out, library on + cartographer) against r02 and report the difference honestly, plus the whole-program context size sent to SubQ. Get a SubQ key from the Subquadratic table now.
- Prize stack we target: Overall + Meta ($5k) + Fetch.ai ($2.5k) + Subquadratic ($5k). Gemini stays optional (credits only).

## 2026-11-07 11:20 · Lane A

- 2026-11-07 11:20 (A): T1 passes. devkitARM r68, GCC 16.1.0 in Docker (digest in `lab/TOOLCHAIN.md`), GBADoom @7763f5f minus `-flto=8`. Target SHA-1 `a6c18b5d4d0f7fb503423a7350a88237f43f2bb1`, 840 functions in the ELF. Static helpers inline at -O3, so the face code is one function (`ST_updateFaceWidget`, 1,160 bytes).
- 2026-11-07 11:18 (A): manifest is real. 796 functions: 569 game (171 heldout, seed 7, 3 of every 10 by size), 227 library (toolchain, libtimidity, C++ layer, .s). Subsystems: hud 12, weapons 31, enemies 66, world 460. Committed `lab/out/manifest.json`, `viz_map.json`, `asm/`, `ctx/` (GPL notice in `lab/out/NOTICE.md`); ROM and answer key stay ignored. Known gap: globals reached through literal pools show as raw `.word` addresses and are not yet listed in ctx headers.
- 2026-11-07 11:24 (A): referee is real. `python -m lab.referee serve` on Eddy's laptop, port 7101 (LAN address in the team channel). T2 passes: original source of 12 functions MATCH (including the 1,160-byte face function `fn_0801B34C`); a one-line edit gives PARTIAL at offset 22. Checks take 0.1 to 0.2 s. Relocations compare by anonymous id plus offset; result text is anonymized. `rebuild` and `patch` return 501 until 14:30.
- 2026-11-07 11:25 (A): Eddy's laptop is on a phone hotspot, so the referee at :7101 is not reachable from venue Wi-Fi. Either join the hotspot or use the tunnel URL Lane A posts (`cloudflared tunnel --url http://localhost:7101`). Until then, `python3 -m lab.referee mock serve` works anywhere.
