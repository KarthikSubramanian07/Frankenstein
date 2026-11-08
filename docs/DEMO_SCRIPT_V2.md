# Demo script v2: make the agents' work visible

Draft by Lane A, 15:20, for the team to rehearse. It replaces nothing yet: `docs/DEMO_SCRIPT.md` (Lane B) stays the
working script until the team picks. Sources: `docs/EVENT_GUIDE.md` (official rubric), Eddy's playbooks
(judging psychology, demo video patterns, demoability gate, the June AIE winners), `site/judges.html`.

## The problem this version fixes

Our ROM is byte-identical to the original, so the game on screen looks exactly like Doom, and a judge sees "four
people playing Doom". v1 asks the judge to believe a checksum. v2 puts the agents' code under the judge's hands
three times, and each time it shows on screen:

1. **The dig:** the judge presses Enter and watches machine code turn into C, then MATCH.
2. **The cheat:** the GBA has no keyboard, so GBADoom's god mode is a button sequence: Up Up Down Down Left Left
   Right Right. The god-mode function it runs (`fn_080054C8`) is one our agents rebuilt from machine code (MATCH).
   The code that reads the buttons (`fn_08005828`) is not recovered, so we say so.
3. **The change:** a change in the agents' C that an emulator can't make. First choice, `god_200`: god mode sets
   health to 200%, and the status bar shows it. Second, `instant_raise`: the weapon appears instantly instead of
   sliding up. That is the reason to recover source at all.

Anchor line for deliberation (judges repeat one line): **"The agents rebuilt Doom's code from the cartridge, and the
compiler proved every piece."**

## Numbers we may say (and where they come from)

| Say | Source |
|---|---|
| 235 of Doom's 568 functions, about 40% | `crew/exports/union/UNION.json` (14:53) |
| 8.39% of the code by size | same |
| 235 rebuilt into the game, checksum identical | `POST /rebuild` on the union, re-verified by Lane A at 15:04 after Lane B restored `fn_080035CC.c` (235 agent-written, 398 original, 4.78%) |
| 39 lies caught, 32 fakes rejected, 0 fakes let through | `python3 tools/counts.py` (reads crew/exports in the repo, 36 finished runs); identical on Lane A's and Lane B's machines at 15:06 |
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
| **0:00 to 0:12** | Doom running full screen. | Watches. | "For most old games, only the cartridge survives. The recipe, the source code, is gone. It's like being handed a cake and asked for the exact recipe. Our agents write the recipe back from the cartridge, and a compiler bakes it to check it's the same cake, byte for byte. This is Doom." | Impact 20 (identity in 10 s) · Software Archaeology | No playable ROM on the demo laptop: start on the Stage's Split scene and say the same words. |
| **0:12 to 0:20** | Terminal: `Judge: press ENTER to hire the agents.` | **Presses Enter.** | "Press Enter. You just hired two agents." | Technical Demo 35 (judge triggers it) | Referee down: "the referee is down, so nothing can count; here's the last real run", switch to the REPLAY tab, opened in advance at `http://localhost:5173/?legacy=1&scene=split&replay=doom_r01&speed=4` (the REPLAY · 4x badge stays visible). |
| **0:20 to 0:55** | Stage Split (open `http://localhost:5173/?legacy=1&scene=split`; the default Stage is the log plus the ending card): machine code on one side, Muse writing C on the other, the MATCH stamp, then the judgment rail. | Watches the stamp. | "Left: what's on the cartridge. Right: C that Meta's Muse Spark is writing right now. One rule: it only counts if it compiles to the exact same bytes." (at MATCH) "There. Byte for byte, checked in a fifth of a second. From memory alone, Muse compiled 0 of 20, so this isn't recall. Then SubQ Snap screens it for tricks." | Difficulty 30 · Meta (Muse writes every line) · Subquadratic (Snap's decision line on screen) | Nothing lands by 0:50: "Agents are slow; the referee isn't." Switch to the REPLAY tab (`?legacy=1&scene=split&replay=doom_r01&speed=4`, first MATCH in under 2 s). |
| **0:55 to 1:15** | Versus or the Road scene: a claimed match, the referee's re-run, REJECTED with the first wrong instruction. | Reads the red line. | "Agents lie. Today they told us 'it matches' 39 times when it didn't. The referee re-runs every claim, and one instruction gives each of them away. Agents lie. Compilers don't." | Trust but Verify · Difficulty 30 | Versus has no live lie: show the FALSE CLAIM card on `/judges` (real event from `doom_r12`). |
| **1:15 to 1:35** | Ending: ORIGINAL and REBUILT checksums, IDENTICAL. Then the meter. | Compares the two lines. | "We put the agents' code back into Doom: 235 functions. Same checksum as the original. Not similar: identical. That's 235 of Doom's 568 functions so far, the small ones first. And every run starts from the last one's best try; that's how a 90% near-miss became a match." | Software Archaeology (observed vs inferred) · Overall | Ending says NOT REBUILT YET: show the `/judges` rebuild card. |
| **1:35 to 2:00** | Doom (original build), controller in the judge's hands. | **Presses Up Up Down Down Left Left Right Right**; god mode turns on (health 100%). | "Doom's god-mode cheat on the Game Boy is a button sequence. Press up, up, down, down, left, left, right, right. That just ran the god-mode function our agents rebuilt from machine code; the code that reads the buttons is still the original." | Technical Demo 35 (hands on) · Creativity 15 | Cheat doesn't trigger: say "the god-mode function is one we rebuilt", move on. Sequence and source: `lab/demo/iddqd.md`. Tested 15:07 in the browser player: arrow keys, "DEGREELESSNESS MODE ON", HEALTH 100% (`lab/demo/shots/original_god_after.png`). |
| **2:00 to 2:30** | Same cheat in the changed build: the status bar reads **200%**. Optional: Snap's eyes line "CHANGE CONFIRMED". | Presses the sequence again. | "And this is why source matters. An emulator can only play the game. We changed one line in the agents' god-mode C, rebuilt, and now god mode gives you 200% health. Everything else is byte for byte the same." | Creativity 15 · Software Archaeology ("extend") · Subquadratic (eyes) | `god_200` not playtested or doesn't boot: use `instant_raise` ("we changed the weapon-raise function, and now your gun appears instantly"). Neither works: cut the beat, say "Recovered code can be changed and rebuilt; that's next." `god_200` tested 15:07: HEALTH 200% (`lab/demo/shots/god_200_after.png`, package 5d434437…). `instant_raise` is still untested, so god_200 is the beat. |
| **2:30 to 2:45** | QR on screen; Enzo hands Phone A to a judge. | Scans or takes the phone. | "Scan it. That's the rebuilt game on your phone, in a browser emulator." | Impact 20 · Overall | No QR: hand over Phone A. No phone works: skip. |
| **2:45 to 3:00** | Credits card: built today / not ours. | Reads. | "Ask for any function in ASI:One and the Fetch.ai agents bring back the proof. Muse writes it, Snap judges it, the compiler proves it. On the left, everything we built today; on the right, everyone else's work. Lost games, rebuilt and proven." | Disqualifier rule (built today) · Fetch.ai | none |

Stop at 3:00, even mid-sentence.

### Why this order

- The game is on screen at 0:00 and the judge acts by 0:20 (playbook: identity in 10 s, judge triggers by 0:45).
- One proof moment early (MATCH at about 0:40), then one escalation that proves it isn't canned: the judge's own
  button presses (the cheat), then the same cheat in the changed build.
- One number per scene, said aloud: 0.2 s, 39, 235, 235 of 568.
- Each prize sponsor acts on screen in its own scene: Muse writes (0:20), Snap judges (0:40, 2:00), Fetch.ai in
  the close and in Q&A. MongoDB and Gemini get one line each in Q&A only: neither has a prize track (`EVENT_GUIDE.md`).
- The System That Gets Better is a Q&A answer, not a scene: our held-out result shows no measured gain, and
  the guide asks for changes "that held-out evaluation confirms". Saying it plainly is stronger than a weak curve.

## The 60-second video (record 16:30, one take of the real system, narrated, captions burned in)

Today's work only. Real capture only. REPLAY badges stay on screen. The playbook (`04_strategy/demo_video_patterns.md`,
`judging_psychology_and_pitch.md`) says: open on a hard claim, product on screen by 0:15, one proof moment, measured
numbers said aloud, and a narrated video (narrated videos won about twice as often at HackMIT 2026). So the video opens
on the most visible thing we have, the changed game, and then explains it. Raw clips: `lab/demo/clips/` (fork F6).

| Time | Shot | Voice (Karthik) | Caption |
|---|---|---|---|
| 0 to 6 | Side by side: the god-mode cheat, HEALTH 100% (left) and 200% (right) | "Same cheat, same game. On the right, we changed one line of code that AI rebuilt from the cartridge." | Doom, rebuilt by AI agents from machine code. Then changed. |
| 6 to 14 | Stage Split: machine code on the left, Muse writing C on the right | "For most old games only the cartridge survives. Our agents read its machine code and write the source back." | Meta's Muse Spark writes the C. LIVE. |
| 14 to 22 | The MATCH stamp | "It only counts if a compiler turns it into the exact same bytes. Checked in a fifth of a second." | Byte for byte, or it doesn't count. |
| 22 to 30 | REJECTED card, first wrong instruction | "Agents lie. 39 times today they said it matched when it didn't. The referee caught every one." | 39 false claims caught. 32 fakes rejected. 0 let through. |
| 30 to 40 | Ending: two identical checksums, then the meter | "235 of Doom's functions are back, and the rebuilt game has the same checksum as the original." | 235 of 568 functions, proven. Identical checksum. |
| 40 to 48 | The god-mode cheat on the changed build, full screen, in the judge's hands or on a phone | "That's what source buys you. An emulator can only play a game. With the source, you can fix it, change it, and move it." | One line of recovered C changed. Health 200%. |
| 48 to 54 | The equivalence page: 20,000 of 20,000 identical | "The same recovered code gives identical results in a browser as on the original chip." | Same answers on a phone as on the Game Boy. |
| 54 to 60 | Credits card | "Lost games, rebuilt and proven." | Built today: the agents, the referee, the Stage, the patches. Not ours: Doom, GBADoom, the WAD, mGBA, devkitARM, the partner platforms. |

If the live dig can't run at 16:30 (the team's Meta key hit its spend limit at 14:20; check `make preflight`), shoot
6 to 22 from the replay and keep its REPLAY badge on screen.

## Q&A additions (one breath each)

- **"So what did you build? It's just Doom."** "The game is the same on purpose: that's the proof. What we built is
  the system that wrote 235 of its functions back from machine code and the referee that refuses anything that
  isn't byte-identical. You just ran one of them with the cheat."
- **"Isn't the source public?"** "GBADoom's is, and that's why we picked it: it's the answer key. The agents never
  see it; they see anonymous ids and machine code. From memory alone, Muse compiled 0 of 20."
- **"How much is done?"** "235 of 568 functions, but only 8.39% of the code by size. The big ones are left: the
  face, the renderer."
- **"Does it get better?"** "Run over run, yes: warm starts and salvage turned near-misses into matches. On held-out
  code we measured no gain yet, so we don't claim one."
- **"Where's MongoDB?"** "Every habit and every event lives in Atlas." **"Gemini?"** "The second lab that screens every match."
- **"Can it port games?"** "Source is what makes a port possible. A WebAssembly or native build from the recovered
  C is the next step; today the phone runs our rebuilt ROM in an emulator."

## Before 16:30

1. Lane D packages `god_200.gba` (first) and `instant_raise.gba` with the WAD and playtests both; result in `creature/STATUS.md`.
2. Someone enters Up Up Down Down Left Left Right Right on the demo player and writes down which keys map to the D-pad.
3. Done 15:04: Lane B restored `fn_080035CC.c`, Lane A re-verified 170 spliced.
4. Two timed run-throughs of this cut. Whatever fails twice comes out.
