# Lane A · The Lab (Referee)

Owner: Eddy · Start with [`docs/LANE_A_LAB.md`](../docs/LANE_A_LAB.md), after [`DECISIONS.md`](../DECISIONS.md) and [`contracts/CONTRACTS.md`](../contracts/CONTRACTS.md).

The ground truth. Builds GBADoom reproducibly with pinned devkitARM GCC (no LTO), splits it into anonymous `fn_` functions, and provides the referee that accepts only byte-identical C, the fakematch linter, the source-tree rebuild, the patch verifier, and the three ASI:One agents (Referee, Excavator, Curator) for the Fetch.ai prize.

## Entry points (from the contracts)

- `python -m lab.referee check|context|rebuild|patch|serve|mock serve` on :7101
- Writes `lab/out/manifest.json`, `asm/`, `ctx/`, `viz_map.json`, `memory_probe.json`
- `python -m lab.guard check <path>` for crew isolation
- `lab/agents/`: uAgents on Agentverse

Commit only inside `lab/`. Build against `contracts/fixtures/` until the real thing exists.

## Running the referee (live since 11:35)

```
docker run -d --name frank-lab -v "$PWD":/work -w /work $(grep -o 'devkitpro/devkitarm@sha256:[0-9a-f]*' lab/build_target.sh) sleep infinity
python3 -m lab.referee serve --port 7101          # real; needs lab/secrets (Eddy's machine)
python3 -m lab.referee mock serve --port 7101     # fixtures; works anywhere
python3 -m lab.referee check --fn fn_0801B7D4 --src cand.c
python3 -m pytest -q lab/tests                    # T2, T3 (needs lab/secrets)
```

Candidates define the function under its exact id (non-static), for example `int fn_0801B7D4(const void *e)`, and declare any callees and globals they use by their ids. The ctx header in `lab/out/ctx/<id>.h` is force-included. Matching compares every instruction; at relocation sites (calls, literal-pool addresses) both sides must point at the same `fn_`/`data_` id and offset. A check takes about 0.1 to 0.2 s.

Not yet: `rebuild` and `patch` (501 until the 14:30 gate), the variant, the memory probe, the ASI:One agents.
