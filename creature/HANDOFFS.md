# Lane D handoffs

## New follow-on target from Enzo: Pokémon Red

After a good Doom demo, add a bounded Pokémon Red opening slice: landing/title menu plus first Pokémon interactions. Show a real geographic map with attached interaction branches beside gameplay, with visited/validated/code-verified progress kept distinct. See [POKEMON_RED_PLAN.md](POKEMON_RED_PLAN.md) and [issue #4](https://github.com/KarthikSubramanian07/Frankenstein/issues/4). A/B task briefs and direct requests were added to their folders at Enzo's instruction.

Latest upstream received: Stage sponsor judgment rail and clearer Versus evidence; run.started.library_backend; Atlas library updates; Crew says the large face function is out of reach today. Finish Doom's smaller-HUD/phone proof before starting Pokémon runtime work. A's Game Boy architecture/rights feasibility questions remain explicit planning gates.

## Product direction from Enzo: QR-first portable play

Judges scan a real QR and immediately play on their phones. Doom is today's supported demonstration; the north star is selecting an old game and adapting it to another device/interface. Explore (1) a genuinely local model proposing fully human-editable control mappings and (2) generated visual continuation into extra display area. Phone play is a demo requirement. These adaptation experiments are not yet implemented. Read [EXPERIENCE_IDEA.md](EXPERIENCE_IDEA.md) and respond through [issue #3](https://github.com/KarthikSubramanian07/Frankenstein/issues/3).

Owner: Enzo. Latest coordination protocol in CLAUDE.md received: check main and other lanes' handoffs at least every10 minutes during active work, publish checkpoints at least every20 minutes. Connector commits are serialized while shell Git is unavailable. See STATUS.md and runtime/BOOT.md for current proof.

## Responses to A

1. **Boot the private variant:** passed basic browser checks. Packaged engine SHA-1 d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2 with the pinned upstream utility/shareware WAD. Package5,704,780 bytes; SHA-1 e1ddb8fb96764422d5fb6b1c84c83b85c98236bd. Title, New Game, episode/skill menus, in-level rendering and forward movement were visually observed. A continuous30-second active play test is still pending.
2. **Static-face delivery:** received lab/demo/README.md, build script and current face fn_0801B298. Other ids received: ticker fn_0801B728, drawer fn_0801B7FC. The current main tree has source/build script but no lab/out/static_face.gba; see request below.
3. **Packaging/save states:** received A's instructions. D's runtime/package_rom.py now validates the full packaged file, preserved engine bytes and processed WAD. prepare_swap.py independently checks engine/package/proof chains and identical WAD payload before referee gates; actual save-state swap remains unverified.
4. **Distribution:** no public ROM URL/QR emitted. Localhost browser only. Karthik's distribution decision remains required before hosting processed WAD publicly.

## Responses to B

1. **Real export:** received doom_r01 and verified all31 exported file hashes plus manifest/target identity. runtime/sync_inputs.mjs makes that repeatable from a pinned commit. This verifies export consistency, not an independent referee rerun.
2. **Telemetry:** bridge/director_adapter.py targets the real crew.run --director endpoint :7112/heartbeat. It forwards only fresh observed ids and optional screenshot bytes; inspect-only by default. Local bridge/Lua end-to-end still needs the connected demo host.
3. **Heartbeat aging/lifecycle:** B's handoff says stale samples now expire after12s and intake port closes when run ends; received.
4. **Eyes:** received crew.eyes command. Will use on real before/after frames; no synthesized visual judgment is claimed.
5. **Face recovery/finale:** face attempt status received (early attempts far off); keep the smaller-HUD fallback under consideration. Static-face display stub alone must not be presented as recovered source.

## Responses to C

1. Routes and exact Split x20/y92,960x640 received from stage/HANDOFF_D.md. OBS instructions updated.
2. Actual ending credits scene is primary; standalone D endcard is fallback. Badge must remain original code until a real rom.swapped.
3. No phone.published event or fake QR supplied. Public/physical phone play is not yet verified.

## Requests from D

- **To A:** publish an approved GitHub-accessible static-face engine binary and its complete patch report/hash, or document the exact existing artifact reference. Build source is received, but D's Windows computer disconnected before desktop/Lua testing and cannot currently run the container build. Target fn_0801B298 must be the only modified function.
- **To A+B:** propose one already accepted recovered Thumb-ROM function for a visible single-function modification that fits its original byte span. We select the honest modification finale, not a claim about an unconfirmed original bug. Candidate/patch still unverified.
- **To C / product launcher owner:** Node player alternative is now committed as creature/phone/serve.mjs; accepts --port and --rom, binds localhost with isolation headers. Existing Python host remains supported. Current browser validation used port7411 because the shell's7401 listener was stalled; this is a local test override, no shared-port contract change.

## Current blocker / next action

Connected Windows environment became unavailable during desktop ROM-open action. No current desktop boot or Lua success is claimed. Resume host connection, package static-face engine, verify flicker vs normal face, run real telemetry through the bridge/Director, then test a verified source rebuild/swap. Browser boot evidence was saved locally as creature/shots/browser-boot.jpg before disconnection. Runtime/vendor, generated packages and core binaries stay ignored.
