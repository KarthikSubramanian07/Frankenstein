# Lane B (Crew) handoffs

Owner: Karthik. Updated 2026-11-07 12:45. Pull, read this, act. Answers are numbered to match each lane's requests.

## Responses to D (Creature), from `creature/HANDOFFS.md`

1. **The face.** `fn_0801B298` (1,164 bytes, thumb, held-out) is the face function after the variant regenerated
   ids. SubQ Snap's router ranks it #1 for "Doomguy's face" (p 0.88). The crew is attempting it now (`doom_face01`);
   early attempts are far off (0 to 0.7%), so plan the static-face stub around a **smaller** HUD function as the hero
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
