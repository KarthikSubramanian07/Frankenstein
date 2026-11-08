# Submission form: paste-ready, field by field

For the Cerebral Valley submission page (due 17:00). Every number names its source. Two numbers are placeholders:
The function count and byte share come from Lane B's 16:00 freeze (`python3 tools/counts.py`, repo-only) and from Lane A's rebuild
check logged in `DECISIONS.md`. Replace both everywhere before you paste.

<!-- numbers written by `python3 -m lab.freeze_numbers` from counts.py and a fresh rebuild -->

## Project name

Frankenstein

## Tagline

Lost games, rebuilt and proven: AI agents write a game's lost source code back from the cartridge, and a compiler checks every byte.

## Summary (the first 150 words stand alone)

Most classic games survive only as a cartridge. The source code, the recipe the game was built from, is gone, and 87% of classic games are endangered (VGHF and SPN, 2023). Rebuilding source from a cartridge is like being handed a cake and asked for the exact recipe.

Frankenstein's agents read Doom's machine code for the Game Boy Advance and write the C back, one function at a time. A recovered function only counts if a compiler turns it into the original's exact bytes. A Checker re-runs every claim, because agents lie: today it caught 39 false "it matches" claims and rejected 32 fakes, and let none through.

235 of Doom's 568 functions are back so far. With all of them spliced in, the rebuilt game has the same SHA-1 checksum as the original. We changed one line of the recovered god-mode code, and the cheat now gives 200% health.

## Problem statements

**Software Archaeology.** The evidence is a compiled ROM and nothing else. The agents see anonymous function ids and machine code; GBADoom's real source is locked away as the answer key, and our build is a private variant with 11 small edits, so recital doesn't pass (from memory alone, Muse compiled 0 of 20 functions; `lab/out/memory_probe.json`). Every reply separates what was observed, meaning what the compiler proved (MATCH, the first differing instruction, SHA-1s), from what was inferred (function names, shown with a "?"). For behavioral equivalence across platforms, six recovered functions compiled for a Mac and for WebAssembly give the same answers as the original GBA machine code: 20,000 of 20,000 recorded outputs in the browser, and 1,000,000 inputs each on the Mac (`lab/demo/equivalence/`).

**Trust but Verify.** The referee is independent of the agents that write the code. It compiles each candidate in a sealed container with no network and no keys, and compares it instruction by instruction with the original. Agents stake a claim before they see the verdict; the Checker re-runs the referee on every claim and throws out byte matches that trick the compiler, such as a stray `volatile`. Across 36 finished runs: 39 false claims caught, 32 fakes rejected, 0 fakes accepted (`python3 tools/counts.py`, reading `crew/exports` in the repo). The linter was red-teamed against 13 bypass classes, and all 13 are blocked (`lab/LINT.md`).

**The System That Gets Better.** After each match the crew keeps a general habit, never the code. A habit is adopted after 3 good uses and retired after 4 bad ones, and the library is frozen while it's tested on 170 held-out functions it never trained on. The honest result: no measured gain yet. On 40 easy held-out functions, library on and off both matched 29; on 20 harder ones, both matched 6 (`crew/EXPERIMENTS.md`). Within a run, warm starts and salvage did turn near-misses into matches. We report the held-out result as it is.

## Best Use of Meta Model API

Muse writes every line of recovered C. Six Muse Spark 1.3 Diggers work in a tool-calling loop with the referee as their tool: write, compile, read the aligned diff, try again. When SubQ Snap says a function is stuck, Muse Wonder 1.0 takes over. Muse also writes the crew's habits and guesses the function names, which we always show as guesses. The first Doom run recovered 28 of 30 functions with 103 Spark calls and 11 Wonder calls, for $0.73 (`crew/exports/doom_r01/metrics.json`). Without Muse, nothing writes the C and the referee has nothing to judge.

## Best Use of Subquadratic

SubQ Snap 1.1 is the crew's judgment. It reads the whole program at once to rank how hard each function is, then decides after every failed attempt whether to keep going on Spark, escalate to Muse Wonder, or abandon. It screens every byte match for fakes and recited source before the Checker accepts it, and it routes plain-words requests ("bring back the shotgun guy's attack") to function ids. Every decision is a `snap.decision` event on screen. In held-out round 2, Snap on matched 6 of 20 against 4 with Snap off, at $0.54 against $0.82 per match. That's 2 functions, so we call it a weak hint, not a result (`crew/EXPERIMENTS.md`).

## Best Use of Fetch.ai

The whole workflow runs in an ASI:One chat, through two agents that speak the Agent Chat Protocol over Agentverse mailboxes:

- frankenstein-referee: `agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0`
- frankenstein-excavator: `agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp`

The Excavator digs and never grades itself. Ask it to recover a function and it runs a crew job, then sends the crew's C to the Referee agent in an agent-to-agent message and answers only with the Referee's verdict, quoted. Every reply splits Observed (what the compiler proved) from Inferred (our guesses).

To test it in ASI:One:
1. "@frankenstein-referee How much of DOOM is back?"
2. "@frankenstein-referee Does this C match fn_0801C130?" with a wrong ```c block. You get REJECTED and the first differing instruction.
3. The same message with the correct C. You get MATCH.
4. "@frankenstein-referee Prove the rebuild is exact." You get two identical SHA-1 checksums.
5. "@frankenstein-excavator Recover fn_08004DA8."

The agents run on Eddy's laptop and answer while it's on. Instructions are also in the README ("Talk to our agents in ASI:One").

## Overall

The demo puts the agents' work under the judge's hands. They press Enter and watch Muse turn machine code into C until the referee stamps MATCH. They watch a real lie get caught at the first wrong instruction. Then they play Doom: the god-mode cheat (Up Up Down Down Left Left Right Right) runs a function our agents rebuilt from machine code, and in our changed build the same cheat gives 200% health, because we edited one line of the recovered C. An emulator can only play a game; with source, you can change it.

## Numbers and where they come from

| Claim | Number | Source |
|---|---|---|
| Functions recovered, each proven byte-identical | 235 of 568 | `python3 tools/counts.py` (16:00 freeze) |
| Share of the game's code bytes | 8.39% | same |
| Rebuilt ROM with every recovered function spliced in | SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`, identical to the original | `python3 -m lab.referee rebuild --recovered crew/exports/union/recovered`, verified on two machines (`DECISIONS.md`) |
| False claims caught | 39 | `tools/counts.py`, 36 finished runs |
| Fakes rejected | 32 / 0 | same |
| Memory probe: functions compiled from memory alone | 0 of 20 | `lab/out/memory_probe.json`, `DECISIONS.md` 13:28 |
| Visible change from recovered code | god mode HEALTH 200% vs 100% | `lab/demo/shots/god_200_after.png`, `original_god_after.png` |
| Cross-platform equivalence | 20,000 of 20,000 identical | `lab/demo/equivalence/` |
| Referee check time | 0.1 to 0.2 s | `DECISIONS.md` 11:24 |

## Built today and not ours

Built today, after 10:45: the agent crew and its Checker, the referee and linter, the private variant build, the ROM rebuild and patch tools, the ASI:One agents, the Stage, the phone page, the god-mode patch, the equivalence harness, the site and the film. The commit history starts after 10:45.

Not ours: Doom (id Software), prBoom, GBADoom (doomhack, GPL-2.0-or-later), the Doom shareware WAD, GbaWadUtil, mGBA, devkitARM GCC, Remotion, and the Meta, Subquadratic, Fetch.ai, MongoDB and Google Gemini platforms.

## What's real and what isn't

- Real: every MATCH, the checksums, the costs, the Snap and Gemini calls, the god-mode change, the live dig.
- A display rule we wrote: the static face. Code we haven't recovered yet shows as static. The face function isn't recovered.
- The phone page runs the rebuilt ROM in a browser GBA emulator. It isn't a native port.
- The equivalence page covers six small functions, not the game.
- Function names are inferred and always shown with a "?".

## Links

- Repo: https://github.com/KarthikSubramanian07/Frankenstein
- Site: https://tryfrankenstein.pages.dev
- Video: [paste the one-minute video link]

## Team

Eddy Zhao, Karthik Subramanian, Aiden Huang, Enzo Emami. All four must be added on the submission page.
