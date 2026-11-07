# Lane D integration status

Latest checkpoint: 2026-11-07, 13:59 Pacific. Source checkpoint `54dca9e` is on main; incoming Stage one-screen revision and later site changes were received through `50d9270`. No runtime recovery swap or public phone publication is claimed.

## Verified now

| Item | Evidence |
|---|---|
| Original variant boot | Title, menus and basic movement previously observed; engine SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`. A controlled continuous 30-second active-play check remains open. |
| Static-face package | 5,704,780 bytes; SHA-1 `337fbb15462b57eb6cc5a35bcf11e36646e130e2`. Current player reached New Game/episode/skill and gameplay. Movement, turn, fire and changing face expressions at full health observed. Game ran across checks for over 30 seconds; no continuous video recorded. Committed screenshot: `creature/shots/static-face-browser.jpg`. |
| Matching data | Original playable SHA-1 `e1ddb8fb96764422d5fb6b1c84c83b85c98236bd`. Both packages omit GUS; processed-WAD SHA-1 `628f0749251adbc059e3f15bd9b18bd403285ad3`. Packager verified actual engine preservation and payload structure. |
| Restore preflight | Third mode verifies baseline patch report, identical rebuild report, origins, actual hashes, one changed function and package/WAD chains. Python compilation and 19 synthetic protocol checks passed. No observed emulator swap. |
| Phone deployment bundle | Allowlisted Cloudflare Pages folder, isolation headers, truthful status and pinned notices. Real packaged game and all file hashes checked; waiting states and refusal cases passed. Judging service worker caches shell only; ROM/status stay network-only. Not deployed. |
| Stage | Frozen Vite build and TypeScript check passed. Eight of nine tests passed; remaining server test blocked by Windows symlink EPERM. No tracked Stage changes. Rebuilt the newer one-screen/card revision `1075572` too. |
| Stage services | Frontend 5173 supplies COOP/COEP. HTTP 7201 and websocket 7202; health reports live:null. Real Doom replay renders 28/568 with REPLAY · 8X. No live run invented. |
| Murmur | Official v0.2.3 checksum verified. Root AGENTS/CLAUDE discovery committed. Clone-local join/daemon and official MCP who/status/inbox calls worked. Real inbound message received from Lane A and remote agents visible. Outbound send explicitly failed in shell credential-manager; name pending and global registration blocked. See MURMUR.md. |

The static face is our hand-written display rule. `fn_0801B298` is absent from the 28-function recovered set. Restoring it must not be called face-source recovery.

## Remaining demo gates

1. **A: actual rebuild report.** Main still lacks `lab/out/rebuild.json`; the exported doom_r01 stream has no build.rom. Issue #2 requests real original/ROM hashes, identical, recovered set and percentage. Do not manufacture a report from a documentation table.
2. **Runtime finale.** After the report arrives, run production restore preflight, establish state compatibility, load generated Lua in mGBA and observe state/game/controls before any rom.swapped. Label ROM reopen/restart honestly if used instead.
3. **C/D browser composition.** Direct player loads, but Stage's game iframe displayed Chromium's refused-to-connect page in the in-app browser. Both hosts supply isolation headers. A temporary document-only CORP same-site probe did not resolve it and was not committed. Browser iframe composition remains unverified. OBS separate game capture under transparent Stage is the alternative, also needing an actual capture test.
4. **Phones / hosting.** Bundle is ready. Deploy only for Karthik's recorded judging window; verify HTTPS isolation headers, physical iOS Safari and Android Chrome, then five phones on venue Wi-Fi. Publish the actual QR/event afterward. Download stays hidden; remove production and old preview ROM deployments after the window.
5. **Recording.** Desktop Lua tap/bridge-to-director, OBS scenes, continuous before/after footage and 60-second video remain unverified. End on Built today / Not ours.

## Follow-on direction

QR-first portable play remains the north star: choose an old game and move it to another interface. Local-model editable mappings and generated screen extension are still experiments (EXPERIENCE_IDEA.md).

Pokémon work has started in A: `63c0cc9` reports a byte-identical pret build and per-routine assembly referee; `b100b93` adds the local crew target / Game Boy referee. Read lab/pokered/README.md and docs/POKEMON_IMPLEMENTATION.md. Original playback, visited locations, behavior validation and code verification stay distinct. D's Game Boy selector/adapter and geographic map integration are not implemented yet; Doom gates remain first.

## Entry points

- Packages: runtime/BOOT.md; swap: runtime/PACKAGE_SWAP.md.
- Player: `node creature/phone/serve.mjs --port 7412 --rom creature/runtime/generated/doom-static-playable.gba` (7412 is this host's test override).
- Static deployment: phone/README.md; coordination: MURMUR.md; capture: obs/RUN_OF_SHOW.md.
- Bridge: `python -m creature.bridge --help`.

Root receives and publishes checkpoints during active work. Luna supervised this turn's parallel workers; it is not an unattended service after the conversation stops.
