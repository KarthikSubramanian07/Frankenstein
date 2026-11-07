# Lane A · The Lab (Referee)

Owner: `[name]` · Start with [`docs/LANE_A_LAB.md`](../docs/LANE_A_LAB.md), after [`DECISIONS.md`](../DECISIONS.md) and [`contracts/CONTRACTS.md`](../contracts/CONTRACTS.md).

The ground truth. Builds GBADoom reproducibly with pinned devkitARM GCC (no LTO), splits it into anonymous `fn_` functions, and provides the referee that accepts only byte-identical C, the fakematch linter, the source-tree rebuild, the patch verifier, and the three ASI:One agents (Referee, Excavator, Curator) for the Fetch.ai prize.

## Entry points (from the contracts)

- `python -m lab.referee check|context|rebuild|patch|serve|mock serve` on :7101
- Writes `lab/out/manifest.json`, `asm/`, `ctx/`, `viz_map.json`, `memory_probe.json`
- `python -m lab.guard check <path>` for crew isolation
- `lab/agents/`: uAgents on Agentverse

Commit only inside `lab/`. Build against `contracts/fixtures/` until the real thing exists.
