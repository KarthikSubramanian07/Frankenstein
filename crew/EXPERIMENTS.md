# Experiments: does the crew get better, and does SubQ Snap earn its place?

Frankenstein rebuilds a game's lost source code from the compiled game, and accepts a function only when a compiler turns the agents' C into byte-identical machine code. Doom (GBADoom) is our first patient, because we can check every answer against hidden source. This page reports the held-out experiments on the real GBADoom target, run on 2026-11-07 between 12:06 and 12:33 Pacific. Every number in the tables is copied from the run's own `metrics.json`. Numbers from the event logs are marked as such.

**Short version.** On 40 held-out functions, the frozen idiom library matched 30 against 28 without it, and SubQ Snap on matched 30 against 29 with Snap off. Both differences are one or two functions, which is inside the noise for a sample this small. A Digger bug also hit every run unevenly (details below), so neither comparison is clean yet. We do not claim that either treatment helped.

## Setup

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

## Results

Cost is Muse spend. Wonder calls are priced at Spark rates because Wonder has no published price yet, so every Doom cost is an estimate (`cost_estimated: true`). Snap cost is separate and tiny.

| Run | Label | Matched | Match rate | Attempts per match | Minutes per match | Cost per match | Muse cost | False claims caught | Fakematches rejected | Snap calls (mean latency) | Muse calls by model |
|---|---|---|---|---|---|---|---|---|---|---|---|
| bench_r01 | bench · train · library learning | 14 / 14 | 1.000 | 1.14 | 0.28 | $0.021 | $0.29 | 0 | 0 | none | Spark 44 |
| doom_r01 | doom · train · library learning | 28 / 30 | 0.933 | 1.29 | 0.38 | $0.026 | $0.73 | 0 | 0 | 37 (842 ms): 4 triage, 28 review, 5 decide_next | Spark 103, Wonder 11 |
| doom_r02 | doom · heldout · library on · snap on | 30 / 40 | 0.750 | 1.50 | 0.99 | $0.081 | $2.44 | 0 | 4 | 50 (677 ms): 30 review, 20 decide_next | Spark 187, Wonder 14 |
| doom_r03 | doom · heldout · library off · snap on | 28 / 40 | 0.700 | 1.50 | 1.04 | $0.081 | $2.26 | 0 | 4 | 48 (658 ms): 28 review, 20 decide_next | Spark 174, Wonder 16 |
| doom_r04 | doom · heldout · library on · snap off | 29 / 40 | 0.725 | 1.45 | 0.88 | $0.076 | $2.20 | 0 | 4 | 0 (off) | Spark 172, Wonder 15 |

Wall-clock time was 13.9 minutes for r02, 12.1 for r03 and 10.9 for r04. Snap cost $0.002 per held-out run (no triage) and $0.057 in r01 (triage read 1.39 M input tokens). The bench run uses a different compiler and different functions, so it is context only, never a Doom result. The training run uses different, train-split functions, so its higher match rate is not comparable either.

## A bug that affected every Doom run

While these runs were going, the team found a Digger bug (fixed in `7ac47a2` at 12:25). When the model spent its whole output budget reasoning, it returned an empty message. The Digger sent that empty turn back, the API answered HTTP 400, and the function ended as failed, even though the model had not run out of attempts. There was a second effect, found in this analysis and fixed in `c10b4b0`. If the failing call was a Wonder call, the Digger cleared the shared escalation setting, so every later escalation in that run stayed on Spark.

What the event logs show (an inference from the logs, not a field in `metrics.json`):

- Every function in this list had a 4-attempt budget, and Snap never chose to abandon. A function abandoned after fewer than 4 attempts therefore most likely ended through this bug. That happened to 6 functions in r02, 5 in r03, 3 in r04 and 1 in r01. `fn_080069E8` ended with 0 attempts in r03 and r04.
- In r02, Wonder attempts stopped at 12:10:50, and 7 functions that Snap escalated afterwards never ran on Wonder. In r03 the same thing cost 4 functions. r04 kept escalating to Wonder until its last minute.

So the bug hit the Snap-on runs harder than the Snap-off run. That biases the Snap comparison against Snap, by an unknown amount.

## Findings

**Library on (r02) vs library off (r03), both with Snap on: 30 against 28 of 40.** The two runs matched the same 28 functions. r02 also matched `fn_08009F9C` and `fn_08005AD0`, and r03 matched nothing that r02 missed. Attempts per match (1.50) and cost per match ($0.081) were the same. Leaving out the 7 functions that hit the bug in any of the three runs, the score is 30 against 28 of 33. A two-function gap on 40 functions is well within run-to-run noise, so this does not show the library helps on held-out Doom code. It is consistent with a small benefit and with none. These are also the 40 easiest held-out functions, and 27 of them matched in all three runs, so there was little room for a library to help.

**Snap on (r02) vs Snap off (r04), both with the frozen library: 30 against 29 of 40.** r02 matched `fn_08004E4C` and `fn_08005AD0` where r04 did not, and r04 matched `fn_08006B20` where r02 did not. Attempts per match were 1.50 against 1.45, cost per match $0.081 against $0.076, and minutes per match 0.99 against 0.88. Snap off was slightly cheaper and faster here. On this list Snap's escalate-or-quit decision almost always said escalate (19 of 20 decisions in r02, and the same in r03), so it acted much like the fixed rule, one failure earlier. It never chose to abandon, so it saved no money. Its fakematch gate rejected nothing: the highest fakematch or recital probability it gave any accepted match was 0.68, below the 0.85 threshold. All 4 rejected fakematches in each run came from the Checker's deterministic rules, on the same two functions (`fn_08004E4C` and `fn_08004E68`). The bug described above hit the Snap-on run harder. In plain terms, this experiment does not show that SubQ Snap improves the match rate or the cost on easy functions, and the comparison is biased against Snap by a bug that is now fixed.

**False claims.** No run caught a false claim. In this crew code, a Digger could only claim after the referee had already said MATCH, so a false claim was nearly impossible by construction. Commit `0f5a981` lets Diggers stake a claim before they see the verdict, and later runs will measure real overconfidence.

**What would make these comparisons conclusive.** Rerun r02, r03 and r04 on current main (with `7ac47a2`, `0f5a981` and `c10b4b0`), on a list that includes harder functions (for example 60 to 200 bytes), and repeat each arm at least twice. Each run of 40 functions costs about $2.20 to $2.50 of Muse. That was not possible inside this experiment's $8 Muse cap: the three held-out runs here cost $6.90 together.

## Reproduce

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
