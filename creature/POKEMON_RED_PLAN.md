# Pokémon Red: bounded second-game demo and a real coverage map

**Requested by Enzo. Sequence: get a good Doom demo working first, then add Pokémon Red.**

The next proof case should not require reconstructing the whole game. Pair a playable opening slice with a beautiful, genuine map of the game's places, menus and early interactions, showing exactly how far Frankenstein has reached.

Doom remains the current delivery priority. Pokémon Red is the requested follow-on target. This document defines scope and work for A/B/C/D; it does not claim a Pokémon build, permission to distribute its assets, or a second-game recovery already exists.

## 1. Playable slice

Enzo's first scope is:
1. The landing/title menu and its first usable navigation.
2. The opening path needed to reach the first Pokémon interactions.
3. A small set of those interactions, with exact entry and stop checkpoints chosen by A+B after inspecting the authorized target.

A+B must name the actual scenes/maps/scripts included and the terminal checkpoint before starting a run. Starter selection or an initial encounter can be candidate endpoints, not assumed completed features. Do not expand this into completing or recovering all of Pokémon Red.

“Remapping” controls and recovering gameplay are separate tasks. Touch/gamepad mappings translate inputs. An emulator can execute original machine code without recovering its source. Our map must say which behavior/code Frankenstein actually reconstructed or validated, even if a reference ROM can play farther.

At the slice boundary, show an honest “not covered yet” state or a clearly labelled reference-playback mode. Do not silently continue on original code while implying that Frankenstein has recovered the whole game.

## 2. What the tree/map must mean

**A genuine game map, not an arbitrary roadmap, function grid, or invented branching tree.**

Use the actual game's spatial/transition topology: real map/room ids, exits, connections and positions when those can be verified. Ground the displayed route in real observed navigation. Menus, dialogue and Pokémon interactions form a connected progression layer attached to the relevant location; do not pretend a title menu is a geographic town.

The main view should let a judge see the whole known world/context, zoom to the starting area, and follow the exact route into the opening interactions. At the same time, the gameplay viewport shows the current point on that map.

- Place the player/current slice on the real location.
- Light the route only as actual transition evidence arrives.
- Attach menu, dialogue and Pokémon-interaction branches where they actually occur.
- Let a judge select a node to see its screenshot/input trace and verification evidence.
- Keep out-of-scope or unreached regions subdued. Unknown topology should be labelled unknown, not filled by a model.
- If the full game's validated topology is unavailable, label the extent of the known map; do not imply the partial graph is the complete world.

Use original vector/UI styling unless the team has an approved route for game art. The map can be spatially faithful without copying an existing fan map image.

## 3. Keep three kinds of progress separate

| State | Evidence required | What it proves |
|---|---|---|
| Observed / visited | Actual map/scene id, transition, input trace or runtime observation | We reached this location/interaction in this run |
| Behavior validated | Declared checkpoint replay/trace comparison passed | This scoped behavior worked under that check |
| Code recovered and verified | Independent target-specific referee result tied to code units and build identity | These particular units satisfy the stated recovery proof |

Visiting a place is not proof its code was recovered. A plausible screenshot is not a byte match. Model-inferred labels remain marked as guesses.

A useful node panel shows: game/build hash; map/scene/interaction id; source of topology; exact supported checkpoint; visited state; actual original/recovered/mixed execution mode; required code-unit ids if known; matched count and denominator; verifier/method; last evidence reference.

If showing a percentage, name its denominator: selected slice's verified units, known mapped behaviors, or observed places. Never convert “opening slice complete” into “Pokémon Red 100% recovered.” If the mapping from a location to required code is incomplete, say coverage unknown instead of inventing a fraction.

## 4. Proposed visual language

A beautiful world map is the hero beside gameplay; a progression tree is the drill-down.

- Dark/desaturated geography supplies context for places not reached.
- A lit path traces actual movement; a clear current-position marker stays synchronized.
- A separate mint outline/badge marks verified reconstruction. It must not be conflated with the visited path.
- Small interaction branches reveal title/menu, dialogue and first Pokémon milestones with short labels.
- On acceptance of real proof, animate only the relevant node/region, then leave its evidence accessible.
- Keep a persistent legend, scope boundary and “opening slice” label. Reduced motion gets instant transitions.

C owns presentation. A owns trustworthy topology/identities. B owns evidence aggregation. D owns real gameplay/telemetry and the player. Generative screen extensions from EXPERIENCE_IDEA.md are a different feature: the coverage map itself must be evidence-driven.

## 5. Lane A: target, toolchain, topology and scoped proof

See also lab/POKEMON_RED_SCOPE.md.

1. Pin the exact target/platform/revision and record the available authorized input and asset-delivery route. Do not download or commit a commercial ROM as part of this planning request.
2. Establish a separate Game Boy target adapter. Existing Doom ARM/Thumb addresses, GBA OAM, devkitARM C flags and source-splice assumptions do not transfer automatically.
3. Identify code/data with bank-aware ids tied to the exact build. ROM bank plus address is needed; an address alone may be ambiguous.
4. Publish a visual-only topology manifest for C/D: actual location ids, room/map shape or coordinates where available, transitions/warps and the selected opening route. Attach provenance and mark uncertain links.
5. Keep any hidden source/reference answer key out of B's recovery sandbox. A location→code-unit association derived from that key belongs in a visual-only map, as with Doom's viz_map.
6. Define the verification achievable for this target: assembler byte comparison, executable-equivalence checks or bounded behavior traces. State the proof precisely. Do not advertise a generated C compiler match to a game whose original target/toolchain differs.
7. Deliver entry/exit checkpoints, baseline input traces and a minimal support list for the title/menu and first Pokémon interactions. Confirm the method and projected effort before a recovery run.

Existing notice received: DECISIONS.md records A's 13:00 recommendation against starting Pokémon without team confirmation, its method/rights concerns and open-source game-2 alternatives. Enzo's subsequent instruction explicitly requests this scoped Pokémon plan after Doom. A should answer feasibility and the allowed demo route rather than silently switching targets or claiming those concerns are resolved.

Reference https://github.com/pret/pokered describes an existing Pokémon Red/Blue disassembly, not a fresh Frankenstein result. If used for checking or topology research, disclose that prior work and keep it out of blind recovery prompts. Its existence does not demonstrate our independent recovery.

## 6. Lane B: partial recovery and truthful coverage accounting

See also crew/POKEMON_RED_COVERAGE.md.

1. Wait for A's approved target adapter, bank-aware manifest and explicit opening-slice boundaries. Keep Doom work progressing meanwhile.
2. Recover only the code units needed for the agreed slice. Publish per-unit attempts, independent verdicts and actual accepted sources/artifacts; do not synthesize full-game coverage.
3. Accept real observation/transition evidence from D, and maintain visited, behavior-validated and code-verified states independently.
4. Propose an additive event/export shape with A/C/D before changing contracts. Each record must identify game/build, run, bank-aware unit or real map/scene id, evidence kind and provenance. Reset on run/build changes; deduplicate proof; reject stale or mismatched ids.
5. Keep visual-only hidden-key topology outside the Digger/Checker sandbox. B can publish per-unit proof and observed transitions; C/D can join that with A's visual map. Model-suggested labels are not authoritative topology.
6. Publish a replayable coverage export with its exact scope/denominator and evidence references. Clearly label any original-code fallback.
7. Return an effort/feasibility estimate for menu + first Pokémon interactions, and flag any unsupported dependency rather than broadening the claim.

## 7. C and D handoff

C: design the actual spatial map plus attached progression tree, linked to the current gameplay screen. Support visited/proved legends, zoom into the opening area, node evidence, and unknown/out-of-scope states. Preserve the QR-to-phone north star, with Doom as the working demo until the second target is ready.

D: implement only the declared Pokémon runtime/input/telemetry adapter after A+B's feasibility gate. Capture actual menu/navigation/interaction traces. QR delivery of Pokémon remains dependent on an approved asset route; no public ROM is assumed by this plan.

## 8. Ready-to-demo conditions

- The good Doom demo is stable first.
- A+B publish exact opening checkpoints and the target-specific proof method.
- The scoped Pokémon sequence really runs; input is usable; stopping/fallback behavior is visible.
- Real location/transition evidence moves the marker on a verified geographic map.
- Verified recovery changes the proof layer separately from exploration.
- One map node can be traced back to its actual evidence.
- Unknown/uncovered remainder is visible and labelled.
- Game assets, prior work and current support are disclosed.

No implementation or shared-schema change is implied by publishing this brief. A/B should respond in their own handoff files with feasibility, artifacts, boundaries and next steps.
