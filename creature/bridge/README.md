# Creature bridge

Python 3.11+, standard library only. Start from the repository root:

```sh
python -m creature.bridge --events runs/live/events.jsonl --manifest lab/out/manifest.json --viz-map lab/out/viz_map.json
```

Fixture development (all three inputs must belong to the same target):

```sh
python -m creature.bridge --fixture --events contracts/fixtures/events.sample.jsonl --manifest contracts/fixtures/manifest.sample.json --viz-map contracts/fixtures/viz_map.sample.json
```

The snapshot loads all existing complete event lines immediately; this is a file tail, not a timed replay. Point it at a separately paced replay file to animate earlier events honestly. It never changes events or writes success events.

- TCP `127.0.0.1:7300`: newline-delimited tap records, maximum 256 KiB each: `{ "v": 1, "frame": 10, "sprites": [], "pc": 134217728 }`. Sprite fields are `i,x,y,w,h,tile,pal`, plus optional `subsystem` from an empirically verified mapping. Unknown subsystem is `null`; Doom can have no hardware sprites. `running` may contain actual observed function ids. A supplied real PC is mapped against the current manifest game-function address ranges; no CPU samples are invented.
- Websocket `ws://127.0.0.1:7301/`: contract sprite frames every 100 ms. Required fields `v,frame,sprites,heal` remain unchanged.
- HTTP `http://127.0.0.1:7304/state` or `/health`: same snapshot; status is not a claim the game boots.
- `POST http://127.0.0.1:7304/telemetry`: the same tap record as JSON, for local browser/emulator integrations. It accepts real telemetry only and does not fabricate recovery events. No cross-machine calls or tunnel required.

Extra websocket fields: `fixture` (boolean), `run_id` (string/null), `source_status` (`file`, `fixture`, `missing`, or `invalid: ...`), `tap_connected` (boolean), `sample_age_s` (number/null), `running` (real observed game ids only), `matched`, `game_functions`. Frame stays zero without a tap; stale tap samples are cleared from sprites/running after three seconds. `source_status=file` means readable events, not a live-running producer. The overlay should show SAMPLE DATA for fixture inputs, NO SIGNAL for missing/invalid inputs or stale tap, and never describe a verified swap from healing alone.

Healing is unique accepted `fn.matched` ids divided by game-function ids in each viz group. Library ids and unknown ids do not count. Run switches, file truncation, changed file identity, or replaced prefix reset recovery. Partial last lines wait for a newline. Start the bridge again when switching to a different manifest/build; never reuse old function ids after an address-changing build.

Crew integration request: `crew/director.py` supports `Director.heartbeat(running, frame_png)` but the current `crew/serve.py` does not expose a heartbeat endpoint. This checkpoint serves the observed `running` samples for local consumers; it does not guess a director HTTP API, submit jobs, read hidden viz grouping into Crew, or claim SubQ has acted. A later explicit local integration must pass observed ids and screenshot bytes only, with model decisions labeled as inferred.

All listeners bind localhost. Launching with missing manifest/viz files fails clearly instead of substituting sample data. Ports can be changed with `--tap-port`, `--ws-port`, and `--http-port`.
