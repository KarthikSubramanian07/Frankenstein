# Frankenstein

**Lost games, rebuilt and proven.**

[![Live site](https://img.shields.io/badge/live-tryfrankenstein.pages.dev-7CF2C8?style=flat-square&labelColor=17141F)](https://tryfrankenstein.pages.dev)
[![License: MIT](https://img.shields.io/badge/license-MIT-FFD23F?style=flat-square&labelColor=17141F)](LICENSE)
[![Built at](https://img.shields.io/badge/built%20at-AI%20Engineer%20Code%20Summit%20hackathon-9A9AFF?style=flat-square&labelColor=17141F)](#built-today--not-ours)
[![First patient](https://img.shields.io/badge/first%20patient-GBADoom-FF5147?style=flat-square&labelColor=17141F)](https://github.com/doomhack/GBADoom)

`#game-preservation` `#matching-decompilation` `#coding-agents` `#multi-agent` `#verification` `#gba` `#muse-spark` `#subquadratic` `#fetch-ai` `#mongodb` `#hackathon`

87% of classic games are endangered, and most of their source code is gone.
Frankenstein's agents rebuild it from the cartridge, one piece at a time.
A compiler checks every byte.

**Live site:** [tryfrankenstein.pages.dev](https://tryfrankenstein.pages.dev)

> Victor Frankenstein never checked his work. Ours checks everything.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/diagrams/how-it-works-dark.svg">
  <img src="docs/diagrams/how-it-works-light.svg" width="1200" alt="How it works: the compiled game, its source lost, goes to a Digger (Muse), which writes C. The Referee compiles it and the Checker re-runs the claim. Rejected work goes back to the Digger; accepted work becomes a rebuilt ROM with the same SHA-1. SubQ Snap steers the loop, and every match adds habits to MongoDB for the next attempt.">
</picture>

## The story in five beats

1. **The patient.** A classic game whose source code is gone. It runs; nobody can fix it.
2. **You ask.** "Bring back Doomguy's face," in an ASI:One chat. SubQ Snap ranked the real face function first (p 0.88).
3. **The crew digs.** Diggers write C and the Checker re-runs every claim. "Matched it. Pretty sure." gets stamped REJECTED.
4. **It's alive.** Recovered functions go back into the ROM. Same SHA-1, or it doesn't ship.
5. **It changes again.** Edit the C, patch one function, and the room plays the fixed game on their phones.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/diagrams/play-to-recover-dark.svg">
  <img src="docs/diagrams/play-to-recover-light.svg" width="1200" alt="Play to recover, a loop of five steps: you play, SubQ Snap picks the function on screen, the crew (Muse) recovers it, the Lab rebuilds the ROM with the same SHA-1, and that region heals on screen while you keep playing.">
</picture>

## Emulators keep games playable. Source code keeps them alive.

87% of classic games released in the US are critically endangered (Video Game History Foundation and Software Preservation Network, 2023). For most of them, only the compiled cartridge survives. It runs, but nobody can fix it.

## How it works

1. **Dig.** Agents read the compiled game and write C, one function at a time.
2. **Check.** A compiler rebuilds every piece. Byte-identical or it's out. Lies get caught.
3. **Learn.** Every match teaches the crew a habit, so the next game goes faster. Habits that stop helping get retired.

> Play it, and we rebuild it. SubQ Snap watches the live game and sends the crew to whatever is on screen.

## The proof

Doom is our first patient: famous, hidden from the agents, scrambled so they can't recite it, and checkable byte for byte.

> **170 of Doom's 568 game functions recovered (29.9%), each proven byte-identical.** That's 6,774 of 141,774 code bytes (4.78%): the crew started with the small functions; the big ones (the face, the renderer) are next on the road.

| What | Result | Source |
|---|---|---|
| Recovered and proven | **170 of 568 functions (29.9%)**, 6,774 of 141,774 code bytes (4.78%); every one re-verified by the referee, 0 rejected | `crew/exports/union/UNION.json` |
| Rebuilt game | 169 agent-written functions spliced into the ROM, 399 original: **SHA-1 identical** (`d936259b…`), verified on two machines (the 170th runs from IWRAM, which the ROM rebuild doesn't splice) | `DECISIONS.md` 14:52 |
| Trust but verify | **24 lies caught**, **30 fakes rejected**, **0 fakes accepted** across 33 finished runs | `python3 tools/counts.py` |
| Didn't it just remember Doom? | From memory alone, 0 of 20 functions compiled. Given the real headers and compiler errors, 3 of 20 matched, none of them functions we'd changed | `lab/out/memory_probe.json`, `DECISIONS.md` 13:28 |
| Held-out (functions the crew never trained on) | Library on vs off: 29 vs 29 of 40 easy, 6 vs 6 of 20 hard. **No measured gain, so we don't claim one.** Run over run, warm start, salvage and the permuter turned near-misses into matches | `crew/EXPERIMENTS.md` |
| Snap router, "Doomguy's face" | The real face function ranked #1 (p 0.88), checked afterwards against the hidden map | `DECISIONS.md` |
| Referee | 0.1 to 0.2 s per check | `DECISIONS.md` |

**Evidence rule.** Bright means proved by the compiler. Violet with a "?" means our guess.

## Agents lie. The referee doesn't.

Every "I matched it" is re-run by the Checker with a fresh compile. A match that doesn't hold is rejected with the first instruction that differs, and counted. The referee has never told a joke.

## Sponsors are the organs, not the logos

| Partner | Role | One line |
|---|---|---|
| Meta Model API (Muse Spark, Muse Wonder) | The hands | Writes every line of recovered C. |
| Subquadratic (SubQ Snap) | The judgment | Reads the whole game at once and decides where every attempt goes. |
| Fetch.ai (ASI:One) | The front door | Ask for a recovery in a chat. Get proof back. |
| MongoDB Atlas | The memory | Remembers every trick, so the next game is faster. |
| Google Gemini | The second opinion | A different lab double-checks every match. It also rendered every illustration on the site, today (`site/tools/generate_art.py`). |

## Talk to our agents in ASI:One

Two agents run on Agentverse with the Agent Chat Protocol. Open [asi1.ai](https://asi1.ai), start a chat and mention one of them.

| Agent | Address | What it does |
|---|---|---|
| `frankenstein-referee` | `agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0` | Compiles your C and checks it against Doom's original bytes. Reports progress and proves the rebuild. |
| `frankenstein-excavator` | `agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp` | Starts a recovery with the crew, then asks the Referee agent for the verdict before it answers you. |

Things to ask:

- "@frankenstein-referee How much of DOOM is back?"
- "@frankenstein-referee Prove the rebuild is exact" (you get both SHA-1 checksums)
- "@frankenstein-referee Does this C match fn_0801C130?", followed by a ```` ```c ```` block. A wrong guess comes back REJECTED with the first instruction that differs.
- "@frankenstein-excavator Recover fn_08004DA8"

Every reply keeps what the compiler proved (Observed) apart from our guesses (Inferred). The agents run on Eddy's laptop, so they answer while it's on and the referee is up. Setup is in [`lab/README.md`](lab/README.md).

## Built today / Not ours

| Built today (Nov 7, 2026, after 10:45 PT) | Not ours |
|---|---|
| Everything in `contracts/`, `lab/`, `crew/`, `stage/`, `creature/`, `site/` | **Doom** by id Software; **prBoom** by its authors; **GBADoom** by doomhack (GPL-2.0-or-later), used only as the hidden answer key and never committed |
| The build and split, referee and linter, agents, Stage scenes, emulator overlay, phone page and site | Muse Spark and Muse Wonder (Meta), SubQ Snap (Subquadratic), ASI:One and Agentverse (Fetch.ai), MongoDB Atlas, Gemini (Google), mGBA, devkitARM, Google Fonts |
| | **Prior work:** the planning kit in `docs/` (including `docs/design_system.html`, a visual reference only) and the event clock `tools/hackclock.py` |

## The team

| Lane | Owner | What it does |
|---|---|---|
| **A · The Lab** | Eddy | Builds the game, runs the referee, hosts the ASI:One agent. [`lab/`](lab/README.md) |
| **B · The Crew** | Karthik | The Diggers, the Checker, Snap steering and the idiom library. [`crew/`](crew/README.md) |
| **C · The Stage** | | The live show, driven only by the event stream. [`stage/`](stage/README.md) |
| **D · The Creature** | Enzo | Doom in an emulator, healing as its code comes back, plus the phone page. [`creature/`](creature/README.md) |

[`DECISIONS.md`](DECISIONS.md) is the engineering log.

## Architecture

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/diagrams/system-dark.svg">
  <img src="docs/diagrams/system-light.svg" width="1200" alt="System: someone asks in ASI:One, the Lab (referee, :7101) hands the job to the Crew (:7111), and the Crew asks the Lab to check every attempt. The Lab and the Crew write to one event stream, events.jsonl. The Stage (:7202) reads it to run the show, and the Creature (:7401) reads it to heal the game and writes back when it swaps the ROM. Lanes share nothing but the event stream.">
</picture>

<details>
<summary>Plain-text version, for terminals</summary>

```text
  lab/secrets/   answer key · gitignored · only the referee reads it
                │
                ▼
┌─ A · LAB  (referee) ─────────┐                          ┌─ B · CREW  (agents) ─────────┐
│ check · rebuild · patch      │ ─ manifest · asm · ctx ▶ │ Diggers · Muse Spark         │
│ serve :7101                  │                          │ Checker · SubQ Snap gate     │
│ ASI:One agents · Fetch.ai    │ ◀──── POST /check ────── │ Snap triage · escalate       │
│                              │  POST /jobs  (ASI:One) ▶ │ jobs API :7111               │
└───────────────┬──────────────┘                          └───────────────┬──────────────┘
                │                                                         │ appends
                │                                                         │
                │                                                         ▼
                │ build.rom             ┌─────────────────────────────────┴────────────────┐
                │ patched.gba           │  runs/live/events.jsonl · metrics.json           │
                │                       └───────┬─────────────────────────┬────────────────┘
                │                               │                         │
                │                               │                         │ tail · ws :7202
                │                               │                         │
                │                               │                         │
                ▼                               │                         ▼
┌─ D · CREATURE  (game) ───────┐                │         ┌─ C · STAGE  (show) ──────────┐
│ mGBA · heal overlay          │◀─ fn.matched ──┘         │ Title · Split · Versus       │
│ hot-swap · bug fix           │                          │ Time trial · Ending          │
│ heartbeat ▶ crew :7112       │                          │ replay 1-20x                 │
│                              │                          │                              │
└───────────────┬──────────────┘                          └───────────────┬──────────────┘
                │                                                         │
                ▼                                                         ▼
         phones · video                                                judges · projector
```

</details>

Lanes share only what is in [`contracts/CONTRACTS.md`](contracts/CONTRACTS.md): file shapes (JSON Schema in `contracts/schemas/`), the referee and crew HTTP APIs, and the append-only `runs/<run_id>/events.jsonl`. Every lane builds against `contracts/fixtures/` from minute one.

## Why it's fast enough

The slow parts are model calls (seconds) and the compiler (0.1 to 0.2 s). So we parallelize Diggers, cache prompts and verdicts, and start easy functions at lower effort. We didn't port anything to Rust or Go: the bottleneck is the model, not our code.

## How to run

```bash
make setup         # .venv with jsonschema, python-dotenv, pytest
make fixtures      # regenerate contracts/fixtures (deterministic, all marked fixture)
make validate      # validate fixtures, runs/*, lab/out/*.json against the schemas
make test          # contract tests
make sample-runs   # runs/fx01..fx03 + runs/live -> fx01, for Stage/Creature dev
make clock         # print the event schedule
```

- Referee: `lab/setup_referee.sh`, then `python3 -m lab.referee serve`. See [`lab/README.md`](lab/README.md).
- Crew: `python -m crew.run`, and `python -m crew.serve` for the jobs API. See [`crew/README.md`](crew/README.md).
- Site: `python3 -m http.server -d site 8000`. Pushes to `main` that touch `site/**` deploy to Cloudflare Pages.

## Repo map

```
docs/        planning kit (prior work)            contracts/  shared schemas, fixtures, validator
lab/         Lane A: build, referee, agent        crew/       Lane B: agents and experiments
stage/       Lane C: the live show                creature/   Lane D: emulator, overlay, phone
site/        public landing page                  runs/       run output (gitignored)
tools/       event clock (prior work)
```

## Contributing

Commit inside your lane folder, `git pull --rebase` before every push, never force-push `main`. Contract changes need a line in `DECISIONS.md`.

## New Game+

Anywhere the only thing left is the compiled program, Frankenstein can bring the source back. Games don't have to die.

## License

MIT. See [LICENSE](LICENSE). This repo contains none of GBADoom's code or data. Doom is a trademark of id Software; we are not affiliated with id Software or doomhack.
