# Messaging

One voice everywhere: GitHub About, README, site, crew docs, slides, video captions, the pitch.
Short sentences. Games first. Zingers over paragraphs. Numbers only from run files.

## The line

**Lost games, rebuilt and proven.**

## GitHub About (use exactly)

> Lost games, rebuilt and proven. AI agents bring a game's dead source code back from the cartridge, and a compiler checks every byte. Doom is our first patient.

## Hero (site and README)

**Lost games, rebuilt and proven.**

87% of classic games are endangered, and most of their source code is gone.
Frankenstein's agents rebuild it from the cartridge, one piece at a time.
A compiler checks every byte.

## Zingers (pick, don't stack more than two in a row)

- Victor Frankenstein never checked his work. Ours checks everything.
- Emulators keep games playable. Source code keeps them alive.
- Agents lie. The referee doesn't.
- Muse writes it. Snap judges it. The compiler proves it. MongoDB remembers it. ASI:One lets anyone ask for it.
- Every game we bring back makes the next one faster.
- Play it, and we rebuild it.
- It's alive.
- Games don't have to die.

## How it works (three beats)

1. **Dig.** Agents read the compiled game and write C, one function at a time.
2. **Check.** A compiler rebuilds every piece. Byte-identical or it's out. Lies get caught.
3. **Learn.** Every match teaches the crew a habit, so the next game goes faster.

## The proof

Doom is our first patient: famous, hidden from the agents, scrambled so they can't recite it, and checkable byte for byte.

## Sponsors are the organs, not the logos

| Partner | Role | One line |
|---|---|---|
| Meta Model API (Muse Spark, Muse Wonder) | The hands | Writes every line of recovered C. |
| Subquadratic (SubQ Snap) | The judgment | Reads the whole game at once and decides where every attempt goes. |
| Fetch.ai (ASI:One) | The front door | Ask for a recovery in a chat. Get proof back. |
| MongoDB Atlas | The memory | Remembers every trick, so the next game is faster. |
| Google Gemini | The second opinion | A different lab double-checks every match. |

## What we answer (judges score this; every public page must make it obvious)

Round one weights: Technical Demo 35%, Implementation Difficulty 30%, Impact 20%, Creativity 15%.

### The three problem statements

| Problem statement | Our answer in one line | The moment that proves it | The number |
|---|---|---|---|
| **Software Archaeology**: reconstruct software from imperfect evidence | Only the compiled game survives. Agents rebuild its C, and a compiler proves each piece byte for byte. | A recovered function goes green and its part of the game heals. | Functions matched of total, from `metrics.json`. |
| **Trust but Verify**: verify what other agents ship before it merges | Agents lie. An independent Checker re-runs the referee on every claim, and two labs (SubQ Snap and Gemini) screen every match for fakes. | "Matched it. Pretty sure." gets stamped REJECTED, with the first wrong instruction shown. | False claims caught, fakes rejected. |
| **The System That Gets Better**: measurably better with every run | Every match teaches the crew a generic habit. Habits are kept only if they help on functions the crew has never seen. | Time trial: held-out run with the library on beats the ghost car with it off. | Held-out match rate and attempts per match, on vs off. |

Observed vs inferred everywhere: byte matches are observed (the compiler proves them); names, types and "this is the face code" are inferred and shown in violet with a "?".

### Sponsor tracks

| Track | What it asks | How Frankenstein is built on it | Proof artifact |
|---|---|---|---|
| **Best Use of Meta Model API** ($5,000) | Load-bearing use of Muse | Muse Spark writes every line of recovered C in a tool-calling loop with the referee as a tool; Muse Wonder takes the hard cases; Muse distills the habits and names the functions. | `muse.by_model` in every `metrics.json`: calls, cost, matches per model. |
| **Best Use of Subquadratic** ($5,000 / $1,000) | Load-bearing use of SubQ | Snap reads the whole game at once (384K context) and runs the crew's judgment: triage order and budgets, keep / escalate / abandon after every miss, the fake gate on every match, Play-to-recover (watches live frames, picks what to rebuild next), behaviour checks across frames, and routing plain-words requests. | `snap.decision` events in the stream; Snap on vs off held-out runs. |
| **Agents That Prove Their Work** (Fetch.ai, $2,500 x 2) | Agentverse agent with Chat Protocol, usable in ASI:One, full workflow in chat, evidence separating observed from inferred, verify before trust, better on held-out tasks | Ask in ASI:One: "recover the face". The agent routes it, runs the crew, re-verifies with the referee before answering, and replies with a card: observed (bytes match, SHA-1) vs inferred (name). | ASI:One transcript; agent address in the README. |
| **MongoDB** (credits) | Atlas as a real component | The idiom library and the run record live in Atlas. | Library size per run. |
| **Google Gemini** (credits) | Gemini used meaningfully | A second lab reviews every match in parallel with Snap. | `second_opinion_reviews` in `metrics.json`. |

### The questions judges will ask (answer in one breath)

- "Isn't it staged?" The real source is hidden from the agents and used only as the answer key. That's the only way to prove it's exact.
- "Didn't the model just remember Doom?" We asked it to write Doom from memory. It matched [m] of 20 against the original and [v] against our scrambled build. (Numbers from `lab/out/memory_probe.json`.)
- "Emulators already save games." Emulators keep games playable. Source code keeps them alive. We just changed one.
- "Is the improvement real?" Same model, same budget, functions it has never seen. Library on vs off. Those are the numbers.

## Evidence rule

Bright means proved by the compiler. Violet with a "?" means our guess.

## Bigger picture (one sentence, at the end only)

Anywhere the only thing left is the compiled program, Frankenstein can bring the source back.

## Don't

- Don't lead with "software". Lead with games.
- Don't call it a dashboard.
- Don't write a number that isn't in `runs/*/metrics.json` or `DECISIONS.md`. Bench numbers say "bench".
- Don't overclaim: "games you're allowed to rebuild", never "any game".
- No paragraph over three sentences on any public page.
