# The story

**Lost games, rebuilt and proven.**

One cartridge, five steps. Each step names the lane that carries it and the event or file that proves it, so the
integration is explicit. `make up` runs the whole thing; `make status` shows which pieces are live
([`tools/README.md`](../tools/README.md)). Numbers come only from `runs/*/metrics.json` and `DECISIONS.md`.

## One cartridge, five steps

### 1. The game is dead.

Doom is on screen. Doomguy's face is full of static. The source is lost.

- **Static face:** the stub ROM shows code we haven't recovered yet as static. The face is `fn_0801B298` (1,164 bytes). Lane A builds the ROM, Lane D boots it in mGBA.
- **The badge:** the Stage's Split scene says NOW RUNNING ON ORIGINAL CODE until a `rom.swapped` event arrives (Lane C).
- **Bonus static:** the overlay draws static wherever the bridge's `heal` is 0 (sprite frames on `ws :7301`, Lane D).
- **Honest:** the agents see only `fn_` ids, asm and ctx (`lab/out/`). The answer key stays in `lab/secrets/`, and `crew/guard.py` blocks it.

### 2. You ask.

"Bring back Doomguy's face," typed in ASI:One. SubQ Snap routes the words.

- **Front door:** the Frankenstein Referee agent (Lane A, `lab/agents/`, Agentverse mailbox) gets the chat.
- **Route:** it sends `POST :7111/jobs {"query": ...}` to `crew.serve` (Lane B). Snap ranked the real face function #1 (p 0.88), and that guess is labelled inferred.
- **Answer card:** `GET /jobs/{id}` returns `evidence`: Proved (observed), Our guess (inferred), How we decided (judgment).

### 3. The crew digs.

Muse writes it. The referee checks it. The Checker catches a lie. Snap decides what's next.

- **Diggers (Lane B, Muse Spark, Muse Wonder when stuck):** they emit `fn.claimed`, `attempt.submitted` and `claim.made` ("Matched it. Pretty sure.") before any verdict.
- **Referee (Lane A):** `POST :7101/check` returns MATCH, or PARTIAL with the first wrong instruction, in 0.1 to 0.2 s.
- **Checker (Lane B):** it re-runs every claim and emits `verdict {claim_was_true}`. A false claim cuts the Stage to Versus: K.O. (Lane C).
- **Snap's judgment:** `snap.decision` with op `decide_next` (keep, escalate or abandon) and op `review` (fake gate, with Gemini as the second lab).
- **Kept:** `fn.matched` writes `runs/<id>/recovered/fn_*.c`. A habit is learned (`idiom.learned`), then kept or retired on evidence (`idiom.judged`).

### 4. It's alive.

The face heals. The ROM is rebuilt from the agents' C, with an identical SHA-1. Play it, and we rebuild it.

- **Heal:** `fn.matched` drives the bridge's heal (Lane D, `ws :7301`) and the Stage's beam and coin (Lane C, `ws :7202`).
- **Rebuild:** `POST :7101/rebuild` returns `build.rom {rom_sha1, identical, pct_agent_code}` (Lane A). The Ending shows IDENTICAL only when it's proved.
- **Swap:** Lane D loads the rebuilt ROM and writes `rom.swapped`. The badge flips to NOW RUNNING ON N% AGENT-WRITTEN CODE.
- **Play to recover:** the mGBA tap (`creature/tap/oam_tap.lua`) feeds the bridge on `:7300`. `director_adapter --forward` then posts to `:7112/heartbeat` (crew-live). Snap picks what's on screen and emits `snap.decision {op: "director"}`, and those functions jump the queue.

### 5. It changes again.

One function patched. Snap's eyes confirm the visible change, and nothing else. Phones play it.

- **Patch:** `POST :7101/patch {fn, src}` changes exactly one function (Lane A). Lane D writes `patch.verified`, and the Ending shows PATCH 1.01.
- **Eyes:** the before and after frames go to `crew.director.eyes()`, which emits `snap.decision {op: "eyes"}` (Lane B).
- **Phones:** `creature/phone` on `:7401` runs mGBA in the browser. `phone.published {url, qr_png}` puts the QR on the Ending (Lane D, then C).

Games don't have to die. Anywhere the only thing left is the compiled program, Frankenstein can bring the source back.

## Gaps per lane

What each lane still owes the story. We found these by reading the code and handoffs at 12:30 and running
`make preflight` and `make up` on one laptop. Everything else is already wired. `make status` shows a missing
piece with the command it expects.

### Lane A · Lab

1. **Plain words in the agent (step 2).** `answer()` in `lab/agents/frankenstein_agent.py` recovers only when the text holds a `fn_` id, so "bring back Doomguy's face" gets the help text. When there's no id, please `POST /jobs {"query": text}` and reply with the `evidence` card.
2. **The static-face ROM (step 1).** We need one command that writes the playable stub ROM (face as static, WAD appended) and prints its SHA-1, for mGBA and phones. This is `creature/HANDOFFS.md` requests A1 and A2.
3. **The agent on the demo laptop.** `FRANKENSTEIN_AGENT_SEED` lives only in your `.env`. Without it, `run_agent.sh` mints a new address and appends it to `.env`, so frank skips the agent. Hand the seed over out of band (never git), or demo from your laptop, and run one copy at a time.
4. **Small:** `lab/README.md` still says `rebuild` and `patch` return 501.

### Lane B · Crew

1. **`build.rom` never lands (step 4).** `Run.rebuild()` posts `/rebuild` without `"emit": true`, so no run or export has a `build.rom`, and the Ending can't say IDENTICAL. Write `build.rom` into the run's own `events.jsonl` from the result, because Lab's emitter appends to `runs/live`, which can be another run. Rebuild once more at `run.finished`.
2. **The face (step 4).** No run or export has matched `fn_0801B298` yet (`make preflight`). Export it the moment it lands.
3. **A real lie to replay (step 3).** Every run so far shows 0 false claims caught. Doom_r02 and r03 did reject 4 fakes each. Claim-first (DECISIONS 12:30) should change that, so please export the first run with a caught lie.
4. **ASI:One jobs reach the Stage (step 2 to 3).** `crew.serve` runs each job in `runs/r_asi_NN` without `--live`, and the route is never written as an event. Add an opt-in live flag for jobs, and make `snap.decision {op: "route", query, fns, p}` the job run's first event.
5. **Eyes needs a caller (step 5).** `director.eyes()` exists, but nothing calls it. Add a command, for example `python -m crew.director eyes --before a.png --after b.png --claim "..."`, that appends to `runs/live`.
6. **Director lifecycle** (asked in `creature/bridge/README.md`): expire heartbeat samples by time, and close `:7112` when the run finishes.

### Lane C · Stage

1. **Show Snap (steps 2, 3 and 5).** `stage/src` never reads `snap.decision` or `idiom.judged`, which B asked for at 12:30. The route, keep, escalate or abandon, the director's picks and the eyes verdict are all invisible without it.
2. **Show the question (step 2).** Put the plain-words query and Snap's pick on screen once B emits op `route`, so step 2 shows on the Stage and not only in the chat.
3. **Verified:** replaying `crew/exports/doom_r01` through `runs/live` renders Split and Hi-score (28/30, LIES 0, TIME 04:24). Thank you; it just works.

### Lane D · Creature

1. **The three writes (steps 4 and 5).** Nothing appends `rom.swapped`, `patch.verified` or `phone.published` yet, and `prepare_swap.py` says so on purpose. After a real swap, patch or publish, append the contract event to `runs/live/events.jsonl`. The Stage already listens.
2. **One real boot.** mGBA isn't installed on the laptop we tested. The tap, `director_adapter --forward` and the face heal need one real Doom boot.
3. **Phones.** `creature/phone/core/` isn't prepared yet (`npm install --ignore-scripts && npm run prepare:core`). After that it needs the WAD ROM and an HTTPS host with COOP and COEP.
4. **One number.** `creature/obs/RUN_OF_SHOW.md` puts the game at y=100, but the Stage's window is at x 20, y 92, 960×640 (`stage/HANDOFF_D.md`).

### Everyone

- **Replay is read-only.** Replay points `runs/live` at an export folder. Don't append events there (`rebuild --emit`, swaps), or you edit a committed file. Use `MODE=live` or a copy under `runs/`.
