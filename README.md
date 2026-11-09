# Frankenstein

**AI agents rebuild a game's lost source code, one function at a time, and a compiler accepts only byte-identical pieces.**

[![Live site](https://img.shields.io/badge/live-tryfrankenstein.pages.dev-7CF2C8?style=flat-square&labelColor=17141F)](https://tryfrankenstein.pages.dev)
[![Demo film](https://img.shields.io/badge/film-1%20minute-F2A97C?style=flat-square&labelColor=17141F)](https://www.youtube.com/watch?v=yi0_hTj1lkg)
[![License: MIT](https://img.shields.io/badge/license-MIT-FFD23F?style=flat-square&labelColor=17141F)](#license)

**[Website](https://tryfrankenstein.pages.dev)** · [How it works](https://tryfrankenstein.pages.dev/#how) · [Partners](https://tryfrankenstein.pages.dev/#partners) · [Proof](https://tryfrankenstein.pages.dev/#numbers) · [Credits](https://tryfrankenstein.pages.dev/#credits) · [For judges](https://tryfrankenstein.pages.dev/judges) · [Demo film](https://www.youtube.com/watch?v=yi0_hTj1lkg)

For most classic games, only the compiled cartridge survives: 87% of classic games released in the US are critically endangered (Video Game History Foundation and Software Preservation Network, 2023). The game still runs, but nobody can fix, port or study it.

Frankenstein points coding agents at the compiled game. They write C for each function, and a referee compiles it with the original toolchain. A piece counts only if its bytes match the original exactly. When an agent claims a match that isn't real, the claim is caught and counted.

Our first game is [**GBADoom**](https://github.com/doomhack/GBADoom), the Game Boy Advance port of Doom. The same method works anywhere only the compiled program survives.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/diagrams/how-it-works-dark.svg">
  <img src="docs/diagrams/how-it-works-light.svg" width="1200" alt="How it works: the compiled game, its source lost, goes to a Digger (Muse), which writes C. The Referee compiles it and the Checker re-runs the claim. Rejected work goes back to the Digger; accepted work becomes a rebuilt ROM with the same SHA-1. SubQ Snap steers the loop, and every match adds habits to MongoDB for the next attempt.">
</picture>

## Results


| | Result | Source |
|---|---|---|
| Functions recovered | **235 of 568 (41.4%)**. Each one is byte-identical and was re-verified by the referee. | `crew/exports/union/UNION.json` |
| Code bytes recovered | **11,900 of 141,774 (8.39%)**. The agents started with the small functions; the big ones (renderer, status-bar face) are still open. | same |
| Rebuilt ROM | All 235 agent-written functions plus 333 original ones, linked into one ROM: **SHA-1 identical** to the original (`d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`). Verified on two machines. | `DECISIONS.md`, 16:11 and 16:12 |
| False claims | **39 caught.** **32 fake matches rejected, 0 accepted.** Across 36 finished runs. | `python3 tools/counts.py` |
| Did the model just recite Doom? | From memory alone, 0 of 20 functions compiled. With the real headers and compiler errors, 3 of 20 matched. On the 4 functions we had secretly changed, 0 matched from memory. | `lab/out/memory_probe.json` |
| Does the shared habit library help? | On held-out functions: 29 vs 29 of 40 easy, 6 vs 6 of 20 hard, library on vs off. **No measured gain, so we don't claim one.** | `crew/EXPERIMENTS.md` |
| Referee speed | 0.1 to 0.2 s per check. | `DECISIONS.md`, 11:24 |

## How it works

1. **Split.** The Lab builds GBADoom with a pinned devkitARM GCC and splits the ROM into 568 anonymous functions (`fn_0801B298`, …). The real source is the answer key. It lives in the gitignored `lab/secrets/`, and only the referee reads it.
2. **Dig.** Digger agents (Meta Muse Spark) read each function's disassembly and write C. SubQ Snap decides which function to try next and when to escalate.
3. **Check.** The referee compiles the C and compares bytes. Anything other than an exact match is rejected, along with the first instruction that differs. The Checker then re-runs every "I matched it" claim with a fresh compile and lints for fake matches, such as inline assembly or hard-coded addresses. Gemini reviews each accepted match as a second opinion.
4. **Rebuild.** Every proven function is linked back into the ROM. The result must have the same SHA-1 as the original.

To stop the agents from reciting GBADoom's public source from memory, the target build carries 11 small source edits of ours. Those edits are kept private until after judging.

Everything is Python except the Stage and the phone page. Model calls take seconds and a referee check takes 0.1 to 0.2 s, so the speed work is parallel Diggers, cached prompts and verdicts, and lower effort on easy functions.

## Quick start

You need Python 3, Node and `make`. These steps work offline and make no model calls.

```bash
git clone https://github.com/KarthikSubramanian07/Frankenstein.git
cd Frankenstein
make setup      # create .venv with the dev dependencies
make test       # contract tests
```

To replay a finished run on the Stage, the live show page:

```bash
cd stage && npm install
npm run server            # http :7201, ws :7202
npm run dev               # then open http://127.0.0.1:5173/?replay=doom_r12&speed=8
```

The team demo machine uses `make up` (start every lane, replay mode by default), `make status` and `make down`. The real referee needs the devkitARM container (`lab/setup_referee.sh`, Docker) and the private answer key, so outside the team use the fixture-backed mock with `python3 -m lab.referee mock serve --port 7101`. See [`lab/README.md`](lab/README.md).

Other entry points:

- Crew: `python -m crew.run` for a run, `python -m crew.serve` for the jobs API. Offline tests: `make test-crew`. See [`crew/README.md`](crew/README.md).
- Site: `python3 -m http.server -d site 8000` for the pages, or `npx wrangler pages dev site` to include the Worker that serves Markdown to agents (`site/_worker.js`). Site tests: `make test-site`. Pushes to `main` that touch `site/**` deploy to Cloudflare Pages.
- `make help` lists every target.

On the Stage and the site, bright text means the compiler proved it. Violet with a "?" means it's our guess, such as a guessed function name.

## Ask the agents in ASI:One

Two agents run on Fetch.ai's Agentverse. Open [asi1.ai](https://asi1.ai) and mention one of them. They only answer while the Lab laptop is on and the referee is running.

| Agent | Address |
|---|---|
| `frankenstein-referee` | `agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0` |
| `frankenstein-excavator` | `agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp` |

Try "@frankenstein-referee How much of DOOM is back?" or "@frankenstein-referee Prove the rebuild is exact". You can also paste a C function and ask whether it matches `fn_0801C130`; a wrong guess comes back REJECTED with the first instruction that differs. To start a recovery, try "@frankenstein-excavator Recover fn_08004DA8". Every reply keeps what the compiler proved (Observed) apart from guesses (Inferred).

## Architecture

The repo has four lanes. They share only the contracts in [`contracts/CONTRACTS.md`](contracts/CONTRACTS.md): JSON schemas, two HTTP APIs and an append-only `runs/<run_id>/events.jsonl`.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="docs/diagrams/system-dark.svg">
  <img src="docs/diagrams/system-light.svg" width="1200" alt="System: someone asks in ASI:One, the Lab (referee, :7101) hands the job to the Crew (:7111), and the Crew asks the Lab to check every attempt. The Lab and the Crew write to one event stream, events.jsonl. The Stage (:7202) reads it to run the show, and the Creature (:7401) reads it to heal the game and writes back when it swaps the ROM.">
</picture>

| Folder | Lane | Owner | What's in it |
|---|---|---|---|
| [`lab/`](lab/README.md) | A · Lab | Eddy | Build and split, referee (:7101), fake-match linter, rebuild, ASI:One agents |
| [`crew/`](crew/README.md) | B · Crew | Karthik | Diggers, Checker, Snap routing, habit library (MongoDB Atlas), jobs API (:7111), run exports |
| [`stage/`](stage/README.md) | C · Stage | Aidenn | The live show: a log driven only by the event stream, replays at 1–20x (:5173, :7201/7202) |
| [`creature/`](creature/README.md) | D · Creature | Enzo | Doom in mGBA, heal overlay, ROM hot-swap, phone play page (:7401) |
| `contracts/` | shared | | Schemas, fixtures, validator |
| `site/` | shared | | [tryfrankenstein.pages.dev](https://tryfrankenstein.pages.dev), deployed from `main` |
| `tools/` | shared | | `frank.py` (`make up/down/status`), `counts.py` (official tallies) |

The engineering log is [`DECISIONS.md`](DECISIONS.md).

## Partners

| Partner | What it does here |
|---|---|
| Meta Model API (Muse Spark, Muse Wonder) | Writes the recovered C |
| Subquadratic (SubQ Snap) | Picks the next function, routes requests like "Doomguy's face" (ranked the real face function first, p 0.88), and gates claims |
| Fetch.ai (ASI:One, Agentverse) | The chat front end and the two agents above |
| MongoDB Atlas | Stores the habit library shared across runs |
| Google Gemini | Second-opinion review of accepted matches; also generated the site's illustrations (`site/tools/generate_art.py`) |

## What we built at the hackathon & what we did not build

Built at the AI Engineer Code Summit hackathon, Nov 7, 2026, after 10:45 PT: the code in `contracts/`, `lab/` (except `lab/out/`, see below), `crew/`, `stage/`, `creature/`, `site/` and `tools/` (except `tools/hackclock.py`).

What we did not build:

- **Doom** by id Software, **PrBoom** by its authors, and **GBADoom** by doomhack (GPL-2.0-or-later).
- **`lab/out/`** is derived from GBADoom: the `.gba` builds, plus the per-function disassembly in `asm/` and the headers in `ctx/`. It is GPL, not MIT. See [`lab/out/GPL_NOTICE.md`](lab/out/GPL_NOTICE.md). No game data (WAD) is included.
- **Tools and services:** mGBA, devkitARM, Muse Spark and Muse Wonder (Meta), SubQ Snap, ASI:One and Agentverse, MongoDB Atlas, Gemini, and Google Fonts.
- **Prior work, made before the event:** the planning kit in `docs/` (including `docs/design_system.html`, used only as a visual reference) and the event clock `tools/hackclock.py`.

## Contributing

Commit inside your lane's folder. Run `git pull --rebase` before every push, and never force-push `main`. Contract changes need a line in `DECISIONS.md`.

## License

Our code is MIT, see [LICENSE](LICENSE). The files in `lab/out/` are derived from GBADoom and are GPL-2.0-or-later, see [`lab/out/GPL_NOTICE.md`](lab/out/GPL_NOTICE.md). Doom is a trademark of id Software. We are not affiliated with id Software or doomhack.
