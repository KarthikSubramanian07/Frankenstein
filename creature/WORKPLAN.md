# Lane D active work plan

## Product direction from Enzo: QR-first portable play

Judges scan a real QR and immediately play on their phones. Doom is today's supported demonstration; the north star is selecting an old game and adapting it to another device/interface. Explore (1) a genuinely local model proposing fully human-editable control mappings and (2) generated visual continuation into extra display area. Phone play is a demo requirement. These adaptation experiments are not yet implemented. Read [EXPERIENCE_IDEA.md](EXPERIENCE_IDEA.md) and respond through [issue #3](https://github.com/KarthikSubramanian07/Frankenstein/issues/3).

Owner: Enzo; root agent integrates. This file and HANDOFFS.md are the cross-lane coordination entry points. Enzo's latest direction makes QR-to-phone play a demo requirement; read EXPERIENCE_IDEA.md alongside the engineering decisions.

## Parallel ownership (active)
| Workstream | Owns | First checkpoint |
|---|---|---|
| Bridge agent | creature/bridge/ | TCP tap7300 -> WS7301, event tail, honest per-run heal, local health |
| Emulator agent | creature/tap/, creature/runtime/ | Official mGBA Lua OAM/PC telemetry, hash/swap preflight, boot instructions |
| Phone agent | creature/phone/ | Browser core integration, touch/keyboard controls, honest missing-ROM/core states |
| Overlay/show agent | creature/overlay/, creature/obs/ | Optional region overlay7302, OBS alignment, 60s shotlist/endcard |
| Root orchestrator | creature root docs and integration | Review/smoke/publish each ready checkpoint; read incoming commits and resolve interfaces |

Agents write disjoint local folders and report checkpoint files to root. Root alone publishes serially to main using the GitHub contents API while shell Git DNS remains unavailable. Read main before work/publish and after each checkpoint; file updates use fresh blob SHAs. No force pushes, no unrelated lane edits, no secrets. This is active-session synchronization, not a background service.

## Current upstream changes received
- Target is now the private variant. All fn ids regenerated: do not hardcode the old face address.
- Lab rebuild/patch now real, method object-splice per latest additive contract; engine target.gba (no WAD) and link_info committed. A patch must fit original function size, Thumb ROM only.
- Static-face ROM stub is primary; overlay is bonus. Freeze14:55, record16:10, submit16:30 Pacific.
- Crew has Director.heartbeat / steer and eyes in crew/director.py; current crew/serve.py has no telemetry intake endpoint. D will expose real local telemetry rather than fabricate an API.
- Stage split runs via npm dev on5173 with ?scene=split&obs=1, server7201 and WS7202. Others still rolling out. Badge comes from actual rom.swapped.
- GitHub-only cross-machine coordination remains in force.

## Immediate requests
A: provide a reproducible WAD-packaging command and permitted WAD acquisition route for the committed engine ROM; confirm current face function/stub activation and state compatibility across patch. D cannot claim boot without this.
B: document how Director consumes D's real heartbeat/screenshot on the same local demo machine; add a bounded intake or file-consumption path in crew/ if desired. Existing serve API does not expose it. Commit an approved real run export or artifact reference because runs/ is ignored.
C: confirm precise game rectangle and transparent split composition; D will use existing documented routes, no invented routes.
All: read creature/EXPERIENCE_IDEA.md for Enzo's SubQ gameplay-extension proposal and respond in your own lane docs.

## Gates and truthfulness
1. Each component launches with help/health or explicit missing prerequisite state.
2. Sample events heal only in clearly marked sample mode. Deduplicate match ids; reset on run change.
3. Actual ROM boots before claiming gameplay. Actual emulator acknowledgment before swap event.
4. Patched builds intentionally differ from original; they use patch proof, not identical rebuild hash gate.
5. QR-to-phone play is now a required demo beat under Enzo's latest direction. Establish a permitted, reachable delivery route and physical-phone checks; localhost playback alone is incomplete.
6. No new CI/test suites outside core (DECISIONS); targeted manual smoke and visual checks only.
