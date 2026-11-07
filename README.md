# FRANKENSTEIN

**Lost games, rebuilt and proven, byte for byte.**

`#decompilation` `#coding-agents` `#game-preservation` `#verification` `#gba` `#muse-spark` `#fetch-ai` `#hackathon`

A crew of coding agents rebuilds a game's lost C source from the only thing that survives, the compiled ROM. They work one function at a time, and nothing is stitched in unless a compiler referee proves it is byte-for-byte identical. Victor Frankenstein never checked his work. Ours checks everything.

> **Team git rule:** commit only inside your own lane folder, `git pull --rebase` before every push, and push small commits to `main` often. Changes to `contracts/` need a line in `DECISIONS.md` and a ping in the team channel. Nobody force-pushes `main`.

## Built today / Not ours

| Built today (Nov 7, 2026, after 10:45) | Not ours |
|---|---|
| Everything in `contracts/`, `lab/`, `crew/`, `stage/`, `creature/` | **Doom** by id Software; **prBoom** by its authors; **GBADoom** by doomhack (GPL-2.0-or-later). Used only as the hidden answer key, never committed |
| The referee, linter, agents, scenes, overlay, and phone page | Muse Spark 1.3 (Meta), Agentverse and ASI:One (Fetch.ai), MongoDB Atlas, SubQ, mGBA, devkitARM |
| | **Prior work:** the planning kit in `docs/`, including `docs/design_system.html` (visual reference only, never shipped) |

## The lanes

| Lane | Owns | Start with |
|---|---|---|
| **A · The Lab** | Toolchain, target ROM, referee, linter, rebuild and patch, ASI:One agents | [`docs/LANE_A_LAB.md`](docs/LANE_A_LAB.md) |
| **B · The Crew** | Diggers, Checker, Archivist, Distiller, Cartographer, idiom library, experiments | [`docs/LANE_B_CREW.md`](docs/LANE_B_CREW.md) |
| **C · The Stage** | The game-scene UI, event server, replay, director mode | [`docs/LANE_C_STAGE.md`](docs/LANE_C_STAGE.md) |
| **D · The Creature** | mGBA tap, heal overlay, hot-swap, the fix, phones, video | [`docs/LANE_D_CREATURE.md`](docs/LANE_D_CREATURE.md) |

Read [`DECISIONS.md`](DECISIONS.md) first. Its corrections override the kit.

## Architecture

```
 lab/secrets (answer key, gitignored; only the referee reads it)
        │
  ┌─────▼──────┐  manifest, asm, ctx   ┌──────────────┐  events.jsonl   ┌─────────────┐
  │  A · LAB    │──────────────────────▶│  B · CREW     │────────────────▶│  C · STAGE   │──▶ judges
  │  referee    │◀── POST /check ───────│ diggers       │   metrics.json  │ ws :7202     │
  │  :7101      │                       │ checker       │                 └─────────────┘
  │ ASI:One     │── POST /jobs ────────▶│ jobs API :7111│                        ▲ beams
  │ agents      │                       └──────┬────────┘                        │
  └─────┬──────┘                              │ fn.matched              ┌──────┴───────┐
        │ build.rom / patched.gba             └────────────────────────▶│ D · CREATURE  │──▶ phones
        └──────────────────────────────────────────────────────────────▶│ mGBA + overlay│
                                                                        └──────────────┘
```

Lanes share only what is in [`contracts/CONTRACTS.md`](contracts/CONTRACTS.md): file shapes (JSON Schema in `contracts/schemas/`), the referee and crew HTTP APIs, and the append-only `runs/<run_id>/events.jsonl`. Every lane builds against `contracts/fixtures/` from minute one.

## Run the foundation

```bash
make setup         # .venv with jsonschema, python-dotenv, pytest
make fixtures      # regenerate contracts/fixtures (deterministic, all marked fixture)
make validate      # validate fixtures, runs/*, lab/out/*.json against the schemas
make test          # contract tests
make sample-runs   # runs/fx01..fx03 + runs/live -> fx01, for Stage/Creature dev
```

`python -m lab.referee mock serve` (Lane A) and `python -m crew.serve --mock` (Lane B) arrive as those lanes land.

## Repo map

```
docs/        the kit (plans, lane prompts, design reference)   contracts/  shared contracts, schemas, fixtures, validator
lab/         Lane A        crew/  Lane B        stage/  Lane C        creature/  Lane D        runs/  run output (gitignored)
```

## Evidence rule

Bright means proved by the compiler: match %, checksums, the differing instruction, "1 function changed". Violet with a "?" is our guess: names, descriptions, types. Every screen and every chat answer keeps the two apart.

MIT licensed. See [LICENSE](LICENSE).
