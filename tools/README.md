# tools/

`tools-cli` `orchestration` `demo-ops` `stdlib-only`

**One command. Every lane. One board.**

Four lanes, ten processes, eleven ports. `frank` starts them in order, checks each one's health, and shows the whole product on one screen. It only runs each lane's own documented entry point. It never edits a lane.

| File | What it is |
|---|---|
| `frank.py` | Brings the product up, shows the status board, takes it down, runs the demo preflight. Python 3.11+, stdlib only. |
| `rehearse.mjs` | Walks `docs/DEMO_SCRIPT.md` beat by beat against the running Stage, presses the scene keys, screenshots each beat at 1920×1080 into `runs/_rehearsal/<time>/` and lists what a judge would miss. Uses Lane C's `playwright-core` and the local Chrome. |
| `hackclock.py` | The event clock (prior work, see `DECISIONS.md`). |

## Use it

```bash
make preflight                               # the demo checklist, checked where it can be
make up                                      # replay the first real Doom export (no model spend)
make up RUN=crew/exports/doom_r01            # replay a specific export or runs/<id>
make up MODE=live ARGS=--yes-spend           # live: the budgeted crew run plus Play to recover (spends money)
make status                                  # the board
make down                                    # stop what `make up` started
make rehearse                                # walk the 3:00 judging cut on replay: stopwatch + screenshot per beat (PACE=0.25: 45 s)
make demo-live                               # the live micro-segment (2 small functions, ~$0.05); the judge presses Enter
python3 tools/frank.py logs bridge -n 60     # one service's log
python3 tools/frank.py status --json         # the board, for scripts
```

`make` can't take `--flags`, so the Makefile uses variables: `MODE`, `RUN` and `ARGS` (for example `ARGS="--no-agent"`
or `ARGS='--yes-spend --crew-args="--live --director --split heldout --library on --budget-usd 2"'`; the `=` matters,
and `FRANK_LIVE_ARGS` in the environment does the same).

## What `up` starts, in order

| # | Service | Lane | Port | Health | Command |
|---|---|---|---|---|---|
| 1 | referee | A | 7101 | `GET /health`, not mock | `bash lab/setup_referee.sh` once, then `python -m lab.referee serve` |
| 2 | crew-api | B | 7111 | `GET /health` | `python -m crew.serve --port 7111` |
| 3 | stage-server | C | 7201, 7202 | `GET /health` | `npm run server` in `stage/` (`npm install` first if `node_modules` is missing) |
| 4 | stage-page | C | 5173 | `GET /` | `npm run dev` in `stage/` |
| 5 | bridge | D | 7301, 7300, 7304 | `GET :7304/health` | `python -m creature.bridge --events runs/live/events.jsonl ...` |
| 6 | overlay | D | 7302 | `GET /` | `python creature/overlay/serve.py` |
| 7 | phone | D | 7401 | `GET /` | `python server.py` in `creature/phone/` (needs `core/`; `FRANK_PHONE_ROM=<rom>` adds `--rom`) |
| 8 | asi-agent | A | 8001 | port | `bash lab/agents/run_agent.sh`, only with `AGENTVERSE_API_KEY` and `FRANKENSTEIN_AGENT_SEED` in `.env` |
| 9 | crew-live | B | 7112 | `GET /heartbeat` | live only: `python -m crew.run --live --director --split train --library learning --library-path runs/_doom_lib.json --diggers 6 --max-size 200 --budget-usd 4` |
| 10 | director-feed | D | none | process | live only: `python -m creature.bridge.director_adapter --forward --shots-root creature/shots` |

Rules it keeps:
- **Healthy is left alone.** If something already answers on its port (a teammate's referee, say), `up` skips it and `down` never touches it.
- **Missing is said plainly.** A lane that isn't ready shows `!` or `○` with the exact command it expects, and everything else still comes up.
- **Replay spends nothing.** `runs/live` switches atomically (symlink rename, like `crew.run --live`) to a finished run. An export also gets a `runs/<id>` alias, so the Stage's `?replay=<id>` works.
- **Live asks first.** `MODE=live` refuses to start the crew run without `--yes-spend`.
- **The agent keeps its name.** Without `FRANKENSTEIN_AGENT_SEED`, `run_agent.sh` would mint a new agent address, so frank skips it.

Logs go to `runs/_logs/<service>.log` and pids to `runs/_pids.json` (both gitignored). Each service runs in its own process group, so `down` stops npm and its children together.

## The board

```
  SERVICE         LANE        PORT            PID    HEALTH / NOTE
  ✓ referee       A lab       7101            47108  mock=False (already running: python3.14)
  ✓ crew-api      B crew      7111            60545  mock=False model=muse-spark-1.3
  ✓ stage-server  C stage     7201/7202       60546  live=doom_r01
  ...
  ON STAGE
  run          doom_r01  ← runs/live -> ../crew/exports/doom_r01
  matched      28/30 (93.3%) · 2 abandoned
  lies caught  0
  cost         $0.73 · 4.5 min
```

The run block reads `runs/live/events.jsonl` only: matched counts unique `fn.matched` ids, lies counts verdicts with
`claim_was_true: false`, and cost comes from the last `metric.tick` or `run.finished`. Fixture runs say SAMPLE DATA.

## Preflight

Checked: keys present in `.env` (never printed), Node and Python deps, the referee container, the referee is real
and re-proves one recovered function from the export byte for byte, the export's file hashes match `EXPORT.json`,
the face function's status, `contracts/validate.py`, `npm run build` for the Stage, and every port free or held by its
own healthy service. Listed for you to tick: mGBA with the tap, controller, OBS scene, phone, ASI:One chat,
display, and the Built today / Not ours card.

The story these services tell, step by step: [`docs/STORY.md`](../docs/STORY.md).

## Rehearse and the live segment

`make rehearse` replays a finished run (no spend) and checks each beat of the judging cut: the phone page has a ROM,
the Stage shows the expected words, Versus has a real lie, the Ending has a rebuild proof, and the Stage didn't
hot-reload mid-demo. `make demo-live` checks that the referee is real and that no other live run is on stage,
prints the rehearsed timing, waits for the judge's Enter, then runs `python -m crew.demo --pick 2 --live`
(`ARGS=--no-live` keeps the Stage on its replay, `ARGS=--yes` skips the Enter).

## Road to 100% (site meter and Stage ROAD scene)

After every `python -m crew.union`, one line refreshes the site's road meter and redeploys it:

```bash
site/tools/sync_union.sh --deploy
```

It copies `crew/exports/union/UNION.json` to `site/data/union.json` (exact copy), re-runs `tools/close_tier.py`
(the separate "close, not proven" tier in `crew/exports/union/CLOSE.json`: best attempt at least 90%, never matched,
never counted), writes `site/data/road.json` with `stage/server/road.mjs`, then runs
`npx --yes wrangler@4 pages deploy site --project-name tryfrankenstein --branch main --commit-dirty=true`.
Without `--deploy` it only syncs. The Stage reads the same summary live from `GET :7201/road` (key `6`, or `?scene=road`).
