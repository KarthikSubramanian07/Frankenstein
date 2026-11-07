# Lane B (Crew) handoffs

## Active assignment from Enzo: implement Pokémon coverage support

Read [docs/POKEMON_IMPLEMENTATION.md](../docs/POKEMON_IMPLEMENTATION.md). Publish STARTED / QUEUED AFTER DOOM (exact gate) / BLOCKED (exact input). Next checkpoint: game-scoped target handling plus a runnable coverage reducer/export with visited, behavior-validated and code-verified states separated. Use labelled fixtures while A's target input is pending; publish actual attempt evidence when available. Keep Doom intact.

## New request from Enzo: Pokémon Red partial coverage after Doom

Enzo explicitly asked for this to be added to Lane A and B. Once the good Doom demo works, target Pokémon Red's landing/title menu and first Pokémon interactions as a bounded playable slice. Beside gameplay, a genuine world/location map and attached interaction tree show how far Frankenstein has reached.

Read [POKEMON_RED_COVERAGE.md](POKEMON_RED_COVERAGE.md), [canonical plan](../creature/POKEMON_RED_PLAN.md) and [issue #4](https://github.com/KarthikSubramanian07/Frankenstein/issues/4). B: use A's target adapter/checkpoints to recover only slice dependencies and publish replayable evidence. Keep observed/visited, behavior-validated and code-recovered/verified separate. Tie observations/proof to game/build/run and bank-aware unit or actual map/scene ids; state every coverage denominator. No hidden-map labels in Digger prompts.

Doom remains first, including the smaller-HUD fallback now that the face function is out of reach. Respond in this handoff and crew/STATUS.md with feasibility, dependencies and proposed evidence fields.

Owner: Karthik. Updated 2026-11-07 12:45. Pull, read this, act. Answers are numbered to match each lane's requests.

## Responses to D (Creature), from `creature/HANDOFFS.md`

1. **The face.** `fn_0801B298` (1,164 bytes, thumb, held-out) is the face function after the variant regenerated
   ids. SubQ Snap's router ranks it #1 for "Doomguy's face" (p 0.88). The crew is attempting it now (`doom_face01`);
   early attempts are far off (0 to 0.7%), so plan the hero around a smaller function next to the face in the ROM (not necessarily status-bar code; Lane A 14:18)
   if the face hasn't matched by 13:30. We'll post the result here and in `DECISIONS.md` either way.
2. **Real runs on your machine.** Pull `crew/exports/<run_id>/` (events, metrics, names, Checker-accepted
   `recovered/*.c`, and `EXPORT.json` with the manifest and ROM SHA-1s and per-file hashes). Regenerate with
   `python -m crew.export <run_id>`. First exports: `doom_r01` (real Doom), `bench_r01` (bench).
3. **Agreed.** Heal only from `fn.matched`, deduplicated per function, reset per run; names are never proof.
4. **Finale function.** Candidates are in `crew/exports/doom_r01/recovered/`. We'll propose one with Lane A once the
   heldout runs land; any modification goes through `python -m lab.referee patch`.
5. **Telemetry → director.** `python -m crew.run --live --director ...` listens on `127.0.0.1:7112`.
   `POST /heartbeat {"running": [fn ids], "frame_png_b64": "..."}`. Heartbeats older than 12 s are dropped; the
   port is released when the run ends. See `contracts/CONTRACTS.md` 7c.
6. **Snap's eyes for the patch.** `python -m crew.eyes before.png after.png --claim "<what changed>" --run runs/live --fn <fn>`
   appends a `snap.decision` (op `eyes`) to the live run. Exit code 0 means the change shows and nothing else broke.

## Responses to A (Lab)

1. **ASI:One plain words.** `POST /jobs {"query": "bring back Doomguy's face", "live": true}` routes through Snap,
   starts the job, makes it `runs/live` (the Stage shows it), and logs the route as `snap.decision` (op `route`).
   `GET /jobs/{id}` returns `evidence` {observed, inferred, judgment}. Start the API with `--live-jobs` to make
   every job live.
2. **Rebuild proof.** The crew now calls `/rebuild` after every 3 matches and at the end of every run, and logs
   `build.rom` in its own run. Verified: 28 recovered Doom functions spliced in, SHA-1 `d936259b…` identical.

## Requests from B

- **A:** run `python3 -m lab.memory_probe` with a Meta key and commit `lab/out/memory_probe.json` (judges' first
  question). Add `lab/score_names.py` that scores a run's `names.json` against the secret names and prints only an
  aggregate accuracy. Let the ASI:One agent forward plain words to `POST /jobs {"query", "live": true}`.
- **C:** show `snap.decision`, `idiom.judged` and claim-first lies on screen (a judgment rail is being added as
  isolated files under `stage/src/`; review and restyle it freely).
- **D:** post real heartbeats to `:7112` during the live segment; call `crew.eyes` on the finale's before and after frames.
- **A:** "Play anywhere" in ASI:One. When someone asks to play ("let me play the rebuilt Doom on my TV"), the agent
  replies with the phone/universal player link, its QR code, and one line per device: browser on phone, TV or
  console (Gamepad API supported), and RetroArch or a real GBA only if `creature/phone/DISTRIBUTION.md` approves
  a ROM download. Observed vs inferred applies: "X% of this build's game code was written by agents and proven".

## Requests from the demo director (13:15, see `docs/DEMO_SCRIPT.md`)

1. **Make the fake rejections visible.** `Checker._reject` (`crew/checker.py:115`) only bumps a counter, so the 4 real fakes per held-out run never reach the Stage. Emit an event with the reason (for example `verdict` with `status: "MATCH"`, `fake_rejected: true`, `reason: "volatile used to coax codegen"`, contract additive) so Versus can stamp "BYTE MATCH · REJECTED". Every run has 0 false claims, so this is our only real lie on screen.
2. **Re-export a Doom run with `build.rom`.** `crew/exports/doom_r01` has none, so the replayed Ending says NOT REBUILT YET. Export `doom_r01` again (or the next real run) with its rebuild proof.
3. **Shorten the live segment's dead air.** Rehearsal of `crew.demo --pick 2`: nothing visible for 25 s (first Muse attempt at high effort), then 22 s of nothing between the matches (38 s) and `build.rom` (60 s). Add `--effort medium` to `crew.demo`, and emit an early event the Stage can animate while Muse writes (for example `attempt.started`).
4. **Skip milestone narration under 8 functions.** A 2-function run announces "Quarter… Halfway… Three quarters… Fully recovered!" within one second.
5. **Live ASI:One jobs must be winnable.** `POST /route` for "bring back Doomguy's face" took 23.5 s at 12:56 and did not rank `fn_0801B298` in its top 3. For live jobs, keep Snap's ranking but start the job on the best-ranked function under 120 bytes, and say so in `evidence.judgment`.
6. **CORS on `:7112/heartbeat`** for `http://127.0.0.1:7401`, so the laptop's own browser player can post frames to the director (local Play-to-recover, option a).
