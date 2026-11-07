# Lane D first implementation checkpoint

All implementation is confined to creature/. Four dedicated agents worked in disjoint folders; root reviewed and serialized publication onto current main. See WORKPLAN.md for ownership and HANDOFFS.md / issue #2 for upstream requests.

## Run from repo root
- Bridge: python -m creature.bridge --events runs/live/events.jsonl --manifest lab/out/manifest.json --viz-map lab/out/viz_map.json
- Overlay: python creature/overlay/serve.py (optional, port7302)
- Phone: in creature/phone run npm install --ignore-scripts then npm run prepare:core; python server.py --rom <assembled-playable.gba> (port7401)
- mGBA: Tools > Scripting, load creature/tap/oam_tap.lua after reading tap/README.md.
- Swap preflight: python creature/runtime/prepare_swap.py --help; read runtime/README.md before preparing a candidate.
- Recording: creature/obs/RUN_OF_SHOW.md and endcard.html; actual OBS scenes still need local setup.

These are preparation/launch instructions, not a claim that the complete game demo runs in the current environment.

## Validation and limits
| Component | Implemented | Verified here | Still needed |
|---|---|---|---|
| Bridge | TCP7300, WS7301, HTTP7304, event tail/heal, real PC mapping, sample/disconnect states | Python compile/help; reducer/frame/manual edge-case smoke | Real sockets and emulator integration; sandbox blocks asyncio socketpair initialization |
| mGBA tap | OAM and sparse PC/key samples, optional screenshots | Official scripting API audit | Lua/mGBA execution and actual game boot; no mGBA installed here |
| Swap helper | Hash/report checks, safe copies, manual save/load/rollback script | Stdlib smoke: identical rebuild, bad hash/fixture rejection, one-function patch compatibility gate | Playable package-level proof, compatible save state, actual swap |
| Phone | mGBA WASM adapter, touch/keyboard controls, local file/server loading, headers and credits | JS syntax, Python compile, server startup | npm/core download (DNS blocked), real ROM boot, visual and physical-phone checks |
| Overlay/show | Region static, sample/disconnect labels, OBS setup and 60s plan | Python and JS syntax checks | Browser visual/performance QA and actual OBS import/setup/recording |

No fake swap, phone publication, gameplay or recovered-code successes were emitted. No new test suite/CI added by D. No engine, WAD, core binaries or secret keys added by D.

## Current integration blockers
A: assembled playable variant ROM + package SHA-1/provenance; current face stub/function id; patch/state compatibility. Engine-only report hash cannot attest a WAD-appended ROM.
B: connect observed telemetry to Director on the same demo machine; approved GitHub real-run export because runs/ is ignored.
C: exact game rectangle and final scene routes; Stage currently documents split/obs on5173.
Environment: shell Git/npm DNS unavailable; GitHub connector works for reads/writes. No enabled preview browser, so visual checks remain unperformed.

## Incoming changes incorporated in coordination
Latest target ids regenerated and object-splice patch implemented; shared API nullable status/name relaxation; A's single six-intent Agentverse agent; DECISIONS union-merge rule; new framing: Doom is the first patient, source recovery is the product. All further demo copy should reflect that framing.

## Next bounded integration
Install/run real emulator or browser core on a capable host, obtain the assembled playable variant and verify package hash, then demonstrate one real gameplay -> verified recovery -> visible face restoration cycle. Polish the experience after that loop works. EXPERIENCE_IDEA.md preserves Enzo's proposed SubQ-selected post-recovery game modification as an optional next beat.
