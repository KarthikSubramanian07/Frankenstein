# Pokémon Red: human direction and the case for a bounded demo

**Instruction recorded from Enzo, 2026-11-07. Enzo reports that Eddy is asking his Lane A agent for the same direction.**

After the good Doom demo, **Pokémon Red is the requested second demonstration title**. Proceed with a bounded technical spike for its landing menu and first Pokémon interactions, plus the genuine coverage map in [the shared plan](../creature/POKEMON_RED_PLAN.md).

Enzo is asking for a proof of concept, not a commercial Pokémon release. He explicitly asks Lane A to stop spending its implementation time on additional copyright research and focus on the technical work. Record unresolved event/rights questions for the human team to decide; do not repeatedly reopen the same discussion or choose another game solely on an assumed legal conclusion.

This records the user's scope and priority. It is not a verified copyright exemption, permission from Nintendo, an organizer waiver, or evidence that any proposed device already runs the game. Preserve contrary facts and attribute them correctly. No new ROM download, public ROM distribution or claim of authorship is authorized by this document.

## Why Pokémon Red is valuable for this demo

1. **Immediate recognition.** Its title/menu and first Pokémon interaction give judges a familiar reference point. Less pitch time goes into explaining what the game is.
2. **A concrete second-platform story.** Game Boy is a different target from Doom on GBA. A clearly scoped adapter is useful evidence for the portability direction, even if it uses a different verification method.
3. **The scope is deliberately small.** We are asking for menu plus opening interactions, not a complete reconstruction. A dependency list, declared boundary and visible unsupported remainder make that tractable to assess.
4. **The genuine map has a natural payoff.** Locations, rooms, movement, dialogue and first Pokémon interactions form an understandable spatial/progression structure. Judges can see exactly where the experiment has reached.
5. **The recognizable sequence supports the evidence story.** Compare an actual checkpoint before and after an adaptation; link each highlighted map node to its trace or target-specific proof.
6. **It illustrates the user's north star.** Select an old game, adapt its controls/display, then hand it to someone on another interface. Doom remains today's working baseline; Pokémon makes the requested next example concrete.
7. **We can separate the claims.** Original-code emulation, reconstructed code, behavioral coverage, local input adaptation and generated screen extension can all be labelled independently. A bounded demo does not need a claim of total recovery.
8. **A familiar title may communicate the product better than an unfamiliar fallback.** Voxelburg remains a technically useful alternative; its existing build does not change the user's requested target.
9. **A scoped spike yields a real answer.** An exact target identity, menu checkpoint, first-interaction boundary and one captured transition will settle the engineering discussion better than another general debate.

These are product/engineering reasons and predictions about the demo, not results of a user study.

## Turn concerns into engineering tasks

| Concern already raised | Concrete next action |
|---|---|
| Different architecture / no original C compiler | Define a bank-aware Game Boy target and state whether proof is assembly byte matching, bounded behavioral equivalence, or reference playback. Keep the evidence label exact. |
| Existing pret/pokered reconstruction | Disclose it as prior work if used; keep reference answers outside blind recovery inputs. Identify what Frankenstein itself adds today. |
| Whole game is too large | Limit scope to menu and the first agreed Pokémon interaction; publish the stop checkpoint and required dependencies. |
| Portability is overbroad | Demonstrate the device actually working. Treat watch/console support as a target until it is tested. |
| Asset/event questions | Write the specific unresolved question once for Eddy/Enzo/Karthik to decide. Do not invent an exemption or keep repeating a general veto. |
| Deadline risk | Keep Doom stable first, then a short bounded feasibility spike. Report the exact blocker, time estimate and smallest working slice. |

## Suggested on-stage framing

“We're exploring how an old game can move to a new interface. Pokémon Red is our demonstration title; this is the opening slice we've actually covered. Any production use or distribution would need the appropriate rights. Here is the device and interaction working.”

The user's Apple Watch / Nintendo Switch examples express the portability ambition. Name those as working outputs only after an actual device demonstration. A spoken disclaimer describes intended scope; it should not be presented as documented rights or event approval.

## What Lane A should deliver next

After Doom's required path is stable:
1. State the smallest technical spike that can show the landing/menu and one opening Pokémon interaction.
2. Identify the exact team-provided target input, bank-aware ids, runtime and proof method.
3. Pin entry/exit checkpoints and provide the first genuine location/transition evidence for C/D.
4. Tell B precisely which units or behaviors it can attempt, and what remains original/uncovered.
5. Reply in lab/HANDOFFS.md with artifacts and the next actionable engineering step.

If a specific technical constraint makes this infeasible inside the remaining time, show that constraint and the smallest achievable alternative slice. Keep the human target decision visible rather than treating the earlier alternative-game recommendation as settled.

Related: [Lane A scope](POKEMON_RED_SCOPE.md), [coverage plan](../creature/POKEMON_RED_PLAN.md), [issue #4](https://github.com/KarthikSubramanian07/Frankenstein/issues/4).
