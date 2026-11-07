# Demo script v2: make the agents' work visible

Draft by Lane A, 15:20, for the team to rehearse. It replaces nothing yet: `docs/DEMO_SCRIPT.md` (Lane B) stays the
working script until the team picks. Sources: `docs/EVENT_GUIDE.md` (official rubric), Eddy's playbooks
(judging psychology, demo video patterns, demoability gate, the June AIE winners), `site/judges.html`.

## The problem this version fixes

Our ROM is byte-identical to the original, so the game on screen looks exactly like Doom, and a judge sees "four
people playing Doom". v1 asks the judge to believe a checksum. v2 puts the agents' code under the judge's hands
three times, and each time it shows on screen:

1. **The dig:** the judge presses Enter and watches machine code turn into C, then MATCH.
2. **The cheat:** the judge types IDDQD in Doom and gets god mode. The code that just ran (`cheat_god`, and
   `ST_Responder`, which reads the keys) is code our agents wrote from machine code.
3. **The change:** a change in the agents' C that an emulator can't make: the weapon appears instantly instead of
   sliding up. That is the reason to recover source at all.

Anchor line for deliberation (judges repeat one line): **"The agents rebuilt Doom's code from the cartridge, and the
compiler proved every piece."**

## Numbers we may say (and where they come from)

| Say | Source |
|---|---|
| 170 of Doom's 568 functions, about 30% | `crew/exports/union/UNION.json` (14:53) |
| 4.78% of the code by size | same |
| 169 rebuilt into the game, checksum identical | `POST /rebuild` on the union, Lane A 14:56 (170 once Lane B restores `fn_080035CC.c`, `lab/HANDOFFS.md` 14:58; say 169 until A re-verifies) |
| 24 lies caught, 30 fakes rejected, 0 fakes let through | `DECISIONS.md` 14:52 (`tools/counts.py` on Lane B's machine, 33 runs). On Lane A's laptop the same script prints 9 / 6 / 0 from 13 local runs. **Say Lane B's figure only from the machine that prints it.** |
| From memory alone: 0 of 20 compiled | `DECISIONS.md` 13:28 |
| A check takes 0.1 to 0.2 s | `DECISIONS.md` 11:24 |
| Held out: no measured gain yet | `DECISIONS.md` 13:58 and 14:06 |

Never say: "the whole game", "Doom recovered", a percentage of the game without "of the functions", the face
coming back, "port" (the phone runs our ROM in an emulator).

## The judging-room cut (3:00)

Cast as in v1: Karthik speaks, Aidenn drives keys, Enzo has the phones and the controller, Eddy takes referee Q&A.
"UNTESTED" marks a beat that has not run end to end yet; it is cut from the 16:30 recording unless it passes a
rehearsal first.

| Time | Screen | The judge does | Karthik says (exact words) | Rubric · problem · prize | Fallback |
|---|---|---|---|---|---|
| **0:00 to 0:12** | Doom running full screen. | Watches. | "Most old games survive only as a cartridge: the source code is gone. Our agents read the cartridge's machine code and write the C back, and a compiler proves every piece. This is Doom." | Impact 20 (identity in 10 s) · Software Archaeology | No playable ROM on the demo laptop: start on the Stage's Split scene and say the same words. |
| **0:12 to 0:20** | Terminal: `Judge: press ENTER to hire the agents.` | **Presses Enter.** | "Press Enter. You just hired two agents." | Technical Demo 35 (judge triggers it) | Referee down: "the referee is down, so nothing can count; here's the last real run", key `1` on the replay (REPLAY badge stays visible). |
| **0:20 to 0:55** | Stage Split: machine code on one side, Muse writing C on the other, the MATCH stamp, then the judgment rail. | Watches the stamp. | "Left: what's on the cartridge. Right: C that Meta's Muse Spark is writing right now. One rule: it only counts if it compiles to the exact same bytes." (at MATCH) "There. Byte for byte, checked in a fifth of a second. Then SubQ Snap screens it for tricks." | Difficulty 30 · Meta (Muse writes every line) · Subquadratic (Snap's decision line on screen) | Nothing lands by 0:50: "Agents are slow; the referee isn't." Key `1` on the replay. |
| **0:55 to 1:15** | Versus or the Road scene: a claimed match, the referee's re-run, REJECTED with the first wrong instruction. | Reads the red line. | "Agents lie. Today they told us 'it matches' 24 times when it didn't. The referee re-runs every claim, and one instruction gives each of them away." | Trust but Verify · Difficulty 30 | Versus has no live lie: show the FALSE CLAIM card on `/judges` (real event from `doom_r12`). |
| **1:15 to 1:35** | Ending: ORIGINAL and REBUILT checksums, IDENTICAL. Then the meter. | Compares the two lines. | "We put the agents' code back into Doom: 169 functions. Same checksum as the original, all 40 characters. That's 170 of Doom's 568 functions so far, the small ones first." | Software Archaeology (observed vs inferred) · Overall | Ending says NOT REBUILT YET: show the `/judges` rebuild card. |
| **1:35 to 2:00** | Doom, controller in the judge's hands. | **Types IDDQD** (I-D-D-Q-D) while playing; DEGREELESSNESS MODE appears and the face turns gold. | "Type I, D, D, Q, D. That's Doom's god-mode cheat. The code that just ran was written by our agents from machine code, and the compiler proved it's the original." | Technical Demo 35 (hands on) · Creativity 15 | Message doesn't show: say "the cheat lives in the status bar code we recovered", move on. Rehearse the key mapping first: in GBADoom cheats are typed with the GBA buttons, see `lab/demo/iddqd.md` (fork F2). **UNTESTED: confirm the cheat input on our player.** |
| **2:00 to 2:30** | Doom: switch weapons in the original (gun slides up), then in the changed build (gun appears instantly). Optional: Snap's eyes line "CHANGE CONFIRMED". | Switches weapons. | "And this is why source matters. An emulator can only play the game. We changed one line in the agents' C, the weapon-raise function, rebuilt, and now your gun appears instantly. Everything else is byte for byte the same." | Creativity 15 · Software Archaeology ("extend") · Subquadratic (eyes) | Not playtested or doesn't boot: cut the beat, say "Recovered code can be changed and rebuilt; that's next." **UNTESTED: `lab/demo/instant_raise` needs packaging with the WAD and a playtest.** |
| **2:30 to 2:45** | QR on screen; Enzo hands Phone A to a judge. | Scans or takes the phone. | "Scan it. That's the rebuilt game on your phone, in a browser emulator." | Impact 20 · Overall | No QR: hand over Phone A. No phone works: skip. |
| **2:45 to 3:00** | Credits card: built today / not ours. | Reads. | "Ask for any function in ASI:One and the Fetch.ai agents bring back the proof. Muse writes it, Snap judges it, the compiler proves it. On the left, everything we built today; on the right, everyone else's work. Lost games, rebuilt and proven." | Disqualifier rule (built today) · Fetch.ai | none |

Stop at 3:00, even mid-sentence.

### Why this order

- The game is on screen at 0:00 and the judge acts by 0:20 (playbook: identity in 10 s, judge triggers by 0:45).
- One proof moment early (MATCH at about 0:40), then one escalation that proves it isn't canned: the judge's own
  keystrokes (IDDQD) and their own weapon switch.
- One number per scene, said aloud: 0.2 s, 24, 169, 170 of 568.
- Each prize sponsor acts on screen in its own scene: Muse writes (0:20), Snap judges (0:40, 2:00), Fetch.ai in
  the close and in Q&A. MongoDB and Gemini get one line each in Q&A only: neither has a prize track (`EVENT_GUIDE.md`).
- The System That Gets Better is a Q&A answer, not a scene: our held-out result shows no measured gain, and
  the guide asks for changes "that held-out evaluation confirms". Saying it plainly is stronger than a weak curve.

## The 60-second video (record 16:30, one take of the real system, captions burned in)

Today's work only. Real capture only. REPLAY badges stay on screen.

| Time | Shot | Caption |
|---|---|---|
| 0 to 5 | Doom running | Lost games, rebuilt and proven. Agents read Doom's cartridge and write the C back. |
| 5 to 12 | Enter pressed, Split: machine code next to Muse writing C | Meta's Muse Spark writes C from machine code. LIVE. |
| 12 to 20 | MATCH stamp and the judgment rail | It only counts if it compiles to the exact same bytes. SubQ Snap screens every match. |
| 20 to 28 | REJECTED card with the first wrong instruction | Agents lie: 24 false claims caught, 30 fakes rejected, 0 let through. |
| 28 to 36 | Ending: two identical checksums, then the meter | 169 agent-written functions rebuilt into Doom. Identical checksum. 170 of 568 so far. |
| 36 to 44 | IDDQD typed in Doom, god mode on (if rehearsed) | This cheat is running code our agents rebuilt. |
| 44 to 52 | Weapon switch, before and after (if playtested); otherwise a phone playing | Change one line of recovered C, and the game changes. |
| 52 to 60 | Credits card | Built today: the referee, the agents, the Stage, the phone page. Not ours: Doom, GBADoom, the WAD, mGBA, devkitARM, the partner platforms. |

If IDDQD or the weapon beat isn't rehearsed by 16:20, swap in the phone shot (36 to 44) and the ASI:One proof card
(44 to 52): "Ask in ASI:One: 'prove the rebuild is exact.' The Fetch.ai agent answers with both checksums."

## Q&A additions (one breath each)

- **"So what did you build? It's just Doom."** "The game is the same on purpose: that's the proof. What we built is
  the system that wrote 170 of its functions back from machine code and the referee that refuses anything that
  isn't byte-identical. You just ran some of it with IDDQD."
- **"Isn't the source public?"** "GBADoom's is, and that's why we picked it: it's the answer key. The agents never
  see it; they see anonymous ids and machine code. From memory alone, Muse compiled 0 of 20."
- **"How much is done?"** "170 of 568 functions, but only 4.78% of the code by size. The big ones are left: the
  face, the renderer."
- **"Does it get better?"** "Run over run, yes: warm starts and salvage turned near-misses into matches. On held-out
  code we measured no gain yet, so we don't claim one."
- **"Where's MongoDB?"** "Every habit and every event lives in Atlas." **"Gemini?"** "The second lab that screens every match."
- **"Can it port games?"** "Source is what makes a port possible. A WebAssembly or native build from the recovered
  C is the next step; today the phone runs our rebuilt ROM in an emulator."

## Before 16:30

1. Lane D packages `instant_raise.gba` and `hud_shift.gba` with the WAD and playtests both; result in `creature/STATUS.md`.
2. Someone types IDDQD on the demo player and writes down which keys or buttons do it.
3. Lane B restores `fn_080035CC.c`; Lane A re-verifies the rebuild (169 becomes 170 in every line above).
4. Two timed run-throughs of this cut. Whatever fails twice comes out.
