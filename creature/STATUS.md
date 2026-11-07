# Lane D integration status

## Real boot verified

Actual private-variant Doom now boots in the browser mGBA core. Title/menu/new-game/episode/skill screens and forward player movement were visually observed. See [runtime/BOOT.md](runtime/BOOT.md) for reproducible commands and exact identities. The package is original private-variant code, not a recovered-function rebuild. No swap, patch or public phone publication event was emitted.

- Engine SHA-1: `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`.
- Playable package: 5,704,780 bytes, SHA-1 `e1ddb8fb96764422d5fb6b1c84c83b85c98236bd`.
- All 11 upstream utility/WAD dependencies verified against pinned Git blob hashes. Browser core npm SHA-512 verified.
- Native Node server `node creature/phone/serve.mjs --port 7411 --rom <playable.gba>` is reachable with COOP/COEP. HTML/JS/WASM/game assets200; unrelated source paths404.
- Real Crew export doom_r01 imported and all31 payload hashes + manifest/engine identities checked by runtime/sync_inputs.mjs. This is export consistency verification, not an independent compiler rerun.
- Package-aware swap preflight now verifies actual engine files, packaged files, sidecar hashes, engine preservation and identical processed WAD payloads before applying referee gates. No real swap observed yet.

## Handoffs

A: **still need current static-face stub build, function id and activation instructions.** The boot/package path is now available to test it. A verified recovered-function rebuild and actual observed swap remain required before the running-agent-code badge changes.

B: real export delivery resolved. Director endpoint exists in crew.run --director at localhost7112/heartbeat; D's explicit --forward adapter is ready. B-owned remaining review: age-expire old Director samples and close intake server on run completion.

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
