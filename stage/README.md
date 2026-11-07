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
| `?scene=title\|split\|versus` | start on a scene (hiscore, timetrial, ending: coming) |
| `?replay=fx01&speed=8` | replay a finished run dir at 1–20x instead of tailing `runs/live` |
| `&t=240` | replay: start 240 s into the run (earlier events load instantly) |
| `?obs=1` | transparent background for OBS (left 1000 px of Split shows the game capture underneath) |

Keys: `0` Title · `1` Split · `2` Versus · `space` on Title = start · `m` mute.

## What reads what

- **Server** (`server/index.mjs`): tails `runs/live/events.jsonl`, follows the symlink when it moves, rebuilds from the full file on truncation, and sends every line unchanged over ws :7202 after a `stage.hello` (contracts §8). Replay mode paces a finished file by its `ts` at 1–20x. HTTP :7201 serves `runs/<id>/{metrics,names}.json`, `/metrics` (all runs), and `/lab/{viz_map,manifest,memory_probe}` (real `lab/out` files for real runs, `contracts/fixtures` samples for fixture runs).
- **Page** (`src/`): `state.ts` is a pure reducer over events; every number on screen comes from it, `names.json`, or the lab files. Fixture data shows **SAMPLE DATA** in a corner; replay shows **REPLAY · Nx**; a dropped socket shows **NO SIGNAL**.

## Scenes so far

- **Split** (`?scene=split`): HUD (recovered, lies, time from event timestamps), game frame for the mGBA capture, the "NOW RUNNING ON NN% AGENT-WRITTEN CODE" badge from `rom.swapped`, per-subsystem recovery from `viz_map.json`, six newest Hi-score rows (inferred names in guess violet with `?`), the active Digger's C streaming in, verdict stamps, a picture-in-picture Versus card on every false claim, the cartridge meter (one cell per manifest function), and a pixel beam from each recovered row to its screen region with a coin sound.
- **Versus** (`?scene=versus`): Digger vs Referee for the latest false claim (`verdict.claim_was_true === false`): claim % vs proof 100%, the expected and produced instruction with the differing operand in red, the Digger's own claim words, K.O.
- **Title** (`?scene=title`): logo, save-file menu fed from the run (`FILE 1 DOOM NN%`, lies caught), PRESS START.

Fonts (all OFL, from Google Fonts) are self-hosted in `public/fonts/` so the Stage works offline. Sounds are synthesized square waves.
