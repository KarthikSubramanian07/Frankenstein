# Frankenstein for judges: every track, criterion by criterion

> AI agents rebuild a lost game's source code from the cartridge, and a compiler accepts only byte-identical
> code. This is the Markdown version of https://tryfrankenstein.pages.dev/judges. Every claim ends with the
> file its number came from, in https://github.com/KarthikSubramanian07/Frankenstein.

## TL;DR

- **What it is.** AI agents rebuild a lost game's source code from the cartridge. It's for game preservation
  groups and rights holders, because 87% of classic US games are critically endangered and their code is gone
  (VGHF and SPN, 2023).
- **What's proven.** A piece only counts if it's byte-identical: the compiler turns the agents' C into the
  original's exact bytes. Put back into Doom, the rebuilt game has the same checksum.
- **The numbers.** 235 of Doom's 568 game functions are back, proven byte-identical. That's 8.39% of the code by
  size, because the crew starts with the small ones.
- **Not done yet.** Doomguy's face (1,164 bytes) isn't recovered, and the habit library hasn't beaten noise on
  unseen code.

Legend: **MATCH** is proved by the compiler. A name with **?** is our guess. **REPLAY** is a recorded real run,
played faster. **STATIC FACE** is code not recovered yet.

## Overall (round one)

Judged on Technical Demo 35%, Implementation Difficulty 30%, Impact Potential 20%, Creativity 15% (the
organizers' brief, recorded in `DECISIONS.md`).

- **Technical Demo.** You press Enter, two agents dig live, and the compiler stamps each MATCH in 0.1 to 0.2
  seconds. (`docs/DEMO_SCRIPT.md`)
- **Implementation Difficulty.** Agents must write C that compiles to Doom's exact bytes at -O3, past a referee,
  a fake detector and a full ROM rebuild. (`lab/`)
- **Impact Potential.** 87% of classic US games are critically endangered, and source code is what lets a game
  be fixed and ported again. (VGHF and SPN, 2023)
- **Creativity.** A lab where agents lie and the referee can't be fooled; play the game, and Snap rebuilds
  what's on your screen first.
- **Progress.** 235 of 568 game functions are back (8.39% of the code bytes), every one proved by the compiler.
  The union rebuild at the 16:12 freeze has the same SHA-1 as the original,
  `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`: 235 functions from the agents' own compiled C and 333 from the
  original build, verified on two machines. (`crew/exports/union`, DECISIONS 16:12)

## Software Archaeology

Only the cartridge survived. The C comes back.

- **Evidence, not memory.** Agents see only anonymous ids and the game's machine code as text; the real source
  is locked away as the answer key. (`crew/guard.py`)
- **A scrambled patient.** We made 11 small edits to our Doom build, and from memory alone Muse compiled 0 of 20
  Doom functions. (DECISIONS 13:28)
- **Proved instruction by instruction.** Each candidate compiles in a locked-down container and must match the
  original instruction for instruction. (`lab/README.md`)
- **Spliced back in, same checksum.** The recovered functions go back into the ROM, next to the original code
  for the rest, and its SHA-1 checksum stays identical.
- **Not done yet.** The crew wins on small functions; Doomguy's 1,164-byte face got 2 attempts and a best of
  0.7%. (`crew/STATUS.md`)

Example MATCH: `fn_08013CA4` from `crew/exports/doom_r12`, matched in 2 attempts, checked by Snap and Gemini,
SHA-1 identical with it spliced in. Muse's guess at a name: `reset_global_state?`

## Trust but Verify

Agents lie. The referee doesn't.

- **A claim is only a claim.** Each agent stakes its claim before it sees the verdict, and the Checker re-runs
  the referee on every one.
- **Lies caught.** Across 36 finished runs the Checker caught 39 lies, and the referee refused every one.
  (`tools/counts.py`, DECISIONS 16:11)
- **Fakes thrown out.** A fake is C that matches by tricking the compiler; the Checker rejected 32 and accepted 0.
  (DECISIONS 16:11)
- **Two labs check what bytes can't.** SubQ Snap and Gemini score every match for fakes and recited source, in
  parallel.
- **Hard to talk into anything.** Pasted C compiles with no network and no keys. (`SECURITY.md`)

## The System That Gets Better

Habits earn their place, or get retired.

- **Habits, never answers.** After each match the crew keeps a general lesson, never the code, and drops any
  habit that copies 3 lines of the answer. (`crew/README.md`)
- **Kept only on evidence.** A habit is adopted after 3 good uses and retired after 4 bad ones.
- **Tested on unseen code.** 170 of 568 game functions are held out, and the library is frozen while they're
  tested. (`crew/EXPERIMENTS.md`)
- **Honest result.** Held out, the library hasn't beaten noise: 29 vs 29 of 40 on easy code, 6 vs 6 of 20 on
  hard code, so we don't claim it helped. (DECISIONS 14:06)

| Run | Setup | Matched | Attempts per match | Cost per match |
|---|---|---|---|---|
| doom_r12 (hard) | library on, Snap on | 6 / 20 | 2.00 | $0.536 |
| doom_r13 (hard) | library off, Snap on | 6 / 20 | 2.17 | $0.547 |
| doom_r14 (hard) | library on, Snap off | 4 / 20 | 2.25 | $0.822 |
| doom_r02b (easy) | library on, Snap on | 29 / 40 | 1.41 | $0.076 |
| doom_r03b (easy) | library off, Snap on | 29 / 40 | 1.45 | $0.075 |
| doom_r04b (easy) | library on, Snap off | 30 / 40 | 1.47 | $0.086 |

Same model, same budget, same functions. Bad results ship too.

## Partner tracks

- **Meta Model API: Muse is Frankenstein's hands.** Six Muse Spark agents write C in a loop with the referee as
  their tool. When Snap says escalate, Muse Wonder takes over; the first Doom run used 103 Spark calls and 11
  Wonder calls for $0.73. Wonder has no public price yet, so its cost is estimated at Spark rates.
  (`crew/digger.py`, `crew/exports/doom_r01/metrics.json`)
- **Subquadratic: SubQ Snap is its judgment.** Snap reads every function's machine code in one 384K window and
  sets the work order (1.39M tokens in the first run), decides keep, escalate or abandon after each miss, and
  gates every MATCH on fake and recital odds. Snap on vs off was 6 vs 4 of 20 on hard code: a weak hint, not a
  result. (`crew/checker.py`, DECISIONS 13:58)
- **Fetch.ai: ASI:One is the front door.** Two agents on Agentverse, reachable by mailbox: Frankenstein Referee
  (`agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0`) and frankenstein-excavator
  (`agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp`). The Excavator runs a crew job, then asks
  the Referee and answers only with its verdict, keeping what the compiler proved apart from what is a guess.
  The agents run on one teammate's laptop, so they sleep when it does. (`lab/agents/`, `lab/E2E_RECOVER.md`)
- **MongoDB and Gemini.** Each habit library is its own MongoDB Atlas collection, and every run's events and
  metrics are mirrored there (`crew/library.py`). On every byte match, Gemini checks the C for fakes next to
  Snap, in parallel (`crew/gemini.py`).

Built at the AI Engineer Code Summit hackathon, Shack15, San Francisco, November 7, 2026. MIT licensed. Doom is a
trademark of id Software; not affiliated with or endorsed by id Software, doomhack, Nintendo, or any platform
named here.
