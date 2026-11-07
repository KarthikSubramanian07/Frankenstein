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
- 2026-11-07 11:28 (team rule): coordinate through GitHub, never direct connections (no hotspot sharing, no tunnels, no LAN IPs). Each lane runs its own referee on localhost: `lab/setup_referee.sh` rebuilds the target from GitHub sources, verifies it equals the committed manifest (it reproduces `lab/out` byte for byte), and starts the container; then `python3 -m lab.referee serve` (binds 127.0.0.1:7101). Status and handoffs go in commits, `DECISIONS.md`, and GitHub issues.

## 2026-11-07 11:40 · Sponsors are load-bearing, not logos (framing and build)

The product cannot run without each partner. Every pitch line, screen, README and submission block says so, and the build makes it true:

- **Meta Model API (Muse Spark 1.3 + Muse Wonder 1.0): the hands.** Every line of recovered C is written by Muse. Diggers start on Spark (tool-calling loop with the referee as a tool); Snap-directed escalation hands stubborn functions to Wonder; the Distiller (idioms) and the Archivist's names are Muse too. Metrics carry a per-model `muse.by_model` block (calls, cost) and matches per model. No Muse, no code.
- **Subquadratic (SubQ Snap 1.1, Decisions API, 384K context): the judgment.** The only model that reads the whole game at once and returns calibrated decisions. (1) *Triage*: one whole-program pass scores every function's difficulty with callees in view; the scheduler's order and each function's attempt budget come from it. (2) *Escalate or quit*: after every failed attempt Snap decides keep / escalate to Wonder / abandon, so Muse dollars go where they convert. (3) *Fakematch gate*: every byte MATCH also needs Snap's low fakematch and recital probabilities before the Checker accepts it. Measured honestly: held-out run with Snap on vs off (same model, same budget): matches, attempts per match, cost per match. `subq-preview` (long-context generation) powers the Cartographer if the Subquadratic table grants early access; until then the Cartographer is not claimed.
- **Fetch.ai (Agentverse + ASI:One): the front door.** Anyone verifies or requests a recovery inside an ASI:One chat; the Excavator calls the crew jobs API (`crew.serve`, port 7111) and asks the Referee agent before it reports success.
- **MongoDB Atlas: the memory.** The idiom library (what makes run N+1 faster) and the system of record for every attempt and verdict. Local-JSON fallback exists only for offline dev; demo runs use Atlas.
- **Gemini (credits only):** optional second-opinion Checker; never on the critical path.

Language choice: Python stays. Model calls take seconds and a referee check 0.1 to 0.2 s; our own code is microseconds of glue, so Rust/Zig/Go/Elixir would add rewrite time and no measurable latency. Latency work instead: parallel Diggers, cache-friendly stable prompt prefixes, effort ladder (medium for easy functions, escalate on failure), verdict cache by source hash, naming and idiom extraction off the critical path, 8 s timeouts on Snap decisions.

Bench (Lane B, 11:39): `crew/bench/` is a real-compiler benchmark (20 original functions, arm-none-eabi-gcc 16.2.0 -O2) for measuring the crew before and alongside GBADoom. Bench numbers are always labelled "bench", never presented as Doom results. Bench referee runs on port 7121 (7111 is the crew jobs API).

## 2026-11-07 11:41 · Lane A

- 2026-11-07 11:41 (A): **the target is now the private variant** (SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`). 11 body-only edits: 5 in `st_stuff.c` (reversed independent loops, reordered independent stores, swapped pure `&&`/`||` operands), 6 operand swaps in `p_pspr.c`. Code changed in `ST_Ticker`, `ST_updateFaceWidget`, `P_WeaponCycleUp/Down`, `P_CheckCanSwitchWeapon`, `A_WeaponReady` and others. **All fn_ ids were regenerated** (sizes changed, so addresses shifted); always read ids from `lab/out/manifest.json`. The variant source stays on Lane A's machine. Everyone else judges against the committed `lab/out/target/<fn>.json` (anonymized instructions and relocation keys), so `lab/setup_referee.sh` now only starts the Docker container; no GBADoom clone or build. Not yet play-tested (no WAD or emulator on Lane A); Lane D, please boot the variant once the rebuild exists.
- 2026-11-07 11:41 (A): referee fixes. A `bl` to a static function in the same file has no relocation, so its bytes depend on layout; both sides now compare it as "calls fn_X", so standalone candidates can match those calls (they never could before). Division and float helpers (`__aeabi_idiv` and friends) are compared by name, which candidates also use. `flatCacheLump` is IWRAM data, now classified as data (568 game functions, 170 heldout).
- 2026-11-07 11:44 (A): memory probe ready (`python3 -m lab.memory_probe`), waiting on a Meta API key in Lane A's `.env`. Measured so far: under the referee's comparison the variant changes only 4 of 36 functions in `st_stuff.c` and `p_pspr.c` (face, weapon-ready, can-switch, switch-weapon); the other edits normalize away. Plan: measure unmodified recall first. If it is near zero, that number answers "did it just remember Doom?" and the variant stays as is; if it is high, widen the variant before the crew's demo runs. The probe reports all 20 functions plus the variant-changed subset separately.
- 2026-11-07 11:48 (B, contract v1.1 additive): new event type `snap.decision` {op: triage|decide_next|review|director|eyes|route, latency_ms, ...}. Every SubQ Snap call that changes what the crew does is visible in the stream; the Stage may show them. Fixtures include them.
- 2026-11-07 11:48 (B): bench result `runs/bench_r01` (bench, not Doom): 14 of 14 train functions matched, 12 on the first attempt, 80 s, $0.29 of Muse Spark, 0 false claims, 24 idioms learned. Bench is -O2 with small functions; GBADoom will be harder.

- 2026-11-07 11:49 (A): `rebuild` and `patch` are real, ahead of the 14:30 gate. **rebuild** (`method: "object-splice"`, added to the contract enum): the referee re-checks every `runs/<run>/recovered/fn_*.c` (must MATCH), writes the agents' own compiled bytes into the ROM, keeps linked addresses only at relocation sites the referee proved identical, and reports `identical` by SHA-1 plus `pct_agent_code`; `--emit` appends `build.rom` to `runs/live/events.jsonl`. **patch**: compiles the fixed function, links it with `ld` at its real address (ids resolve to addresses through typed Thumb symbols, so calls are direct `bl`s), writes it in place, and lists every changed game function. Proof: relinking unchanged C reproduces the ROM with 0 differing bytes; changing one constant changes exactly one byte. The fix must fit in the original function's bytes, because GbaWadUtil appends the WAD right after the ROM. Thumb ROM functions only (not IWRAM). The engine ROM `lab/out/target.gba` (no WAD) and `lab/out/link_info.json` are now committed so `patch` works on any machine; GPL source offer in `lab/out/NOTICE.md`.

## 2026-11-07 11:52 · Site

- 2026-11-07 11:52 (site): site/ is the public landing page (owned by whoever is free; Lane C owns the Stage). Live at https://tryfrankenstein.pages.dev (the name `frankenstein` gave a suffixed subdomain, so the Pages project is `tryfrankenstein`). `.github/workflows/pages.yml` deploys it on pushes to main that touch `site/**`, once the `CLOUDFLARE_API_TOKEN` repo secret exists.

## 2026-11-07 12:12 · Framing (supersedes 11:58): lost games, rebuilt and proven

The product is video game preservation, exactly as the kit says. A crew of coding agents rebuilds a game's lost source code from the only thing that survives, the compiled game, and nothing goes in unless a compiler proves it byte for byte. Then the game can be fixed again. The stakes: 87% of classic US games are critically endangered (VGHF and SPN, 2023), and for most the source code is gone. Doom is our first patient, chosen because it is famous and we can check every answer against hidden source. The wider picture ("anywhere the only thing left is the compiled program") is one closing sentence on the New Game+ beat, never the lead. Lines to reuse: "Lost games, rebuilt and proven." "Victor Frankenstein never checked his work. Ours checks everything." "Games don't have to die." First users: preservation groups and rights holders; we only work on software we're allowed to.
Repo About: "Lost games, rebuilt and proven. 87% of classic games are endangered, and for most the source code is gone. Frankenstein's coding agents rebuild a game's code from the cartridge itself, and a compiler accepts only byte-identical pieces. Doom is our first patient. Games don't have to die."
- 2026-11-07 11:57 (B): SubQ Snap router (natural language to functions, from asm only), measured against the hidden map in an evaluation script outside the crew: hud precision@10 = 1/10 (random 0.2), weapons 4/10 (random 0.55). Muse-written asm cues plus Snap re-ranking did not help (weapons 4/10, hud 1/10) and added 16 s, so it is not used. Ranking contiguous address windows did worse (0/10). Status: useful hint, labelled inferred, never presented as precise.
- 2026-11-07 12:00 (B, contract v1.1 relaxation): `crew_status.live_run_id` and `names[].name` may be null (no live run yet / not named yet). Found by the crew API tests.
- 2026-11-07 12:01 (A): Fetch.ai agent live: **Frankenstein Referee**, `agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0`, Agent Chat Protocol manifest published, Almanac API registration done (on-chain contract registration skipped, it needs funds and is not required). Runs on Lane A's laptop via `lab/agents/run_agent.sh` (mailbox mode, no inbound connections). One agent with six chat intents instead of three agents; "recover" calls the crew jobs API and re-verifies with the referee before answering. Mailbox still needs creating once in the Agentverse inspector (Eddy's login).
- 2026-11-07 12:01 (A): added `.gitattributes` with `DECISIONS.md merge=union`, so concurrent appends merge automatically instead of conflicting (it happened four times this morning). Keep each entry a self-contained block.
- 2026-11-07 12:14 (A): Agentverse mailbox connected with an API key (`python3 -m lab.agents.connect_mailbox`), no credits needed; the browser inspector could not reach localhost. Agent `agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0` is registered as a mailbox agent and reachable from ASI:One.
- 2026-11-07 12:16 (B): habits must earn their place. Idioms start as candidates; while a library is learning, each one is credited or blamed by the outcome of the Digger it was given (quick match = matched within 2 attempts). Adopted after 3 uses at or above the library's quick-match baseline; retired after 4+ uses at 15 points below it, and never offered again. Frozen libraries (held-out runs) never judge, so evaluation never learns from its test set. New event type `idiom.judged` {idiom_id, status, tries, wins, rate, baseline} (contract v1.1 additive; fixtures include it).
- 2026-11-07 12:00 (B): live latencies measured on SubQ Snap: Play-to-recover director 2.4 s per steering decision (30 heartbeats, 3 picks, confidence 0.83, no frame); eyes 0.68 s for a two-frame behaviour check (p 0.999 changed as claimed, 0.996 otherwise same); router 3.5 to 6.1 s over all 568 game functions.
- 2026-11-07 12:06 (B): first real Doom run `doom_r01` (train, 30 smallest thumb functions <= 120 bytes; some are trivial): 28 of 30 matched through Lane A's real referee, 1.29 attempts per match, 268 s, $0.73 of Muse (103 Spark calls, 11 Wonder calls after Snap escalations) + $0.06 of SubQ Snap (37 calls, 842 ms mean), 0 false claims, 0 fakes, 38 idioms learned.
- 2026-11-07 12:20 (B, contract v1.1 additive): sections 7c and 7d. Lane D's tap posts real heartbeats and frames to the crew director on 127.0.0.1:7112 (`POST /heartbeat`), and finished runs are published to `crew/exports/<run_id>/` with an `EXPORT.json` identity record (answers Lane D requests 2 and 3 in `creature/HANDOFFS.md`). First exports: `doom_r01` (real Doom) and `bench_r01` (bench).
- 2026-11-07 12:20 (B): the face. `fn_0801B298` (1,164 bytes, thumb, held-out) is the face function after the variant regenerated ids. SubQ Snap's router ranked it #1 for "Doomguy's face in the status bar" (p 0.88), confirmed only afterwards against the hidden map in an evaluation script. The crew is attempting it now (`doom_face01`, $3 cap).

