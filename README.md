# FRANKENSTEIN

**Lost games, rebuilt and proven, byte for byte.**

[![Live site](https://img.shields.io/badge/live-tryfrankenstein.pages.dev-FFD23F?style=flat-square&labelColor=0B0B2E)](https://tryfrankenstein.pages.dev)
[![License: MIT](https://img.shields.io/badge/license-MIT-7CF2C8?style=flat-square&labelColor=0B0B2E)](LICENSE)
[![Built at](https://img.shields.io/badge/built%20at-AI%20Engineer%20Code%20Summit%20hackathon-3BC7FF?style=flat-square&labelColor=0B0B2E)](#built-today--not-ours)
[![Target](https://img.shields.io/badge/target-GBADoom%20(no%20LTO)-FF6BD6?style=flat-square&labelColor=0B0B2E)](https://github.com/doomhack/GBADoom)

`#decompilation` `#matching-decompilation` `#coding-agents` `#multi-agent` `#verification` `#game-preservation` `#gba` `#muse-spark` `#subquadratic` `#fetch-ai` `#mongodb` `#hackathon`

```
  SELECT FILE
  ▶ FILE 1   DOOM    SOURCE CODE: LOST
    FILE 2   ----    EMPTY
    FILE 3   ----    EMPTY

              PRESS START
```

A crew of coding agents rebuilds a game's lost C source from the only thing that survives, the compiled ROM. They work one function at a time, and nothing is stitched in unless a compiler referee proves it is byte-for-byte identical. Victor Frankenstein never checked his work. Ours checks everything.

**Live site:** [tryfrankenstein.pages.dev](https://tryfrankenstein.pages.dev)

> **Team git rule:** commit only inside your own lane folder, `git pull --rebase` before every push, and push small commits to `main` often. Changes to `contracts/` need a line in `DECISIONS.md` and a ping in the team channel. Nobody force-pushes `main`.

## How it works in 30 seconds

1. **Split.** The Lab builds GBADoom with its own toolchain (devkitARM GCC, the upstream flags minus LTO) and cuts the ROM into anonymous functions named only by address (`fn_08xxxxxx`). No names, no hints.
2. **Dig.** Diggers, agents on Muse Spark, read one function's assembly and write C for it, calling the referee as a tool until it says MATCH. Many dig in parallel.
3. **Doubt.** The Checker trusts nobody. It re-runs every "I matched it" claim with a fresh referee call and screens each match for tricks. Lies get counted, in red.
4. **Prove.** The referee compiles the C and compares every instruction. Byte-identical is MATCH. One wrong register is a K.O.
5. **Learn.** Accepted matches teach generic compiler habits (never answers) to an idiom library in MongoDB Atlas. We measure whether it helps on held-out functions the library never saw. SubQ Snap reads the whole program at once to decide what to dig next, and Fetch.ai ASI:One agents let anyone verify a fix from a chat.

The scoreboard only shows numbers a saved run produced (`runs/*/metrics.json`). Until then the answer is "measured live today".

## Built today / Not ours

| Built today (Nov 7, 2026, after 10:45) | Not ours |
|---|---|
| Everything in `contracts/`, `lab/`, `crew/`, `stage/`, `creature/`, `site/` | **Doom** by id Software; **prBoom** by its authors; **GBADoom** by doomhack (GPL-2.0-or-later). Used only as the hidden answer key, never committed |
| The referee, linter, agents, scenes, overlay, phone page, and the public site | Muse Spark 1.3 (Meta), Agentverse and ASI:One (Fetch.ai), MongoDB Atlas, SubQ (Subquadratic), mGBA, devkitARM, the fonts on the site (Google Fonts) |
| | **Prior work:** the planning kit in `docs/`, including `docs/design_system.html` (visual reference only, never shipped), and the event clock `tools/hackclock.py` |

## The lanes

| Lane | Owner | Owns | Start with |
|---|---|---|---|
| **A · The Lab** (systems, C or build) | Eddy | Installs devkitARM (not agbcc, not Homebrew gcc) and builds GBADoom twice with an identical SHA-1, using its Makefile flags minus `-flto`. Splits the ROM into anonymous `fn_` functions and writes `manifest.json`, the asm files and the context headers. Builds the referee (`check`, `rebuild`, `patch`, `serve`, `mock serve`), which only accepts byte-identical C, plus the fakematch linter. Makes the private variant by editing function bodies in `st_stuff.c`, then the weapon code, and runs the memory probe against both the unmodified and variant builds. Builds the three Fetch.ai agents on ASI:One (Referee, Excavator, Curator), which the Fetch.ai prize requires. | [`docs/LANE_A_LAB.md`](docs/LANE_A_LAB.md) |
| **B · The Crew** (AI or LLM) | Karthik | Builds the Diggers on Muse Spark, which write C for one function until the referee says MATCH, and the Checker, which re-verifies every "I matched it" claim and catches the lies. Builds the idiom library in MongoDB and runs the held-out experiment with the library on versus off. Writes `runs/*/events.jsonl` and `metrics.json` and serves the crew jobs API for Lane A's agents. Optional: the SubQ Cartographer and Archivist narration. | [`docs/LANE_B_CREW.md`](docs/LANE_B_CREW.md) |
| **C · The Stage** (frontend or design) | `[name]` | Builds the retro-game scenes: Title, Split (game plus rebuild), Hi-score, Versus ("K.O. claim rejected") and Time trial (the results), plus a small server that streams `runs/live/events.jsonl` over a websocket with replay at 1–20x. Builds for one laptop screen first, since round one is 3 minutes in a judging room. Uses `design_system.html` as a visual reference only and rebuilds the screens today. | [`docs/LANE_C_STAGE.md`](docs/LANE_C_STAGE.md) |
| **D · The Creature** (game, emulator or video) | `[name]` | Runs GBADoom in mGBA with a Lua tap and a heal overlay where static clears as each subsystem's code is recovered. Hot-swaps the rebuilt ROM into the running game and sets up the OBS scenes. Picks the finale by 1:00 PM: a real visible bug, or the "it can change again" modification. Builds the phone play page with a QR code and records the 60-second demo video, ending on the "Built today / Not ours" card. | [`docs/LANE_D_CREATURE.md`](docs/LANE_D_CREATURE.md) |

The public site in `site/` is owned by whoever is free; Lane C owns the Stage.

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

## Latency

The slow parts are model calls (seconds) and the compiler (~0.1-0.2 s per check). We parallelize Diggers, keep prompts cache-friendly, start easy functions at lower reasoning effort, cache verdicts by source hash, and keep naming and idiom extraction off the critical path. We deliberately did not port anything to Rust or Go: the bottleneck is model latency, not our code.

## Run the foundation

```bash
make setup         # .venv with jsonschema, python-dotenv, pytest
make fixtures      # regenerate contracts/fixtures (deterministic, all marked fixture)
make validate      # validate fixtures, runs/*, lab/out/*.json against the schemas
make test          # contract tests
make sample-runs   # runs/fx01..fx03 + runs/live -> fx01, for Stage/Creature dev
make clock         # print the event schedule
```

Lane entry points: the referee is `python3 -m lab.referee serve` (or `mock serve`), see [`lab/README.md`](lab/README.md); the crew jobs API is `python -m crew.serve [--mock]`, see [`crew/README.md`](crew/README.md).

Preview the site locally with `python3 -m http.server -d site 8000`. Pushes to `main` that touch `site/**` deploy it to Cloudflare Pages through `.github/workflows/pages.yml`.

## Repo map

```
docs/        the kit (plans, lane prompts, design reference)   contracts/  shared contracts, schemas, fixtures, validator
lab/         Lane A        crew/  Lane B        stage/  Lane C        creature/  Lane D        runs/  run output (gitignored)
site/        the public landing page (tryfrankenstein.pages.dev)   tools/  the event clock (prior work)
```

## Evidence rule

Bright means proved by the compiler: match %, checksums, the differing instruction, "1 function changed". Violet with a "?" is our guess: names, descriptions, types. Every screen and every chat answer keeps the two apart.

## License

MIT licensed. See [LICENSE](LICENSE). This repository contains none of GBADoom's code or data. Doom is a trademark of id Software; this project is not affiliated with id Software or doomhack.
