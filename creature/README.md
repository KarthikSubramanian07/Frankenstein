# Lane D · The Creature (Game, Overlay, Phones, Video)

Owner: `[name]` · Start with [`docs/LANE_D_CREATURE.md`](../docs/LANE_D_CREATURE.md), after [`DECISIONS.md`](../DECISIONS.md) and [`contracts/CONTRACTS.md`](../contracts/CONTRACTS.md).

The body. GBADoom in mGBA with a Lua tap, a heal overlay where static clears as each subsystem's code returns, live hot-swap onto the rebuilt ROM, the finale (decide by 13:00: a real bug, or the honest modification), the phone play page with a QR code, and the 60-second demo video ending on the Built today / Not ours card.

## Entry points (from the contracts)

- Bridge ws :7301, overlay :7302, phone page :7401
- Writes `rom.swapped`, `patch.verified`, `phone.published` into `runs/live/events.jsonl`
- Reads `lab/out/viz_map.json`, `lab/out/patched.gba`

Commit only inside `creature/`. Build against `contracts/fixtures/` until the real thing exists.
