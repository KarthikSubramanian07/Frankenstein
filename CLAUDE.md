# FRANKENSTEIN: context for every Claude Code session in this repo

## Current implementation assignment: Pokémon Red opening slice

Enzo explicitly requests implementation checkpoints for the bounded Pokémon demonstration. Every active lane must read [docs/POKEMON_IMPLEMENTATION.md](docs/POKEMON_IMPLEMENTATION.md), take its assigned technical task and acknowledge STARTED, QUEUED AFTER DOOM (specific gate), or BLOCKED (exact input). Preserve Doom's working demo and deliver it first; prepare the independent Pokémon adapter/map/player work in parallel.

The next checkpoint should contain runnable code or target evidence, not another target-selection essay. Further legal research is outside the coding agents' assigned spike; route unresolved rights/event/distribution decisions to the human team. Keep proof, provenance and actual device-support claims accurate.

Lost games, rebuilt and proven. AI agents rebuild a classic game's lost source code from the compiled game, one
function at a time, and a compiler accepts only byte-identical pieces. Doom (GBADoom) is our first patient.
Hackathon: AI Engineer Code Summit, Shack15 SF, Sat Nov 7 2026. Hacking 10:45 to 17:00. Freeze 14:55, record
16:10, submit 16:30 (`make clock`; a hook prints the current phase on every prompt).

## Read before you write anything public

- `docs/MESSAGING.md`: the one voice (About, hero, zingers, problem statements, sponsor tracks, judge Q&A).
  Short sentences, games first, zingers over paragraphs.
- `DECISIONS.md`: the engineering log. Newer entries win. Contracts in `contracts/CONTRACTS.md` + `contracts/schemas/`.
- `docs/PLAYBOOK_LESSONS.md`: event rules and what wins.

## Win conditions (optimize everything for these)

- Round one judging: Technical Demo 35%, Implementation Difficulty 30%, Impact 20%, Creativity 15%. 3-minute
  demo on one laptop in a judging room; top six go to the stage.
- Problem statements, answered literally on screen: Software Archaeology (rebuild from the compiled game),
  Trust but Verify (Checker catches the agents' lies; two labs screen every match), The System That Gets Better
  (held-out functions, library on vs off).
- Sponsors are load-bearing organs, never logos: Muse (Meta) writes every line; SubQ Snap is the judgment
  (triage, escalate/abandon, fake gate, Play-to-recover director, eyes, router); Fetch.ai ASI:One is the front
  door (whole workflow in chat, observed vs inferred); MongoDB Atlas is the memory; Gemini is the second opinion.

## Rules that can disqualify us

- Identify our original contributions: README, demo and video carry "Built today / Not ours".
- New work only: code written after 10:45 today. Planning docs in `docs/` and `tools/hackclock.py` are prior work.
- Never call it a dashboard. No code, data or assets we lack rights to (no commercial ROMs, ever).

## Honesty rules

- Never fake a match, a curve or a number. Numbers only from `runs/*/metrics.json`, `lab/out/*.json` or
  `DECISIONS.md`. Mock, fixture and bench data are labelled as such. Names are inferred and shown with "?".
- The crew never reads `lab/secrets/`, `crew/bench/answers/` or `lab/out/viz_map.json` (`crew/guard.py`).

## Coordination protocol (all lanes, every agent; added 12:35 by Lane A at Eddy's request)

We can't talk to each other's agents except through git. Treat the repo as the team channel:

- **Pull often:** `git pull --rebase --autostash` at least every 10 minutes and before every push.
- **After every pull, read what changed for you:** new `DECISIONS.md` entries, and the "Requests to <your lane>" sections in the other lanes' `HANDOFFS.md` (`lab/`, `crew/`, `stage/`, `creature/`). Act on requests addressed to you without waiting to be asked twice.
- **Answer in your own lane:** keep `<lane>/HANDOFFS.md` with "Responses to X" (numbered to match their requests) and "Requests from <you>" (imperative, specific, with file paths and ids), plus `<lane>/STATUS.md` (what is verified now, what's next, what's blocked, ETAs). If a lane has no such files yet, create them. Comment on that lane's GitHub issue when someone has to act.
- **Commit small and often:** every working step, at least every 20 minutes, pushed right away. Unpushed work is invisible to the other agents.
- **Announce breaking changes before making them:** ids, contracts, ports, file paths. Add a `DECISIONS.md` line and a "Notices to all lanes" entry.

## Team rules

- Lanes: A `lab/` (Eddy), B `crew/` (Karthik), C `stage/` (Aidenn8), D `creature/` (Enzo). Commit only in your
  lane; contract changes need a `DECISIONS.md` line.
- `git pull --rebase --autostash` before every push. Never force-push `main`. Coordinate through GitHub only.
- Everything is public and judge-facing: commit messages are clear, specific and imperative. No AI co-author
  trailers. Secrets live only in `.env` (gitignored).
- Python stays: the bottleneck is model latency, not our code.

<!-- murmur:start -->
## Murmur
This repo uses Murmur, a cross-device, intra-repo communication channel for contributing coding agents like yourself. If you have not joined Murmur yet, you should.

- To join Murmur (ask your user first): https://raw.githubusercontent.com/a-Fig/murmur/main/docs/agents/join.md
- To use Murmur: https://raw.githubusercontent.com/a-Fig/murmur/main/docs/agents/use.md
<!-- murmur:end -->
