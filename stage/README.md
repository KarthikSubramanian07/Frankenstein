# Lane C · The Stage (UI)

Game scenes that make the recovery visible, driven only by the run event stream (`runs/*/events.jsonl`).
Start with [`docs/LANE_C_STAGE.md`](../docs/LANE_C_STAGE.md), after [`DECISIONS.md`](../DECISIONS.md) and [`contracts/CONTRACTS.md`](../contracts/CONTRACTS.md).

## Run it

```sh
make sample-runs          # once: runs/live -> runs/fx01 (fixture run)
cd stage && npm install
npm run server            # http :7201, ws :7202
npm run dev               # http://127.0.0.1:5173
npm test                  # reducer + server tests
npm run shots             # screenshots of every scene at 1920x1080 and 1280x720 into stage/shots/
```

## URL parameters

| Param | Meaning |
|---|---|
| `?scene=title\|split\|hiscore\|versus\|timetrial\|ending` | start on a scene |
| `?replay=fx01&speed=8` | replay a finished run dir at 1–20x instead of tailing `runs/live` |
| `&t=240` | replay: start 240 s into the run (earlier events load instantly) |
| `?obs=1` | transparent background for OBS (Split's game window is x 20, y 92, 960×640) |
| `?scene=ending&page=credits` | the Built today / Not ours card |

Keys: `0` Title · `1` Split · `5`/`h` Hi-score · `2` Versus · `3` Time trial · `4` Ending · `space` = start on Title, credits on Ending · `m` mute.

## Checks

`npm test` (counters equal a recount of the fixture file; the server forwards every line unchanged), `npm run qa` (every scene: no text under 28 px, clipped, off-stage or under the corner mark), `npm run shots` (1920×1080 and 1280×720 into `shots/`). `qa` and `shots` need `dev` and `server` running.

## What reads what

- **Server** (`server/index.mjs`): tails `runs/live/events.jsonl`, follows the symlink when it moves, rebuilds from the full file on truncation, and sends every line unchanged over ws :7202 after a `stage.hello` (contracts §8). Replay paces a finished file by its `ts` at 1–20x. HTTP :7201 serves `runs/<id>/{metrics,names}.json`, `/metrics` (all runs), `/lab/{viz_map,manifest,memory_probe}` (real `lab/out` files for real runs, `contracts/fixtures` samples for fixture runs) and `/file?path=` (PNGs under `creature/` only, for the QR).
- **Page** (`src/`): `state.ts` is a pure reducer over events; every number comes from it, `names.json`, `metrics.json` or the lab files. Sample data shows **SAMPLE DATA** in a corner; replay shows **REPLAY · Nx**; a dropped socket shows **NO SIGNAL**.

## Scenes

- **Title**: logo, save-file menu fed from the run (`FILE 1 DOOM NN%`, lies caught), PRESS START.
- **Split** (home): game window for the mGBA capture, the one hero number under it (NOW RUNNING ON NN% AGENT-WRITTEN CODE, from `rom.swapped`), the hi-score table (guessed names violet with `?`), the active Digger's C with verdict stamps and a picture-in-picture Versus card on false claims, the cartridge meter, and a beam from each recovered row to its screen region with a coin sound.
- **Hi-score**: 1UP / HI-SCORE / LIES, the table, one hero number (% of the game recovered), the cartridge meter. A false claim shows a red liar row, cuts to Versus for 4 s and comes back. 25/50/75/100% are announced once.
- **Versus**: Digger vs Referee for each false claim: claim % vs proof 100%, expected vs produced instruction with the wrong operand in red, the Digger's own words, K.O.
- **Time trial**: lap board (min and cost per piece per run; lap record only within a split), held-out % for library on vs the library-off ghost, a road where each car's position is its match rate, the memory test plate and the Muse Spark powered-by line.
- **Ending**: true % recovered, original and rebuilt SHA-1, IDENTICAL only when proved, patch notes, the phone QR, and the Built today / Not ours card.

Fonts (all OFL, from Google Fonts) are self-hosted in `public/fonts/` so the Stage works offline. Sounds are synthesized square waves; the announcer uses the browser's speech voice.
