# Playbook lessons for Frankenstein

A 4-minute read. It distills the event-day gameplan (written 10:35 today) and the hackathon playbook research into rules for this event. `DECISIONS.md` still owns the gate table, the compiler and rebuild corrections, and the finale details; this file does not repeat them. Where the gameplan disagrees with `docs/00_START_HERE.md`, this file follows the gameplan and says "(overrides the kit)". Where it disagrees with `DECISIONS.md`, it says so inline and the team picks one at the next gate.

## 1. Event facts and judging

- Shack15, Ferry Building, San Francisco. Hacking 10:45 to 17:00 PT (6 h 15 min). Teams of up to four.
- Submission form: `cerebralvalley.ai/e/aie-code-2026-hackathon/hackathon/submit`, due 17:00. It requires a one-minute demo video showing only what we built today, a public repo, and every teammate added.
- Fetch.ai also requires registering through the AIE Summit ASI:One Submission Agent, in addition to the form. Their track ("Agents That Prove Their Work") needs an Agentverse agent with the Agent Chat Protocol, discoverable in ASI:One, multi-agent orchestration, and the main workflow done inside an ASI:One chat.
- Round one, 17:00 to 18:45: about 3 minutes of live demo plus 1 to 2 minutes of Q&A, in a judging room on one laptop. Weights: Technical Demo 35%, Implementation Difficulty 30%, Impact Potential 20%, Creativity 15%. Technical Demo plus Implementation Difficulty is 65% of the score.
- Round two, 19:00 to 20:00: the top six on stage, same format, criteria weighted equally. Winners at 20:15.
- Prizes: Overall $3,000 / $2,000 / $1,000 plus credits. Best Use of Meta Model API $5,000. Best Use of Fetch.ai $2,500 for 1st and $2,500 for 2nd. MongoDB, Gemini and Subquadratic give credits only.
- Last edition (same organizer, June 2026): all three placed projects built the theme literally and showed a measured improvement on screen. The winner showed a success curve climbing; our curve is attempts per match falling as lessons are adopted.

## 2. Rules that can disqualify us, and how we comply

| Rule (event text) | How we comply |
|---|---|
| "Your demo must only highlight the specific features, code, and functionality that your team built during the hackathon … Failure to clearly identify your original contributions will result in immediate disqualification." | A "Built today / Not ours" split in the README, the last beat of the demo, and the video end card. Not ours: Doom (id Software), GBADoom (GPL v2 or later), the Doom shareware WAD, devkitARM GCC, GbaWadUtil, the browser emulator, and the Meta, Gemini, MongoDB and Fetch.ai platforms. Built today: the restructured target, agent loop, referee harness, Skeptic, Coach with held-out adoption and rollback, lesson ledger, recall baseline, recovery view, static-face build, change-and-rebuild flow, ASI:One agent. Point to the commit history after 10:45. |
| Banned: "Any project where a dashboard is the main feature." | The main feature is agents recovering Doom's code and the game rebuilt from it. Lead with Doom running. The function grid is how you watch it; never call it a dashboard, in speech, UI copy, README or submission. |
| Banned: "code, data, or assets you do not have the rights to." | GBADoom has no LICENSE file, so cite the GPL header in its source files. Read the Doom shareware license text before hosting a ROM with it patched in for the room to download, and have the answer ready if a judge asks. Our repo ships none of GBADoom's code or data. |
| New Work Only | No project code before 10:45. `docs/design_system.html` is listed as prior work and never pasted (see `DECISIONS.md`). The commit history is the evidence. |

## 3. The ten laws, applied to Frankenstein

1. **Pick the prize before the idea, by field size.** Two sponsor prizes carry cash (Meta, Fetch.ai); make Muse Spark and the ASI:One agent load-bearing on screen. Credit-only partners get no demo time.
2. **At college expos, build something a judge can touch.** This is not a college expo, and hardware showed no edge at one-day events in the corpus. The touchable thing is the game: the controller and the QR code.
3. **Put the judge inside the demo.** Hand a judge the controller, or let the judge pick the change ("make the shotgun fire faster") that we make in recovered C and rebuild.
4. **Using an LLM is no longer an edge.** Our edge is the referee. Say "code only counts when it compiles to the exact original bytes", not "AI decompiles Doom".
5. **One proof moment, real, early.** Product on screen by 0:15. The proof is the face coming back when `ST_updateFaceWidget` goes green, inside the first minute (0:35 to 1:05 in the beat sheet).
6. **Present-day pain, a payer, and a number.** Most old games have lost their source; preservation groups and rights holders are the users. Every claim carries one measured number from a saved run.
7. **Avoid the obvious version of the theme.** The obvious version is "agents write code". Ours writes code that must reproduce existing bytes, gets checked by a compiler, and measures whether its own lessons help.
8. **Effort goes only where judges look.** No login, landing page, Subquadratic, or tests and CI beyond the referee script (overrides the kit, which plans a SubQ Cartographer). Judges see about 3 minutes plus Q&A.
9. **The plan is not the problem; enforcement is.** Past events broke their own freeze and submitted late. Freeze on time and run section 7 below at each phase.
10. **Win again by reusing a core, not a project.** The referee plus crew is a core that points at any game with a pinned, deterministic compiler. Pitch it as a method; Doom is the checkable test case.

## 4. Per-lane lessons

**A, the Lab**
- Match per object file without LTO: compile one `.c`, compare one function's bytes in the `.o`, the way objdiff works. Stage line: "The shipped ROM uses link-time optimisation; we rebuilt it without that so each function keeps its own bytes."
- At `-O3`, GCC inlines static helpers into callers. `ST_calcPainOffset` will likely vanish into `ST_updateFaceWidget`, so recover the face as one unit. If there are 0 hand matches by 11:20, rebuild at `-O2` and say so on stage.
- Start with `source/st_stuff.c` (648 lines, about 20 functions: the status bar and Doomguy's face). Avoid the `.s` files and the `.iwram.cpp` C++ files.
- If devkitARM won't install or GBADoom won't boot by 11:00, use the devkitPro Docker image rather than switching games.
- Fetch.ai: wrap the orchestrator as one ASI:One agent and cut the layer if it isn't answering by 12:20 (overrides the kit, which plans three agents and never cuts it; `DECISIONS.md` gates ASI:One at 13:30 and Excavator and Curator at 15:00).

**B, the Crew**
- `muse-spark-1.3` writes first attempts in parallel; `muse-wonder-1.0` takes over after three failures and runs the Coach. Base `https://api.meta.ai/v1`; confirm both models with `GET /v1/models`. No API calls until credits show; the credit form closes at 15:00.
- If Meta matches 0 of 5 at the spike, Claude writes first attempts, Meta keeps the Coach, naming and the ASI:One agent, and the Meta prize block reports per-model counts.
- The Coach turns failed attempts into candidate lessons, versioned in MongoDB. A lesson is adopted only if it raises the match rate on held-out functions; otherwise it is rolled back. Show both adoptions and rollbacks.
- The Skeptic (on Gemini) checks what bytes can't: inline `asm()`, pasted assembly, `#pragma` or attribute tricks, and recited GBADoom source (near-copy compare against the public text). Gemini here overrides the kit, which keeps Gemini optional.
- Recall baseline: the model writes each target function from memory by name, with no assembly, compiled against both the original GBADoom build and our restructured build. Report both numbers.

**C, the Stage**
- Doom running is on screen by 0:15. The grid stays secondary to the game.
- One number per scene, read out loud, and only numbers that are in the run files.
- Laptop first: round one is one laptop and a few judges. Projector and stage are the bonus.
- Observed versus inferred everywhere: byte matches are observed; names, types and comments are inferred, shown as hypotheses with a confidence and scored against the real GBADoom names. Label any replay with its speed.

**D, the Creature**
- Static-face stub: in the demo build, any unrecovered status-bar function draws static where the face goes. It is a display rule we chose, so say it: "Code we haven't recovered yet shows as static."
- Keep a ROM with the face already recovered, in case the live rebuild is slow.
- The finale bug must be real, already in GBADoom, inside a recovered function, and visible on a phone within 20 seconds. Hunt for up to 45 minutes. If nothing is confirmed by 13:00, do the judge's change and never call it a bug fix.
- The phone runs the rebuilt ROM in a browser GBA emulator; no native web port. If the shareware license forbids repackaging, serve on the venue network only and take the link down after judging, or play only on the demo screen.

## 5. Demo and video

**3-minute beat sheet** (overrides the kit's run of show)

| Time | Beat |
|---|---|
| 0:00 to 0:15 | Doom on a GBA emulator, the face full of static. "Most old games have lost their source. Our agents write it back, and code only counts when it compiles to the exact original bytes. We picked Doom because it's famous and because we can check every answer." |
| 0:15 to 0:35 | Memory test: the model writes the face code from memory and the referee rejects it. One line on restructuring and the two recall numbers. |
| 0:35 to 1:05 | Agents recover `ST_updateFaceWidget` from the bytes: one rejected attempt, then green. The face snaps back. |
| 1:05 to 1:25 | Lie caught: the Skeptic blocks an attempt that pasted assembly or recited GBADoom source. |
| 1:25 to 1:50 | Observed versus inferred; lessons adopted and rolled back on held-out functions; attempts per match falling. |
| 1:50 to 2:40 | Finale: the bug fix or the judge's change in recovered C, rebuilt, QR on screen, the room plays. |
| 2:40 to 3:00 | Numbers and the built-today sentence. Stop for questions. |

- Run the memory test live only if it takes under 20 seconds; otherwise show the measured result.
- If a judge says "you changed the code, so memory was bound to fail", answer with the original-build recall number.
- Check any outside comparison (the GBA project at 51%, Pilotwings 64, Melee) before saying it, or leave it out.
- At the table: say what it is and who it is for in 10 seconds, answer "what is real?" exactly, and keep a printed real-versus-staged card.

**1-minute video, one take of the real system** (60 seconds, captions burned in, per `DECISIONS.md`; replaces the kit's 1:30 shot list)
1. Static face and the game, in the first 5 seconds.
2. The memory test failing.
3. The face returning, with its diff.
4. One lie caught.
5. The lesson curve.
6. A phone playing the changed game.
7. The built-today panel as the end card.

Only today's work appears. Watch the final export once, start to finish, with a timer.

## 6. Submission text recipe

- The first 150 words stand alone: what it is, the referee rule, the headline number.
- One measured number per claim, from saved runs: functions matched of total; held-out match rate with lessons on and off; recall baseline on both builds; lies caught; attempts per match per run.
- One block per prize, titled with its exact name ("Best Use of Meta Model API", "Best Use of Fetch.ai"). Each block: our project in the sponsor's vocabulary, where their product sits (module, call site, one number), one design decision, one honest limit, a file path. Never one line, never "X powers Y".
- Meta block: which models do what, call counts, matches each model produced. Fetch.ai block: Agentverse address, chat protocol, the ASI:One workflow, how the agent proves its work.
- Close with the built-today split and what is real: every green function reproduces with one command, the static face is a display rule, and the phone runs the rebuilt ROM in an emulator.
- Before submitting, do a "what did we make up?" pass: every number traced to a run file, every sponsor named actually called in code.

## 7. Failure history from past events, and the countermeasure

| Phase | What went wrong before | Countermeasure today |
|---|---|---|
| Before start | Sponsor APIs untested before kickoff | Spikes S2 (Meta, 5 functions) and S4 (ASI:One reply) done by 11:20 |
| Spike | A sponsor API first tested at 12:48 on event day | Same; go or no-go at 11:20 |
| Build | 39 of 183 commits went to tests, CI and a port; 10 tracks entered | Two cash prize tracks only; nothing judges won't see |
| Freeze | Features merged until 4:42 against a 3:45 freeze | Freeze at 14:55 means fixes only (gameplan; `DECISIONS.md` says 15:30) |
| Record | The video was a produced ad with the product at 2:38 of 4:30; another event had no video | One take of the real system at 16:10, product in the first 5 seconds |
| Submit | Repo private for hours; recording stamped 5:02; another event submitted 6 minutes late | Repo public at freeze; disqualifier audit and submit at 16:30; confirm the status says submitted |
| After | No timed rehearsal at any of four events | Three timed 3-minute run-throughs, 16:30 to 17:00 |

## 8. Risks

| Risk | Sign | Fallback | Lane |
|---|---|---|---|
| devkitARM won't install or build GBADoom | No boot by 11:00 | devkitPro Docker image | A |
| `-O3` makes matching too hard | 0 hand matches by 11:20 | Rebuild the target at `-O2`, say so | A |
| Model recites Doom | Recall matches our restructured build | Restructure harder; Skeptic flags near-copies; report it honestly | B |
| No real bug found | Nothing confirmed by 13:00 | Judge's change instead; don't call it a bug fix | D |
| Shareware license blocks public hosting | License text forbids repackaging | Venue network only, link down after judging, or demo screen only | D |
| Judges read it as a dashboard | Questions about "the UI" | Lead with Doom running; the grid stays secondary | C |
| Disqualified for unclear contributions | No built-today panel at 16:10 | The split is on the freeze checklist | All |
| Fetch.ai layer drags the core | No ASI:One reply by 12:20 | Drop it | A |
