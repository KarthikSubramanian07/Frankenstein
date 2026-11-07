# Experiments: does the crew get better, and does SubQ Snap earn its place?

Frankenstein rebuilds a game's lost source code from the compiled game, and accepts a function only when a compiler turns the agents' C into byte-identical machine code. Doom (GBADoom) is our first patient, because we can check every answer against hidden source. This page reports the held-out experiments on the real GBADoom target (ROM SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`), judged by Lane A's real referee. Every number in a results table is copied from that run's own `metrics.json`. Numbers taken from the event logs are marked as such.

**Short version.** We ran two rounds on 2026-11-07. In round 2 (harder functions, 57 to 200 bytes), the frozen library with its solved-before case memory matched 6 of 20, exactly as many as no library. Snap off matched 4 of 20. On the 40 easiest held-out functions, the clean rerun matched 29 with the library, 29 without it and 30 with Snap off. None of these differences is larger than the run-to-run noise we can see, so we do not claim that the library, the case memory or SubQ Snap improved the match rate. What the data does show is below, including where the crew spends its money.

## Round 2: harder functions, clean code (13:00 to 13:55)

### Design

- **Training run doom_r11.** 40 train-split Thumb functions of 57 to 200 bytes, picked by size strata (sorted by size, cut into 40 equal bins, one function drawn per bin with seed 7; list in `runs/_train_set_v2.txt`). It ran with `--library learning` into a fresh `runs/_doom_lib_v2.json`, Snap on and Gemini on. Afterwards, `python -m crew.cases` loaded the verified training solutions from doom_r11 and doom_r01 (37 functions, train split only) into the case memory. Both files were then copied to `runs/_doom_lib_v2_frozen.json` and `runs/_doom_lib_v2_frozen.cases.json`. Their SHA-1s were unchanged after every held-out run.
- **Held-out list.** 20 held-out Thumb functions of 57 to 200 bytes (58 to 192 in practice), picked the same way (20 size bins, seed 7) and saved to `runs/_heldout_set_v2.txt`. The plan said 30. Training showed about $0.14 per attempted function on this size range, so 30 functions per arm would not have fit three arms inside the $15 cap, and we cut the list to 20 before any held-out run started.
- **Arms.** doom_r12: library on (frozen idioms plus case memory), Snap on. doom_r13: library off, Snap on, with `--names` so it pays the same naming overhead. doom_r14: library on, Snap off (`--no-snap`). Gemini second opinion on in all three. 6 Diggers, at most $0.60 of Muse per function, run budget $3.40 each. r12 and r13 ran in parallel, then r14.
- **Same code for every arm.** All three held-out arms ran from a git worktree pinned at `2f5432e` (crew code as of `2f78923`, which added the case memory), so no teammate commit could change the code between arms. The training run ran from a worktree pinned at `67e6af2` (crew code as of `457603a`, before MongoDB Atlas and the case memory). Both include the round-1 bug fixes (`7ac47a2`, `c10b4b0`) and claim-first (`0f5a981`). None of round 2 includes `74997cf` (the aligned side-by-side diff for PARTIAL verdicts), which landed at 13:28, after r12 and r13 had started. That change is the one most likely to matter on these functions, and it is untested here.
- **The run budget bound every round-2 run.** Each run stops starting new work at 90% of its budget. In doom_r11 that cut 5 functions short and left 10 of the 40 (the largest, 144 to 200 bytes) unattempted. In the held-out arms it cut 3 (r12), 4 (r13) and 4 (r14) functions short near the end, and r14 never started 2 of its 20. So these are "matches within $3.40" numbers, not "matches with unlimited attempts" numbers.

### Results

Cost is Muse spend (Wonder is priced at Spark rates, so every cost is an estimate). Snap cost is separate: $0.003 to $0.004 per run.

| Run | Commit | Label | Matched | Match rate | Attempts per match | Minutes per match | Cost per match | Muse cost | False claims caught | Fakes rejected | Snap calls (mean latency) | Muse calls by model | Library backend |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| doom_r11 | 67e6af2 | doom · train v2 (57-200 B) · library learning · snap on | 9 / 40 | 0.225 | 2.33 | 2.55 | $0.471 | $4.24 | 1 | 0 | 52 (519 ms): 9 review, 43 decide_next | Spark 133, Wonder 46 | local-json |
| doom_r12 | 2f5432e | doom · heldout v2 · library on (idioms + cases) · snap on | 6 / 20 | 0.300 | 2.00 | 1.71 | $0.536 | $3.22 | 3 | 0 | 37 (471 ms): 6 review, 31 decide_next | Spark 89, Wonder 33 | mongodb-atlas (idioms__doom_lib_v2_frozen) |
| doom_r13 | 2f5432e | doom · heldout v2 · library off · snap on | 6 / 20 | 0.300 | 2.17 | 1.90 | $0.547 | $3.28 | 1 | 0 | 37 (405 ms): 6 review, 31 decide_next | Spark 104, Wonder 23 | mongodb-atlas (library off, never searched) |
| doom_r14 | 2f5432e | doom · heldout v2 · library on (idioms + cases) · snap off | 4 / 20 | 0.200 | 2.25 | 2.06 | $0.822 | $3.29 | 0 | 0 | 0 (off) | Spark 96, Wonder 17 | mongodb-atlas (idioms__doom_lib_v2_frozen) |

More from the same runs. The case-memory size is from `metrics.json`; everything else in this table comes from the event logs.

| Run | Snap decisions (keep / escalate / abandon) | Functions escalated by Snap | Matched after a Snap escalation to Wonder | Case memory size | Cases offered (`idiom.used` with a `case:` id) | Habits judged in training |
|---|---|---|---|---|---|---|
| doom_r11 | 6 / 37 / 0 | 22 | 5 | not in this code | 0 | 3 adopted, 4 retired, 11 still candidates (18 idioms) |
| doom_r12 | 5 / 25 / 1 | 11 | 0 | 37 | 35, to 18 of 20 functions | frozen (never judges) |
| doom_r13 | 9 / 21 / 1 | 11 | 1 | 0 | 0 | off |
| doom_r14 | Snap off (fixed rule escalates after 3 failures) | none | 1 matched after a fixed-rule Wonder attempt | 37 | 31, to 16 functions | frozen |

The 7 habits judged in training: adopted "global byte-pointer base with literal-pool offsets", "args parked in r4-r5-ip with pop-bx epilogue" and "guarded clear emits cmp-beq guard" (each 1 quick match in 3 uses, at or above the baseline). Retired: "large offset via movs plus lsls", "large aligned offset built with movs plus lsls", "if-else with shared tail" and "park struct pointer in r4 across call" (each 0 quick matches in 4 uses).

### Findings

- **Library on vs off (r12 vs r13): 6 against 6.** Both runs matched the same 4 functions. Each also matched 2 that the other did not (r12: `fn_080039F8`, `fn_08012770`; r13: `fn_08008D04`, `fn_0800DF24`). Cases were offered on 35 occasions, to 18 of the 20 functions, and the matched count did not move. On this evidence, neither the idioms nor the solved-before cases help on held-out Doom functions of this size.
- **How far apart runs land.** We could not afford a repeat run. The closest we have is r12 against r13: two runs with near-identical outcomes overall, yet 4 of their 8 distinct matched functions flipped between them. With matches this rare, one run's per-function outcome is close to a coin flip at the margin. A real effect would have to be several functions per 20 to show through.
- **Snap on vs off (r12 vs r14): 6 against 4,** at $0.54 against $0.82 per match. This is the only comparison in either round that leans the way the treatment predicts. It is still only 2 functions, and r14 never started 2 of its functions because the budget ran out. We read it as a weak hint, not a result. Snap's decisions were mostly "escalate" (25 of 31 in r12). It abandoned once per run, and its fakematch gate rejected nothing (no run rejected a fake).
- **Wonder escalation rarely converts on held-out code.** In training, 5 of the 9 matches came after Snap escalated to Wonder. In the held-out arms, Snap-escalated Wonder attempts produced 0 matches (r12) and 1 (r13), while Wonder took 10% (r13) to 21% (r12) of the spend.
- **Claim-first works as intended.** With Diggers now staking a claim before they see the verdict, the Checker caught real false claims: 1 in training, 3 in r12 and 1 in r13. Every false claim was refused by the referee, and no false or fake match was accepted.
- **Where the money goes.** About $0.53 to $0.82 of Muse per match on these functions, against $0.08 in round 1. Most of it goes to functions that never match: by the event logs, 81% to 86% of the per-attempt spend in the held-out arms went to functions that ended unmatched.
- **What the data suggests next.** Run the aligned diff (`74997cf`) on this same list, since a 2% positional score for code that is 60% structurally right gives the Diggers nothing to climb. Raise the run budget so no arm is cut short. Repeat each arm at least twice before claiming any effect.

doom_r12 is published in `crew/exports/doom_r12/` (`python -m crew.export doom_r12`) as the demo run for this round: MongoDB Atlas library, solved-before cases, 3 real false claims caught, and a rebuilt ROM that is identical by SHA-1.

Total Muse spend for round 2: $14.02 ($4.24 training and $9.78 for the three held-out arms).

## Round 1 rerun on current code (easy functions, 13:49 to 14:04)

The same 40-function easy list as round 1 (`runs/_heldout_set.txt`), with all three arms run in parallel from a worktree pinned at commit `0102bfb`. That commit includes both bug fixes, claim-first and the aligned side-by-side diff (`74997cf`). "Library on" here means the frozen round-1 library (`runs/_doom_lib_v1_frozen.json`, the same 38 idioms) plus a case memory of the 28 verified doom_r01 training solutions. Gemini was on in all three arms, with 6 Diggers, $0.60 per function and a $2.90 run budget. No arm reached its budget (the largest spent $2.58).

| Run | Commit | Label | Matched | Match rate | Attempts per match | Minutes per match | Cost per match | Muse cost | False claims caught | Fakes rejected | Snap calls (mean latency) | Muse calls by model | Library backend |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| doom_r02b | 0102bfb | doom · heldout v1 rerun · library on (idioms + cases) · snap on | 29 / 40 | 0.725 | 1.41 | 0.89 | $0.076 | $2.20 | 2 | 3 | 53 (562 ms): 29 review, 24 decide_next | Spark 147, Wonder 37 | mongodb-atlas (idioms__doom_lib_v1_frozen) |
| doom_r03b | 0102bfb | doom · heldout v1 rerun · library off · snap on | 29 / 40 | 0.725 | 1.45 | 0.76 | $0.075 | $2.18 | 2 | 5 | 52 (757 ms): 29 review, 23 decide_next | Spark 153, Wonder 31 | mongodb-atlas (library off, never searched) |
| doom_r04b | 0102bfb | doom · heldout v1 rerun · library on (idioms + cases) · snap off | 30 / 40 | 0.750 | 1.47 | 0.78 | $0.086 | $2.58 | 0 | 3 | 0 (off) | Spark 168, Wonder 17 | mongodb-atlas (idioms__doom_lib_v1_frozen) |

From the event logs: case memory size 28 in r02b and r04b, offered 28 times to 17 functions in each. Snap decided keep / escalate / abandon 0 / 24 / 0 in r02b and 2 / 21 / 0 in r03b. Functions matched after a Snap escalation to Wonder: 1 (r02b) and 2 (r03b). r04b matched 2 functions after a fixed-rule Wonder attempt.

**Findings.**
- **Library on vs off: 29 against 29.** 27 functions matched in both runs, and each run matched 2 the other missed. Cost per match was the same ($0.076 against $0.075). The idioms and cases made no measurable difference on easy functions either.
- **Snap on vs off: 29 against 30.** Snap off matched one more function and cost a little more per match ($0.086 against $0.076), with more Spark calls (168 against 147) and fewer Wonder calls (17 against 37). Snap's fakematch gate again rejected nothing. All rejected fakes (3 to 5 per run) came from the Checker's fixed rules.
- **How far apart runs land.** The clean rerun of r02 (r02b) matched 29 where the confounded original matched 30. Between any two of these four easy-list runs, 3 to 8 functions flip, while the totals stay within 29 to 30. So on this list a one- or two-function difference is noise.
- **Claim-first.** False claims are real now: 2 caught in each Snap-on arm, 0 with Snap off. No false or fake match was accepted.

Muse spend for the rerun: $6.96. Total for round 2 plus the rerun: $20.98, inside the $23 cap.

## Round 1 (original runs, 12:06 to 12:33; confounded by two bugs that are now fixed)

These numbers are kept as they were first reported. The empty-turn bug (`7ac47a2`) and the escalation bug (`c10b4b0`) affected every run unevenly, as explained below, so treat this round as superseded by the clean rerun above. Its numbers are kept only for the record.

**Round 1 short version (as first reported).** On 40 held-out functions, the frozen idiom library matched 30 against 28 without it, and SubQ Snap on matched 30 against 29 with Snap off. Both differences are one or two functions, which is inside the noise for a sample this small.

### Setup

- **Target.** GBADoom variant ROM, SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2` (from `lab/out/manifest.json`), built with devkitARM r68 (GCC 16.1.0) using the GBADoom Makefile flags minus `-flto=8`. Each candidate is judged by Lane A's real referee running locally (`REFEREE_URL=http://127.0.0.1:7101`, not the mock).
- **Function list (chosen once, before any held-out run).** From the 170 held-out game functions, we kept Thumb functions between 16 and 200 bytes, sorted them by size, and took the first 40. They are 16 to 56 bytes long, 25 of them call other functions, and the manifest's difficulty score ranges from 0.016 to 0.039, so this is the easy end of Doom. The list is in `runs/_heldout_set.txt` and every held-out run used it through `--fns`. With `--fns`, Snap's whole-program triage does not reorder the queue, so order cannot confound the comparison.
- **Models.** Diggers write C with Muse Spark 1.3 (`muse-spark-1.3`) at reasoning effort `high` as the base setting. Easy functions start at `medium` and move to `high` after 3 failed attempts. A stuck function can escalate to Muse Wonder 1.0 (`muse-wonder-1.0`). With Snap on, escalation happens only when Snap says so. With Snap off, a fixed rule escalates after 3 failed attempts.
- **Budgets.** 6 Diggers in parallel. Each function gets an attempt budget from its difficulty score (4 attempts for every function in this list) and at most $0.60 of Muse. The run budget was $8 for r02 and r03, and $3 for r04 after the team lowered the total spend cap. No run came close to its run budget (the largest spent $2.44), so the budget never cut a run short.
- **What SubQ Snap does** (SubQ Snap 1.1, Decisions API). (1) *Triage*: one whole-program pass scores every function's difficulty and sets the queue order. This is off whenever `--fns` is used, so it was off in all held-out runs. (2) *Keep, escalate or abandon*: after every failed attempt from the 2nd on, Snap decides whether to try again on Spark, move to Wonder, or stop. (3) *Fakematch gate*: every byte MATCH also needs low fakematch and recital probabilities from Snap (threshold 0.85) before the Checker accepts it. `--no-snap` turns off all three, and the Checker keeps its deterministic rules (no `volatile` tricks, no absolute address casts, no goto chains, no padding, no cast chains).
- **Idiom library.** A local JSON file, `runs/_doom_lib.json`, learned during the training run doom_r01 (38 idioms). Before any held-out run it was copied to `runs/_doom_lib_frozen.json`, and that copy is what "library on" means. Its SHA-1 was the same before and after the held-out runs, so held-out runs never learned from their own test set.
- **Equal overhead.** The library-off run used `--names`, so it pays for the same naming call per match as the library-on run. All held-out runs used `--no-rebuild`, so ROM rebuilds never compete with the referee.
- **Gemini second opinion.** The Gemini reviewer was added to the Checker at 12:11, after r02 and r03 had started. To keep the three runs comparable, r04 ran with `--no-gemini`. No held-out run used Gemini.

### Which crew code each run used

| Run | Started | Crew code | Notes |
|---|---|---|---|
| bench_r01 | 11:40 | before `feee7a3` | bench, not Doom |
| doom_r01 | 12:01 | `feee7a3` | training run (not started by this experiment) |
| doom_r02 | 12:06 | `feee7a3` | |
| doom_r03 | 12:07 | `feee7a3` | |
| doom_r04 | 12:21 | `13cdcbc` | run with `--no-snap --no-gemini` |

We checked the diff from `feee7a3` to `13cdcbc` by hand. With the flags r04 used, it changes nothing about how a function is attempted or judged. It adds the Gemini reviewer (turned off), habit judging for learning libraries (a frozen library never judges, and its search order is unchanged because the frozen file has no status fields), bookkeeping of which idioms a Digger saw, and new export and jobs code. None of the four Doom runs includes the later fixes `7ac47a2` (an empty model turn is never sent back to the API), `0f5a981` (Diggers can stake a claim before seeing the verdict) or `c10b4b0` (one failed Wonder call no longer ends escalation for the whole run).

### Results

Cost is Muse spend. Wonder calls are priced at Spark rates because Wonder has no published price yet, so every Doom cost is an estimate (`cost_estimated: true`). Snap cost is separate and tiny.

| Run | Label | Matched | Match rate | Attempts per match | Minutes per match | Cost per match | Muse cost | False claims caught | Fakematches rejected | Snap calls (mean latency) | Muse calls by model |
|---|---|---|---|---|---|---|---|---|---|---|---|
| bench_r01 | bench · train · library learning | 14 / 14 | 1.000 | 1.14 | 0.28 | $0.021 | $0.29 | 0 | 0 | none | Spark 44 |
| doom_r01 | doom · train · library learning | 28 / 30 | 0.933 | 1.29 | 0.38 | $0.026 | $0.73 | 0 | 0 | 37 (842 ms): 4 triage, 28 review, 5 decide_next | Spark 103, Wonder 11 |
| doom_r02 | doom · heldout · library on · snap on | 30 / 40 | 0.750 | 1.50 | 0.99 | $0.081 | $2.44 | 0 | 4 | 50 (677 ms): 30 review, 20 decide_next | Spark 187, Wonder 14 |
| doom_r03 | doom · heldout · library off · snap on | 28 / 40 | 0.700 | 1.50 | 1.04 | $0.081 | $2.26 | 0 | 4 | 48 (658 ms): 28 review, 20 decide_next | Spark 174, Wonder 16 |
| doom_r04 | doom · heldout · library on · snap off | 29 / 40 | 0.725 | 1.45 | 0.88 | $0.076 | $2.20 | 0 | 4 | 0 (off) | Spark 172, Wonder 15 |

Wall-clock time was 13.9 minutes for r02, 12.1 for r03 and 10.9 for r04. Snap cost $0.002 per held-out run (no triage) and $0.057 in r01 (triage read 1.39 M input tokens). The bench run uses a different compiler and different functions, so it is context only, never a Doom result. The training run uses different, train-split functions, so its higher match rate is not comparable either.

### A bug that affected every Doom run

While these runs were going, the team found a Digger bug (fixed in `7ac47a2` at 12:25). When the model spent its whole output budget reasoning, it returned an empty message. The Digger sent that empty turn back, the API answered HTTP 400, and the function ended as failed, even though the model had not run out of attempts. There was a second effect, found in this analysis and fixed in `c10b4b0`. If the failing call was a Wonder call, the Digger cleared the shared escalation setting, so every later escalation in that run stayed on Spark.

What the event logs show (an inference from the logs, not a field in `metrics.json`):

- Every function in this list had a 4-attempt budget, and Snap never chose to abandon. A function abandoned after fewer than 4 attempts therefore most likely ended through this bug. That happened to 6 functions in r02, 5 in r03, 3 in r04 and 1 in r01. `fn_080069E8` ended with 0 attempts in r03 and r04.
- In r02, Wonder attempts stopped at 12:10:50, and 7 functions that Snap escalated afterwards never ran on Wonder. In r03 the same thing cost 4 functions. r04 kept escalating to Wonder until its last minute.

So the bug hit the Snap-on runs harder than the Snap-off run. That biases the Snap comparison against Snap, by an unknown amount.

### Findings

**Library on (r02) vs library off (r03), both with Snap on: 30 against 28 of 40.** The two runs matched the same 28 functions. r02 also matched `fn_08009F9C` and `fn_08005AD0`, and r03 matched nothing that r02 missed. Attempts per match (1.50) and cost per match ($0.081) were the same. Leaving out the 7 functions that hit the bug in any of the three runs, the score is 30 against 28 of 33. A two-function gap on 40 functions is well within run-to-run noise, so this does not show the library helps on held-out Doom code. It is consistent with a small benefit and with none. These are also the 40 easiest held-out functions, and 27 of them matched in all three runs, so there was little room for a library to help.

**Snap on (r02) vs Snap off (r04), both with the frozen library: 30 against 29 of 40.** r02 matched `fn_08004E4C` and `fn_08005AD0` where r04 did not, and r04 matched `fn_08006B20` where r02 did not. Attempts per match were 1.50 against 1.45, cost per match $0.081 against $0.076, and minutes per match 0.99 against 0.88. Snap off was slightly cheaper and faster here. On this list Snap's escalate-or-quit decision almost always said escalate (19 of 20 decisions in r02, and the same in r03), so it acted much like the fixed rule, one failure earlier. It never chose to abandon, so it saved no money. Its fakematch gate rejected nothing: the highest fakematch or recital probability it gave any accepted match was 0.68, below the 0.85 threshold. All 4 rejected fakematches in each run came from the Checker's deterministic rules, on the same two functions (`fn_08004E4C` and `fn_08004E68`). The bug described above hit the Snap-on run harder. In plain terms, this experiment does not show that SubQ Snap improves the match rate or the cost on easy functions, and the comparison is biased against Snap by a bug that is now fixed.

**False claims.** No run caught a false claim. In this crew code, a Digger could only claim after the referee had already said MATCH, so a false claim was nearly impossible by construction. Commit `0f5a981` lets Diggers stake a claim before they see the verdict, and later runs will measure real overconfidence.

**What would make these comparisons conclusive.** Rerun r02, r03 and r04 on current main (with `7ac47a2`, `0f5a981` and `c10b4b0`), on a list that includes harder functions (for example 60 to 200 bytes), and repeat each arm at least twice. Each run of 40 functions costs about $2.20 to $2.50 of Muse. That was not possible inside this experiment's $8 Muse cap: the three held-out runs here cost $6.90 together.

### Reproduce

```bash
FNS=$(cat runs/_heldout_set.txt)
cp runs/_doom_lib.json runs/_doom_lib_frozen.json
python -m crew.run --split heldout --fns "$FNS" --library on  --library-path runs/_doom_lib_frozen.json --diggers 6 --max-usd-per-fn 0.6 --no-rebuild --run-id doom_r02 --label "doom · heldout · library on · snap on"
python -m crew.run --split heldout --fns "$FNS" --library off --names --diggers 6 --max-usd-per-fn 0.6 --no-rebuild --run-id doom_r03 --label "doom · heldout · library off · snap on"
python -m crew.run --split heldout --fns "$FNS" --library on  --library-path runs/_doom_lib_frozen.json --no-snap --no-gemini --diggers 6 --max-usd-per-fn 0.6 --no-rebuild --run-id doom_r04 --label "doom · heldout · library on · snap off"
python contracts/validate.py runs/<id>/events.jsonl runs/<id>/metrics.json runs/<id>/names.json
```

r02 and r03 used `--budget-usd 8` and r04 used `--budget-usd 3`. All three files of every run passed `contracts/validate.py`. The 40 function ids are:

`fn_080032B8, fn_0800A174, fn_0800A270, fn_08019220, fn_08003B44, fn_08019BB0, fn_08003D20, fn_08004680, fn_08005788, fn_0800A43C, fn_080039DC, fn_08004E4C, fn_08004E68, fn_08006B44, fn_08005404, fn_08005A90, fn_08006B00, fn_080184FC, fn_08019B44, fn_0801C130, fn_080184D8, fn_08005A04, fn_08006B20, fn_08001A94, fn_08004AC4, fn_08005B9C, fn_0801C8FC, fn_080050DC, fn_08005738, fn_08009F9C, fn_08013028, fn_08005D7C, fn_08005424, fn_08005AD0, fn_080069E8, fn_080048BC, fn_080035CC, fn_08004798, fn_0801A99C, fn_0801D19C`

## Aligned side-by-side feedback (round 2 list, commit f6a92ed)

Same 20 hard held-out functions, library off, Snap and Gemini on, up to 6 attempts, $4.50 cap each. Only difference: Diggers get the aligned side-by-side diff (`crew/align.py`) on PARTIAL verdicts, or not.

| Run | Matched | Attempts/match | Cost/match | Cost |
|---|---|---|---|---|
| doom_align_on | 7/20 | 2.86 | $0.51 | $3.57 |
| doom_align_off | 7/20 | 3.00 | $0.58 | $4.05 |

Same match count; 6 functions matched in both, 1 only with aligned feedback, 1 only without. It was 12% cheaper per match with the aligned view, inside the noise of one run each. Where it visibly helped was on near-misses outside held-out evaluation: best attempts climbed (fn_0801AFF0 4.5% to 81.8%) and, with warm start, fn_0801ABC0 went from 90% to a match. Honest conclusion: no measured change in match rate on held-out functions.

