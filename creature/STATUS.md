# Lane D integration status

## Product direction from Enzo: QR-first portable play

Judges scan a real QR and immediately play on their phones. Doom is today's supported demonstration; the north star is selecting an old game and adapting it to another device/interface. Explore (1) a genuinely local model proposing fully human-editable control mappings and (2) generated visual continuation into extra display area. Phone play is a demo requirement. These adaptation experiments are not yet implemented. Read [EXPERIENCE_IDEA.md](EXPERIENCE_IDEA.md) and respond through [issue #3](https://github.com/KarthikSubramanian07/Frankenstein/issues/3).

## Real boot verified

Actual private-variant Doom now boots in the browser mGBA core. Title/menu/new-game/episode/skill screens and forward player movement were visually observed. See [runtime/BOOT.md](runtime/BOOT.md) for reproducible commands and exact identities. The package is original private-variant code, not a recovered-function rebuild. No swap, patch or public phone publication event was emitted.

- Engine SHA-1: `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`.
- Playable package: 5,704,780 bytes, SHA-1 `e1ddb8fb96764422d5fb6b1c84c83b85c98236bd`.
- All 11 upstream utility/WAD dependencies verified against pinned Git blob hashes. Browser core npm SHA-512 verified.
- Native Node server `node creature/phone/serve.mjs --port 7411 --rom <playable.gba>` is reachable with COOP/COEP. HTML/JS/WASM/game assets200; unrelated source paths404.
- Real Crew export doom_r01 imported and all31 payload hashes + manifest/engine identities checked by runtime/sync_inputs.mjs. This is export consistency verification, not an independent compiler rerun.
- Package-aware swap preflight now verifies actual engine files, packaged files, sidecar hashes, engine preservation and identical processed WAD payloads before applying referee gates. No real swap observed yet.

## Handoffs

A: static-face source/build instructions received in lab/demo/README.md (fn_0801B298). Received committed lab/out/static_face.gba and lab/demo/static_face_report.json in9a45076. Static engine SHA-1 is752c61e50fc1255e301e8efa4011082bf380c3e2; its runtime behavior still needs testing. A verified recovered-function rebuild and actual observed swap remain required before the running-agent-code badge changes.

B: real export delivery resolved. Director endpoint exists in crew.run --director at localhost7112/heartbeat; D's explicit --forward adapter is ready. B handoff reports 12-second stale-sample expiry and listener shutdown implemented; received.

C: geometry/routes/ending handoff resolved through stage/HANDOFF_D.md. Exact Split rectangle x20/y92,960x640; credits route ending&page=credits. Updated OBS instructions in obs/RUN_OF_SHOW.md.

## Active coordination

Root integrates and publishes small creature-only checkpoints, checking latest main around each. Luna coordinator supervises active agents roughly once/minute while this session runs; this is not an unattended background service. WORKPLAN.md preserves ownership; issue#2 carries requests; EXPERIENCE_IDEA.md preserves Enzo's SubQ extension proposal.

## Verification limits

Desktop mGBA/Lua tap, live socket bridge, actual recovered-code swap, static-face recovery cycle, OBS capture/export, iOS/Android and multi-phone checks remain unverified. Browser boot/menu/input checks are real and separate from those claims. No public ROM distribution or QR success claimed. The Node serving alternative solved local browser preview; Python shell socket and Git/npm networking limitations remain.

## Entry points

- Bridge: python -m creature.bridge --help
- Director adapter: python -m creature.bridge.director_adapter --help (default inspection; --forward only to an already budgeted local Crew run)
- Overlay: python creature/overlay/serve.py
- Package setup and boot: runtime/BOOT.md
- Swap checks: runtime/PACKAGE_SWAP.md
- Phone setup: phone/README.md
- Recording: obs/RUN_OF_SHOW.md

## Host availability update

The connected Windows environment became unavailable during the desktop ROM-open action. Desktop boot and Lua telemetry remain unverified. All source checkpoints and browser boot/package evidence notes are committed. Real static-face playtest, live tap and swap require the host connection to return. Browser screenshot was saved on that host at creature/shots/browser-boot.jpg before disconnection.

Finale path chosen: honest visible modification rather than an unconfirmed original bug. A/B still need to nominate an accepted function and verify the patch; do not present this as completed.

## Latest incoming review / requested next target

Received Stage's sponsor judgment rail and Versus evidence polish, Crew's library_backend events and Atlas library updates, current A/B handoffs and experiment caveats, and Lane A's new static-face artifacts/integration audit. B reports fn_0801B298 out of reach today; face recovery must not be claimed. A's audit queues a distinct restore preflight mode, consistent music-bank packaging, baseline manifest validation and continuous target/static playtests; these are pending work, not fixed by this documentation checkpoint.

After a good Doom demo, Enzo requests the Pokémon Red opening/menu + first-interaction slice with a genuine geographic/progression coverage map. Brief: POKEMON_RED_PLAN.md; A and B have direct task files and handoff entries; issue#4 tracks the request. Visited, behavior-validated and code-verified coverage stay separate. Pokémon implementation has not started.
