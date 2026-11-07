> Current integration update: browser boot/menu/newgame/movement verified. Packaging and package-aware preflight implemented. B exports and C geometry/routes received. See [STATUS.md](STATUS.md) and [runtime/BOOT.md](runtime/BOOT.md). Only unresolved hero-cycle prerequisite is A's current static-face build/id/activation; older requests below are historical until reconciled by STATUS.

# Lane D handoffs and integration status

Owner: Enzo / Lane D. Updated 2026-11-07, from main's current DECISIONS.md.
Read this file alongside creature/README.md and WORKPLAN.md (active parallel ownership); EXPERIENCE_IDEA.md carries the SubQ extension proposal. This is a request/status document, not a change to contracts.

## Current priority and status

- Primary demo: Doom running, static-face stub in the ROM, one verified recovered face function, face restored. OBS region-healing overlay is a bonus.
- Follow DECISIONS.md: freeze 14:55 Pacific; record 16:10; submit 16:30. Finale bug or honest modification decided by 13:00.
- Lane A has already committed the real manifest, asm/context and viz_map. The private variant regenerated all function ids. Always re-read the current manifest; the old face id is obsolete.
- GitHub connector publishing works (handoff and workplan committed). Shell Git still has DNS failure; root serializes connector commits. No emulator boot, swap, physical-phone play or recording has been verified by D yet.
- Coordinate through GitHub only. No cross-laptop LAN endpoints, hotspot sharing, or tunnels. Existing contracts remain authoritative. Do not commit secrets or ROMs.

## Requests to A (Lab)

Please publish responses and implementation details inside lab/ and reference this document in your commit message where useful.

1. Confirm the static-face stub plan: how to build/select the unrecovered display state, how the recovered face function restores normal display, and the exact fn id(s). Keep the display rule honest; no claim that actual code recovery has happened when running a sample.
2. Provide reproducible local boot/WAD-packaging commands for the committed engine ROM on Windows. Latest setup_referee.sh only starts the container and does not reconstruct the private source.
3. Received: engine target.gba and link_info.json are committed; rebuild/patch now implemented (11:49 A update, object-splice contract method). D still needs a bootable WAD-packaged build and actual runtime validation.
4. When ready, supply rebuild/patch usage and reports under the existing contracts. Byte-identical rebuild swap and intentionally changed patch are separate cases; a patch cannot pass the original-ROM identical-hash check.
5. For a patch loaded over an existing save state, document whether code layout and game-state layout remain compatible. D will only claim uninterrupted play after testing; reboot/menu/recorded fallback is acceptable and labeled.
6. Confirm license/distribution requirements before any public patched-ROM phone demo. A GitHub-hosted site/artifact route would need an explicit team-approved distribution plan; no tunnel assumed.

## Requests to B (Crew)

Please publish responses in crew/; real run artifacts must follow the team's GitHub-only coordination rule and existing schemas.

1. Prioritize the face function once A confirms its current id and recoverability; report whether 1,160 bytes is feasible or whether a smaller hero function is needed.
2. Provide a documented way for D to obtain an explicit real run snapshot on its own machine: events.jsonl, run id, accepted recovered C, and matching manifest/build identity. runs/ is ignored, so merely writing files locally does not deliver them to another laptop. Propose a GitHub artifact or approved sanitized export location in your own folder; do not silently add a new contract.
3. Keep fixtures/replays labeled. D computes healing only from accepted fn.matched events, deduplicated per function and reset per run; names are not proof.
4. Select one accepted recovered function for a visible, single-function finale modification with A. Provide accepted source and verification reference before D edits it.

## Requests to C (Stage)

Please publish responses in stage/.

1. Confirm actual local launch command, port and scene routes, especially split and ending.
2. Confirm game opening geometry at 1920x1080: x/y/width/height, any crop, transparent background behavior, and whether capture is via OBS or embedded browser emulator.
3. Agree that face restoration inside the ROM is primary; region-overlay healing can follow when the end-to-end path works.
4. Read D's eventual rom.swapped / patch.verified / phone.published events using existing contracts. Never display a running-agent-code percentage before a confirmed swap.
5. Provide a place in the ending scene for credits, actual recovery percentage, verified checksums and Built today / Not ours. Do not assume 100% completion.

## What D will provide

- Local bridge inputs for explicit event, manifest and viz_map paths; fixture and disconnected states identified.
- Lua/emulator integration where supported by current mGBA APIs, with truthful readiness and swap status.
- Optional transparent 240x160 region overlay on port 7302; bridge websocket 7301; phone page 7401.
- Verified swap/patch/publication events only after successful real actions, never fixture success passed as live.
- Controller/capture setup, credits/end card, and 60-second captioned recording workflow.
- Phone shell can be prepared without a ROM; playable public distribution waits on a working core, real ROM and license/distribution review.

## Ongoing synchronization

During active implementation, D reads latest main and relevant DECISIONS/lab/crew/stage handoffs before each work chunk, before publishing, and after publishing. Small commits touch creature/ only. Normal Git uses pull --rebase before push. Connector fallback uses the contents API for small creature-only files, reading current main first and passing the current file blob SHA for updates. After publication, inspect the resulting commit and current main; retry conflicts only after reading incoming changes. Never overwrite a teammate.

Update this document as requests resolve and implementation lands. This policy is executed during active work; it is not an unattended background monitor.
