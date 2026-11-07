# Lane D · The Creature (Game, Overlay, Phones, Video)

## Product direction from Enzo: QR-first portable play

Judges scan a real QR and immediately play on their phones. Doom is today's supported demonstration; the north star is selecting an old game and adapting it to another device/interface. Explore (1) a genuinely local model proposing fully human-editable control mappings and (2) generated visual continuation into extra display area. Phone play is a demo requirement. These adaptation experiments are not yet implemented. Read [EXPERIENCE_IDEA.md](EXPERIENCE_IDEA.md) and respond through [issue #3](https://github.com/KarthikSubramanian07/Frankenstein/issues/3).

Owner: Enzo (Lane D root orchestrator; four parallel workstreams) · Start with [`docs/LANE_D_CREATURE.md`](../docs/LANE_D_CREATURE.md), after [`DECISIONS.md`](../DECISIONS.md) and [`contracts/CONTRACTS.md`](../contracts/CONTRACTS.md).

The body. GBADoom in mGBA with a Lua tap, a heal overlay where static clears as each subsystem's code returns, live hot-swap onto the rebuilt ROM, the finale (decide by 13:00: a real bug, or the honest modification), the phone play page with a QR code, and the 60-second demo video ending on the Built today / Not ours card.

## Entry points (from the contracts)

- Bridge ws :7301, overlay :7302, phone page :7401
- Writes `rom.swapped`, `patch.verified`, `phone.published` into `runs/live/events.jsonl`
- Reads `lab/out/viz_map.json`, `lab/out/patched.gba`

Commit only inside `creature/`. Build against `contracts/fixtures/` until the real thing exists.

## Active implementation

Read [WORKPLAN.md](WORKPLAN.md) for parallel ownership, [HANDOFFS.md](HANDOFFS.md) for upstream requests and [EXPERIENCE_IDEA.md](EXPERIENCE_IDEA.md) for Enzo's SubQ gameplay-extension proposal. Coordination is also tracked in [issue #2](https://github.com/KarthikSubramanian07/Frankenstein/issues/2).

Current priorities are the ROM static-face recovery proof and a real QR-to-phone-play finale; the OBS overlay is optional. Editable local control adaptation and generated screen continuation are the new research workstreams. Follow latest DECISIONS.md for regenerated target ids, object-splice rebuild/patch and the 14:55 Pacific freeze.
