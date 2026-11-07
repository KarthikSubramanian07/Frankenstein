# Claims audit (Lane A)

> **Update 13:16 (Lane A):** the memory probe was rerun with a best-reconstruction prompt: 0 refusals, 0 of 20 compile against GBADoom's real headers. The model writes prBoom's signatures, not GBADoom's. Use: "Asked to rebuild 20 GBADoom functions from memory, Muse Spark got none to compile against the real source: it remembers prBoom, not GBADoom." Lab tests are now 49 (`python3 -m pytest -q lab/tests`).


Audited 2026-11-07 13:13 PT against `crew/exports/{doom_r01,bench_r01}/*`, `runs/r_asi_01/metrics.json`, `lab/out/{manifest,memory_probe}.json`, `DECISIONS.md`, `crew/EXPERIMENTS.md`, `crew/STATUS.md`, `creature/STATUS.md`, `lab/STATUS.md`, `lab/INTEGRATION_*.md` and git log (last commit 13:09). Only `lab/CLAIMS_AUDIT.md` was written. Other lanes own the fixes.

Checks I ran myself:
- `python3 -m lab.referee rebuild --recovered crew/exports/doom_r01/recovered` gave `identical: true`, `recovered: 28`, `from_original: 540`, `pct_agent_code: 0.25`, `rejected_count: 0`, SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2` on both sides.
- `crew/exports/doom_r01/recovered` holds 28 files. `bench_r01/recovered` holds 14.
- Manifest: 795 functions in total. 568 are game code (398 train, 170 held out) and 227 are library code (toolchain, libtimidity, C++ layer, `.s`).
- `doom_r01` events: 0 `reviewer: gemini` events, 0 `idiom.judged` events, 1 triage event covering 208 functions. All 5 `decide_next` calls said `escalate`. `library_backend` is `local-json`.
- `pytest lab/tests/test_lint_hardening.py` gave **16 passed**. Across `lab/tests`, 18 tests match `-k lint`.

## Fix first (most likely to be challenged by a judge)

1. **"Every match teaches the crew a habit, so the next game goes faster" / "TIME TRIAL: FASTER ON FUNCTIONS IT HAS NEVER SEEN."** The held-out test came out 30 vs 28 of 40, with the same 1.50 attempts and $0.081 per match. Lane B writes "we do not claim either treatment helped." No second game has been run. (README:46, MESSAGING:37/63, deck:67, site:220, crew/README:11)
2. **The sponsor "organs" lines for Gemini, MongoDB and Snap.** No exported run contains a Gemini review. Every exported run used `local-json` and not Atlas. Snap's triage covered 208 functions, its fake gate rejected nothing, and Snap off came out slightly cheaper. (README:75-77, MESSAGING:49-51/72/75, crew/README:34-36, site:426/442/451)
3. **"Lies get caught" / "'Matched it. Pretty sure.' gets stamped REJECTED."** No real run has caught a false claim. In `doom_r01` a false claim was impossible by construction (EXPERIMENTS: claims came only after MATCH). The real catches are 4 byte-matching fakes per held-out run, and the Checker's deterministic rules caught them, not Snap. (README:29/45/67, MESSAGING:36, crew/README:10/13)
4. **The face, the "fix" and phones playing the "fixed game".** The face function is out of reach (best 0.7%, stopped 12:49). The finale is an honest modification: a hand-written 44-byte static-face stub, not a bug fix. No swap or phone publish has been observed, and real phones are unverified. (README:31, deck:69/129/195, site:296/381-382, RUN_OF_SHOW:47)
5. **"Scrambled so they can't recite it" plus the memory-probe answer.** Under the referee's comparison, the variant changes only 4 of 36 functions. The probe is 0 of 20 on both builds, but 10 of those were refusals and 10 did not compile, so it shows the model failed to recite Doom here, not that it doesn't know Doom. MESSAGING still has the blanks `[m]` and `[v]`. (README:52, MESSAGING:41/80)

## 1. Unsupported or wrong

| # | Claim | File:line | What the evidence says | Replacement sentence |
|---|---|---|---|---|
| U1 | "Every match teaches the crew a habit, so the next game goes faster." | README.md:46, docs/MESSAGING.md:37, crew/README.md:11, site/index.html:220 | Held-out, library on vs off: 30 vs 28 of 40, same 1.50 attempts and $0.081 per match, inside the noise (DECISIONS 12:38, crew/EXPERIMENTS.md). No second game has been run. | "**Learn.** Every match teaches the crew a habit. On 40 held-out Doom functions, habits on matched 30 and habits off matched 28, which is inside the noise, so we don't claim a speed-up yet." |
| U2 | "Habits that stop helping get retired." | README.md:46, site/index.html:220 | The rule exists (DECISIONS 12:16), but `doom_r01` has 0 `idiom.judged` events. No exported run shows a habit being retired. | "Habits are scored on results and can be retired; no run shown today has retired one yet." |
| U3 | "TIME TRIAL: FASTER ON FUNCTIONS IT HAS NEVER SEEN." | docs/03_PITCH_DECK.md:67 | Same as U1. Minutes per match were 0.99 with the library on and 1.04 with it off, a difference inside the noise. | "TIME TRIAL: LIBRARY ON 30/40, OFF 28/40. TOO CLOSE TO CALL." |
| U4 | "Time trial: held-out run with the library on beats the ghost car with it off." | docs/MESSAGING.md:63 | Same as U1. | "Time trial: library on 30 of 40, ghost with it off 28 of 40, same attempts per match. Inside the noise, and we say so." |
| U5 | "Is the improvement real? … Those are the numbers." | docs/MESSAGING.md:82 | The numbers show no measurable improvement. | "Is the improvement real? Not yet measurable: 30 vs 28 of 40 held-out functions, same cost per match. A harder round is running." |
| U6 | Gemini: "A different lab double-checks every match." | README.md:77, docs/MESSAGING.md:51, crew/README.md:36, site/index.html:451 | `doom_r01` has 0 Gemini reviews (Gemini was added at 12:11, after the run). The held-out runs had no Gemini (EXPERIMENTS). `r_asi_01` has `second_opinion_reviews: 0`. | "Wired in as a second reviewer next to Snap; none of the runs shown today used it yet." (Or drop the row.) |
| U7 | MESSAGING Gemini proof artifact: "`second_opinion_reviews` in `metrics.json`." | docs/MESSAGING.md:75 | The field is absent from both exports and is 0 in `r_asi_01`. | "Proof artifact: none yet; no exported run has a Gemini review." |
| U8 | MongoDB: "Remembers every trick, so the next game is faster." | README.md:76, docs/MESSAGING.md:50, crew/README.md:35, site/index.html:442 | Atlas went live at 13:05 (DECISIONS). `doom_r01`, `bench_r01` and `r_asi_01` all have `library_backend: local-json`, and `r_asi_01` has `memory.backend: none`. No faster second game. | "Holds the habit library and every run's events in Atlas since 13:05; the runs shown today used the local copy." |
| U9 | Snap: "Reads the whole game at once and decides where every attempt goes." | README.md:75, docs/MESSAGING.md:49, crew/README.md:34, site/index.html:426 | Triage in `doom_r01` covered 208 functions in 1 event (4 triage calls in metrics). The game has 568 functions. Triage was off in every held-out run. Snap said "escalate" 19 of 20 times and never abandoned. The gate rejected 0 (max 0.68 against a 0.85 threshold). Snap off was slightly cheaper ($0.076 vs $0.081 per match). | "Orders the queue (208 functions in one pass) and decides keep, escalate or abandon after every miss." |
| U10 | "Snap reads the whole game at once (384K context)" and "Snap on vs off held-out runs" as the Subquadratic proof. | docs/MESSAGING.md:72 | See U9. The on/off runs show no gain, and the comparison was biased against Snap by a now-fixed bug (EXPERIMENTS). | "Snap sets triage order and budgets, decides keep/escalate/abandon, gates fakes, steers Play-to-recover and routes plain-words asks. On easy held-out functions it matched 30 vs 29 without it, inside the noise, with a bug biasing against Snap." |
| U11 | "SubQ Snap reads the whole game and points at the function behind it." | site/index.html:157 | The router is a hint: hud precision@10 1/10, weapons 4/10 (DECISIONS 11:57). The face ranked #1 once, at p 0.88. | "SubQ Snap reads the game's code and suggests the function behind it, a guess we label as one." |
| U12 | "Agents lie. … Lies get caught." / "A match that doesn't hold is rejected … and counted." | README.md:45, :67, crew/README.md:10, :13 | Every real run has 0 false claims. In `doom_r01` a Digger could only claim after MATCH (EXPERIMENTS). Real catches are 4 byte-matching fakes per held-out run, all from the Checker's deterministic rules, on 2 functions. | "Every claim is re-checked with a fresh compile. On held-out Doom the Checker threw out 4 byte-matching fakes per run; no Digger has made a false claim in a real run yet." |
| U13 | "'Matched it. Pretty sure.' gets stamped REJECTED." (presented as what happens) | README.md:29, docs/MESSAGING.md:62 | No real false claim exists (U12). The site labels its version "Illustration" (site:245). | "A claim that a fresh compile can't reproduce gets stamped REJECTED (shown here as an illustration; real runs so far caught fakes, not false claims)." |
| U14 | "Two labs (SubQ Snap and Gemini) screen every match for fakes." | README.md:22 (diagram alt), docs/MESSAGING.md:62 | Gemini: see U6. Snap's screen rejected nothing. | "The Checker screens every match for fakes with fixed rules, and SubQ Snap adds a second screen." |
| U15 | "Doom … scrambled so they can't recite it." | README.md:52, docs/MESSAGING.md:41 | The variant has 11 body-only edits, but under the referee's comparison only 4 of 36 functions change (DECISIONS 11:44). Function names are replaced with anonymous `fn_` ids. | "Doom is our first patient: famous, hidden from the agents, its names stripped and a few functions privately edited, and checkable byte for byte." |
| U16 | "Didn't the model just remember Doom? … It matched [m] of 20 … and [v]." | docs/MESSAGING.md:80 | `memory_probe.json`: 0 of 20 on unmodified and 0 of 20 on the variant. 10 were REFUSED and 10 were NO_COMPILE. | "We asked Muse Spark to write 20 Doom functions from memory. It matched 0 of 20 on the original build and 0 on ours: it refused 10 and the other 10 didn't compile against Doom's real headers." |
| U17 | "Edit the C, patch one function, and the room plays the fixed game on their phones." | README.md:31 | The finale is "honest visible modification rather than an unconfirmed original bug". No swap or `phone.published` has been observed, and iOS/Android are unverified (creature/STATUS.md). | "Edit the C, patch one function, and the referee proves only that function changed. Then the room plays it." (Keep "on their phones" only once phone play is verified.) |
| U18 | "WE FIX A BUG THE CREATOR NEVER PATCHED." / "A BUG THE CREATOR NEVER FIXED." / "We just did." | docs/03_PITCH_DECK.md:69, :129, :195 | No real bug was found. The finale is the static-face patch: hand-written display code, one function, 44 of 1,164 bytes (lab/INTEGRATION_CREATURE.md:15). | "WE CHANGE ONE FUNCTION. THE REFEREE PROVES NOTHING ELSE MOVED." |
| U19 | "Once the code is back, the game can be fixed. … Then the room plays it on their phones." | site/index.html:381-382 | Same as U17. The site's footnote already calls the diff an example. | "Once the code is back, the game can be changed. Change one constant, and exactly one byte changes." |
| U20 | "honest laptop-only fallback is real Doom + recovered face + …" / "real face recovery" | creature/obs/RUN_OF_SHOW.md:47, :40 | The face was not recovered: "face recovery must not be claimed" (creature/STATUS.md). B stopped at 12:49 with a best of 0.7%. | "The honest laptop-only fallback is real Doom, the static-face patch (labelled hand-written), referee evidence and a labelled recorded modification." |
| U21 | "checked it byte for byte against the original Doom." | lab/SUBMISSION_LANE_A.md:7 | The referee compares against the private variant of GBADoom (manifest, line 33 of the same file). | "Neither one reports a recovered function until a compiler has checked it byte for byte against the compiled game." |
| U22 | "25 tests cover this (`lab/tests/test_lint_hardening.py`)." | lab/SUBMISSION_LANE_A.md:45 | That file has **16** passing tests, and 18 lint-related tests exist across `lab/tests`. | "16 tests cover this (`lab/tests/test_lint_hardening.py`)." |
| U23 | "Doom target: 795 functions, 170 held out." | README.md:59, site/index.html:308 | 795 includes 227 library functions (toolchain, libtimidity). The game has 568 functions, 170 of them held out. | "Doom target: 568 game functions (170 held out), plus 227 library functions we don't count." |
| U24 | "87% of classic games are endangered, and most of their source code is gone." | README.md:12, docs/MESSAGING.md:18, crew/README.md:7, site/index.html:90 | The VGHF/SPN 2023 figure measures games that are not commercially available. It says nothing about source code. Deck slide 2 states that correctly. | "87% of classic US games are out of print (VGHF and SPN, 2023), and for many the source code is gone." |
| U25 | "'Bring back Doomguy's face,' in an ASI:One chat. SubQ Snap ranked the real face function first (p 0.88)." | README.md:28 | The ranking is real, but it came from an evaluation script, not a chat (DECISIONS 12:20). The site says "The chat is illustrative" (site:149). | "You ask in plain words, like 'bring back Doomguy's face.' In our test, SubQ Snap ranked the real face function first (p 0.88)." |
| U26 | "SubQ Snap watches the live game and sends the crew to whatever is on screen." / "so what you're looking at heals first" | README.md:48, site/index.html:327 | Director measured at 2.4 s on 30 heartbeats, 3 picks, **no frame** (DECISIONS 12:00). The desktop tap and live bridge are unverified (creature/STATUS.md). | "Play it, and we rebuild it: SubQ Snap's director takes what the emulator reports is running and picks what to rebuild next." |
| U27 | "PROVED: MATCH. 42 of 42 instructions identical." | docs/03_PITCH_DECK.md:157 | Invented example number, with no source. | Use a real verdict line from the ASI:One transcript, or "PROVED: MATCH. [n] of [n] instructions identical (from the transcript)." |
| U28 | "CURATOR PROVES THE REBUILD" / "THE REFEREE, EXCAVATOR AND CURATOR AGENTS" | docs/03_PITCH_DECK.md:159, :170 | Only two agents exist: Referee and Excavator (SUBMISSION, DECISIONS 12:46). No Curator agent appears in `lab/agents/`. | "REFEREE VERIFIES. EXCAVATOR RECOVERS AND ASKS THE REFEREE FIRST." / "THE REFEREE AND EXCAVATOR AGENTS" |
| U29 | "ATLAS VECTOR SEARCH … THE IDIOM LIBRARY, EVERY ATTEMPT AND VERDICT" | docs/03_PITCH_DECK.md:171-172 | `crew/library.py:4` uses `$text` search with no vector index. Exported runs used local JSON (U8). | "MONGODB ATLAS · THE IDIOM LIBRARY AND RUN RECORD (LIVE SINCE 13:05)" |
| U30 | "NAMING FROM SCREENSHOTS" | docs/03_PITCH_DECK.md:168 | `muse.image_calls` is 0 in every exported run. Names have `basis: "recovered code"`. | "EVERY DIGGER, THE DISTILLER, NAMING FROM RECOVERED CODE" |
| U31 | "Full-game Doom results: measured live today." | README.md:61, site/index.html:312-313 | No full-game run exists as of 13:13. The held-out on/off comparison does exist (U1). | Delete the row, or replace it with "Held-out, library on vs off \| 30 vs 28 of 40, inside the noise \| `crew/EXPERIMENTS.md`". |
| U32 | "a rebuilt ROM with an identical SHA-1, playing on a phone" | README.md:22 (diagram alt) | The rebuild is identical (verified). Browser boot of the same engine is real. Physical phones and QR are unverified (creature/STATUS.md). | "a rebuilt ROM with an identical SHA-1, playable in a browser." |

## 2. Stale

| Claim | File:line | Was | Now |
|---|---|---|---|
| Memory probe numbers "are blanks until the probe runs" | lab/SUBMISSION_LANE_A.md:3 | blanks | 0 of 20 on both builds, filled at line 61. Delete the sentence. |
| `[m]` / `[v]` of 20 | docs/MESSAGING.md:80 | blank | 0 and 0 (U16) |
| "Next: memory probe once the Meta key lands." | lab/STATUS.md:21 | pending | done at 13:06. Same file, line 19. |
| Time trial `[__]` and memory test `[__] OF 20` | docs/03_PITCH_DECK.md:94-102 | blanks | Held-out r02/r03/r04: 0.99 / 1.04 / 0.88 min per match; 75% vs 70%; memory 0 of 20; false claims 0; fakes rejected 4 per run (crew/EXPERIMENTS.md). Muse in doom_r01: 114 calls, $0.026 per match (estimated). |
| `FILE 1 DOOM [__]%` and both checksums | docs/03_PITCH_DECK.md:122-127 | blanks | 28 functions, 0.25% of code bytes. Both SHA-1s are `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`, IDENTICAL (verified 13:13). Lead with "28 functions", not "0.25%" (lab/INTEGRATION_STAGE.md:9). |
| Toolchain "pret agbcc, m2c, objdiff, decomp-permuter" | docs/03_PITCH_DECK.md:219 | early plan | devkitARM r68 (GCC 16.1.0), GBADoom flags minus `-flto=8` (manifest, lab/TOOLCHAIN.md) |
| "The 1,164-byte face is next." | site/index.html:296 | 12:20 plan | Stopped at 12:49: 2 attempts, best 0.7%, $0.52, "out of reach today" (crew/STATUS.md). Use "The 1,164-byte face is still out of reach." |
| Finale "decide by 13:00: a real bug, or the honest modification" | creature/README.md:9 | open | Decided: honest visible modification (creature/STATUS.md) |
| "Gemini: a second opinion on every match" (Verified now) | crew/STATUS.md | listed as verified | No exported run has a Gemini review (U6) |
| Face function "1,160-byte `fn_0801B34C`"; "796 functions: 569 game (171 heldout)" | DECISIONS.md:70-71 | pre-variant | `fn_0801B298`, 1,164 bytes; 795 functions, 568 game, 170 held out (log entries; leave them and cite the newer lines) |
| "$0.73 of Muse" without a caveat | README.md:56, site:291 | presented as exact | `cost_estimated: true`: Wonder is priced at Spark rates. Say "about $0.73 (estimated)". |

## 3. Supported

| Claim | Evidence |
|---|---|
| doom_r01: 28 of 30, 1.29 attempts per match, 268 s, $0.06 Snap, 38 habits, 0 false claims | `crew/exports/doom_r01/metrics.json` (elapsed 268.3, snap 0.0566, library_size 38, 38 `idiom.learned`) |
| Rebuild from 28 recoveries is identical; 0.25% of code bytes | Re-ran `lab.referee rebuild` at 13:13: identical, 28, 0.25, 0 rejected |
| Bench: 14 of 14, 12 first try, 80 s, $0.29, 24 idioms, labelled bench | `bench_r01/metrics.json` (16 attempts for 14 matches, 80.2 s, $0.2943, 24) and DECISIONS 11:48 |
| Router put the face function first, p 0.88, checked against the hidden map afterwards | DECISIONS 12:20 |
| Router "5 to 7 times better than random" | DECISIONS 11:57: 1/10 vs 0.2 and 4/10 vs 0.55 |
| Referee 0.1 to 0.2 s per check | DECISIONS 11:24 |
| Relinking unchanged C changes 0 bytes; one constant changes 1 byte | DECISIONS 11:49, lab/STATUS.md |
| 170 held-out game functions | manifest: 170 with `scope: game`, `split: heldout` |
| Memory probe 0 of 20 on both builds, 10 refused, 10 no-compile | `lab/out/memory_probe.json` |
| 11 lint rules | `lab/LINT.md` table has 11 rule rows |
| Static-face stub: 44 bytes, one function (`fn_0801B298`) | `lab/demo/static_face_report.json` (`patched_bytes: 44`), INTEGRATION_CREATURE:15 |
| Two Fetch.ai agents, addresses, mailbox, self-test MATCH logged by both | DECISIONS 12:01, 12:14, 12:46 |
| ASI:One MATCH and REJECTED at 12:18 | lab/STATUS.md only. No transcript file in the repo, so keep a screenshot ready. |
| Muse wrote the C, with Wonder escalation | `muse.by_model`: Spark 103 calls, Wonder 11 |
| Snap latencies: review median 0.55 s, slowest 2.8 s; decide 0.37 to 1.17 s; triage 208 functions in 3.4 s; director 2.4 s; eyes 0.7 s | `doom_r01` `snap.decision` payloads, DECISIONS 12:00. crew/README says "median 0.57 s"; doom_r01 alone gives 0.55. |
| Names shown as guesses | `doom_r01/names.json`: all 28 have `inferred: true` |
| Held-out experiment write-up is honest | `crew/EXPERIMENTS.md` matches DECISIONS 12:38 |
| Variant is private, GPL patch offered after judging | DECISIONS 11:41, SUBMISSION:57 |
| Site footnotes already label illustrations (chat, lie, diff, play-to-recover) | site/index.html:102, 149, 245, 354, 380 |
