# FRANKENSTEIN — Hackathon Playbook

> **Read `DECISIONS.md` → "Corrections" first. Where it disagrees with this file, DECISIONS.md wins (clock, compiler, rebuild, variant, finale, judging).**


AI Engineer Code Summit Hackathon · Shack15, San Francisco · Saturday Nov 7, 2026

> At 10:00 one person runs `LANE_0_BOOTSTRAP.md` in Claude Code: it creates, commits, and pushes the monorepo foundation in ~15 minutes.
> Then everyone clones, reads this file and `contracts/CONTRACTS.md`, and pastes their own lane file (`LANE_A` … `LANE_D`) into Claude Code as the first message.

---

## 1. The one-sentence version

A crew of coding agents rebuilds a video game's lost source code from the only thing that survives (the compiled game), one piece at a time, and nothing gets stitched in unless a compiler proves it is byte-for-byte identical. They get faster with every run, and once the code is back, the game can be fixed again.

## 2. Why this wins (map to the brief)

The organizers wrote three sentences. We answer each one literally, on screen.

| Brief says | What the judges see | Proof on screen |
|---|---|---|
| "reconstruct software from imperfect evidence" | Only the compiled ROM exists. Agents write C that recompiles to identical bytes. | Hi-score scene: recovered functions enter the table, the cartridge meter fills, "% recovered" climbs |
| "verify what other agents ship before it merges" | Diggers write, an independent Checker re-runs the compiler referee, rejects false "I matched it" claims and fakematches | Versus scene: Digger vs Referee, the expected vs produced instruction, "K.O. Claim rejected"; lies counter |
| "systems that get measurably better with every run" | Idiom library learned from successful matches; ablation on held-out functions | Time trial scene: each run is a lap, lap times falling; library off is the ghost car on held-out functions; cost per piece |

The brief also says agents must "understand, finish, and judge real software." Ours understand (decompile), finish (fix a real bug after recovery), and judge (the Checker).

**The Fetch.ai track is our brief, word for word.** Their challenge ("Agents That Prove Their Work", $2,500 for 1st and $2,500 for 2nd) asks for agents that "reconstruct the past… from binaries" with "behavioral evidence that clearly separates what was observed from what was inferred", agents that "get better… on held-out tasks", and agents that "verify before they trust." Frankenstein is all three. Their mandatory requirements are non-negotiable for us (section 14), so the ASI:One agent is core, not a stretch.

**Observed vs inferred, everywhere.** Byte matches are *observed* (the compiler proves them). Function names, struct names, and "this is the jump routine" are *inferred*. Every screen, card, and recovered file labels which is which. This is what judges from both Fetch.ai and DeepMind will look for.

Precedent: the last winner at this venue (AI Engineer World's Fair hackathon, June 2026, same organizer) was SplatForge — a visual, self-improving loop with a live success curve climbing on screen. We match that formula and add a story everyone already knows.

## 2b. The judge's-eye checklist (optimize every minute for this)

Judges see 30+ demos in an evening, many of them are not game developers, and each partner judges its own prize. What each of them needs to see, and where we show it:

| Judge | Their question | Where we answer it, in under 10 seconds |
|---|---|---|
| Anyone (non-gamedev) | "Why should I care?" | Opening line + Doom on screen crawling with static. Famous game, visible stakes |
| Anyone | "Is that real?" | Live segment: 2–3 functions matched on stage with a timer; everything else labeled REPLAY with its speed |
| Google DeepMind (evaluates agents) | "Is it measured, or vibes?" | Time trial: held-out functions, library on vs off, same budget; false claims caught; cost per piece |
| Google DeepMind | "Did the model just remember Doom?" | Memory test plate: model wrote 20 Doom functions from memory, matched N (near zero) |
| Meta (best use of Meta Model API, $5k) | "Is Muse Spark load-bearing?" | Powered-by line: calls, tool calls, images read, cost; every agent role runs on it; say it once out loud |
| Fetch.ai ($2.5k + $2.5k) | "Does the whole workflow run in ASI:One, with evidence?" | 10-second ASI:One clip in the talk and the video: verify a fix, card shows proved vs guessed; registered via the ASI:One submission agent |
| Everyone | "What's the takeaway?" | One line: "AI writes fast. Frankenstein writes provably right." |

Rules that follow from this:
- **Show before you tell.** The projector shows the glitching game while the pitch is spoken; no slide is ever just text for more than 5 seconds.
- **One number per scene, read out loud.** % recovered, lies caught, held-out improvement, memory test, cost.
- **Never say a number the files don't contain.** If a result is weak, say it plainly; honesty reads as rigor to evaluators.
- **Rehearse the 3-minute run three times on the real projector.** Cut anything that doesn't land in the first rehearsal.

## 3. The pitch

**Opening (about 45 seconds, before the demo):**

> Somewhere in a drawer there's a cartridge with your childhood on it. You probably can't buy that game anymore: 87% of classic video games released in the United States are critically endangered. And for most of them, the code is gone. What's left is the game itself, in machine language a computer can run and no person can read. You can still play it in an emulator. You can never fix it, or change it, again. So we built Frankenstein: a team of coding agents that rebuilds a game's lost code from the game itself, one piece at a time. AI is already flooding this space with junk: the main decompilation tracker just shut down its leaderboard over it. Victor Frankenstein never checked his work. Ours checks everything. One agent writes each piece, another tests it, and it only goes in if it rebuilds the original down to the last byte. And every game they bring back makes the next one faster. To prove it's exact, we needed a famous game we could check our answers against. So we took DOOM, hid its code from our agents, scrambled it so they couldn't just remember it, and gave them nothing but the game. Let's bring it back.

**Closing (about 15 seconds, at the end of the demo):**

> That's DOOM. [N]% of its code rebuilt from its own machine language, and the whole game proven identical. And because its code is back, it can change again. This bug shipped in the original. We changed one function. It's gone. Pull out your phone. It's alive.

Rules: [N] comes from the referee. Say the bug line only if Lane D verified the bug; otherwise "it can change again. Watch." and show an honest modification. Say once, early in the demo: "We asked the model to write Doom from memory. It matched [m]%." ([m] from Lane A's memory probe.)

## 4. Golden path (the only thing that must work)

| # | What the room sees | Owner |
|---|---|---|
| 1 | Projector: the target game running in mGBA, its sprites crawling with static and glitch | D |
| 2 | Title scene ("Press start"), then Hi-score: empty table, empty cartridge meter, 0% recovered | C (data from A) |
| 3 | Split scene: Doom being played live on the left; on the right, Diggers' code streams in, verdicts land, recovered functions slide into the Hi-score rows, and a beam flies from each one to the part of the game it controls, which heals | B → C, D |
| 3b | Every few functions the live game is hot-swapped onto the rebuilt ROM without stopping play; the badge climbs: "NOW RUNNING ON NN% AGENT-WRITTEN CODE" | A → D |
| 4 | A Digger claims "matched"; the Checker re-runs the referee; first wrong byte circled; REJECTED stamp | B + A → C |
| 5 | As each subsystem is recovered, its part of the screen heals from static to clean color; Doomguy's face snapping back is the hero shot | D (heal from B events) |
| 6 | Time trial: run-over-run lap times, library on vs ghost car (off) on held-out functions, cost per piece on Muse Spark | B → C |
| 7 | Full ROM rebuilt from recovered C (+ remaining original asm) has the identical SHA-1 | A |
| 8 | The fix: a known bug patched in recovered source; referee proves only that function changed | D + A |
| 9 | QR code: the room plays the patched game on their phones | D |
| 10 | ASI:One: anyone types "verify my fix for fn_08000A1C" or "how much of DOOM is recovered?" and our agents answer inside the chat with an evidence card (observed vs inferred, the referee's verdict, the SHA-1) | A |

Rule: if a step can't be made reliable, show it as a recording and say so on stage. Never fake a match, a curve, or a number.

## 5. Lanes (four people, zero blocking)

Every lane builds against the shared contracts and the mock fixtures in `contracts/fixtures/` from minute one. Nobody waits on anybody. Real integration happens at the checkpoints in section 7.

| Lane | Name | Owns | Best fit |
|---|---|---|---|
| A | The Lab (Referee) | Toolchain, target ROM, function split, answer key, referee, fakematch lint, full rebuild, patch verifier, ASI:One agents on Agentverse (Fetch.ai prize, required) | Systems / C / build person |
| B | The Crew (Agents) | Diggers, Checker, Archivist, Distiller, Cartographer (SubQ), scheduler, idiom library (MongoDB), experiments + metrics | AI / agents person |
| C | The Stage (UI) | Five game scenes (Title, Hi-score, Versus, Time trial, Ending), narrator ticker + announcer voice, sounds, replay + director mode, event server | Frontend / design person |
| D | The Creature (Game) | mGBA + Lua sprite tap, heal overlay, OBS scenes, the bug fix, phone play page + QR, demo video capture | Game / emulator / video person |

Directory ownership: A writes only `lab/`, B only `crew/`, C only `stage/`, D only `creature/`. All lanes may append to `runs/` in the formats the contracts define. `contracts/` changes need a one-line note in `DECISIONS.md` and a ping to the team.

## 6. Tonight (before hacking starts)

Accounts and reading only. Check the event rules on what may exist before the start; assume no project code.

- Meta Model API key (dev.meta.ai). Confirm the standard tier (`muse-spark-1.3`), not the contributor tier, which may train on prompts.
- MongoDB Atlas free cluster + connection string.
- SubQ key (console.subq.ai). It may be waitlisted; ask the Subquadratic table first thing at the venue.
- Agentverse account + API key (Fetch.ai). **Required for the Fetch.ai prize.** Lane A watches the 5-minute setup doc and the pre-hack workshop recording tonight and registers a hello-world agent reachable from ASI:One, so the plumbing is proven before 10:00 (no project code).
- Install on every laptop: Python 3.11+, Node 22, git, Homebrew packages `arm-none-eabi-gcc` (or the Arm GNU toolchain), `mgba` (0.10+ with scripting), OBS Studio, cloudflared.
- Lane A: read the agbcc README (pret), the m2c README (ARM / `gba` target), objdiff docs.
- Lane D: confirm mGBA's Tools → Scripting window opens and runs a hello-world Lua script.
- Everyone: read this file and the contracts.

## 7. Timeline and gates (assumes hacking starts ~10:00)

**Confirm the submission deadline at kickoff.** The listing says "submissions due Nov 7, 2026 UTC," which could mean 4:00 PM Pacific. Feature freeze is 90 minutes before the deadline, whatever it is. Times below assume a ~5:30 PM deadline; if it is 4:00 PM, shift every gate 90 minutes earlier and cut per section 8.

| Time | Gate | If it fails |
|---|---|---|
| 10:15 | Lane 0: foundation pushed and tagged `v0-foundation`; everyone cloned | Anyone else runs `LANE_0_BOOTSTRAP.md`; never let this slip past 10:30 |
| 10:45 | A: target ROM builds twice with identical SHA-1; manifest written | Switch target per Lane A fallback order; never debug a toolchain past 11:15 |
| 11:30 | A: referee returns MATCH for the original source of 5 functions (self-test) and PARTIAL for a 1-line change | B, C, D keep running on mocks; A pairs with B for 20 min |
| 12:15 | B: first real match by a Digger, verified by the Checker through the real referee | Lower difficulty (smallest functions first); raise reasoning effort; check prompt has the context header |
| 13:30 | C: Stage tails a real run's `events.jsonl` live | Keep replay mode as the demo source |
| 13:30 | A: ASI:One conversation completes "verify this C for fn_…" end to end with an evidence card | Lane D pauses phone work and pairs with A until it does; this gate protects $2,500–$5,000 |
| 14:00 | D: heal overlay reacts to real `fn.matched` events | Fall back to whole-screen heal by % instead of per-sprite |
| 14:30 | B: two runs done; ablation (library ON vs OFF) on held-out set has numbers | Report one run's within-run curve; say "one run" on stage |
| 15:15 | A + D: patched ROM verified (only the fixed function differs) and loads on a phone | Show the fix in mGBA on the projector only |
| Freeze (deadline − 90 min) | Three clean golden-path runs in a row; demo video recorded and exported | Cut per section 8, never past the referee rejection |
| Freeze → deadline | Submit early. README screenshots. Rehearse 3x with the real projector. | |

## 8. Cut list (in this order, only if behind)

1. Transfer to a second game.
2. Fetch.ai Payment Protocol (bonus only; the ASI:One agent itself is never cut).
3. SubQ Cartographer pass (keep a single sentence about it only if it ran).
4. Phone play (show the patched game on the projector instead).
5. Per-sprite healing (fall back to a whole-screen static that clears with % recovered).
6. Live voice (keep captions).

Never cut: the referee rejecting a false claim live, an honest curve, and the ROM rebuilding with an identical SHA-1.

## 9. Risk register

| Risk | Likelihood | What we do |
|---|---|---|
| agbcc won't build the chosen game (C99-isms) | Medium | Patch trivial C99 constructs; else pinned `arm-none-eabi-gcc` with fixed flags (matching still valid with any deterministic compiler); write it in DECISIONS.md |
| Muse Spark is weak at Thumb asm | Medium | Test at 10:15 on 5 functions; give m2c/Ghidra draft as a starting point; raise `reasoning_effort`; small functions first |
| Matching is slow live | High | Precompute runs; on stage, run 2–3 small functions live with a visible timer |
| No natural false claims during the live run | Medium | The claims board shows real ones from earlier runs; never stage a fake one; partial-match rejections are real and frequent |
| Venue Wi-Fi | High | Phone hotspot; pre-cache the model calls needed for the live segment; replay mode for Stage |
| Phones can't load the WASM emulator | Medium | Test on iOS Safari + Android Chrome by 15:00; COOP/COEP headers; fallback: projector only |
| A judge says "you compiled it yourself, it's staged" | Certain | Hidden answer key explanation (section 3); show agents' sandbox can't read `lab/secrets/`; offer decomp.me functions as a second proof if time allows |
| A judge says "the model just remembered the public source" | Likely | Lab's contamination guard: private variant of the game plus the memory-probe match rate, quoted on stage |
| A judge says "emulators already save games" | Certain | "Emulators keep games playable. Only source lets you fix them. Watch." → the patch |
| Fakematch slips through | Low | Lint + Checker review + human spot-check of the 5 functions we show on screen |
| API cost runaway | Low | `RUN_BUDGET_USD` hard cap in the scheduler; cost shown on the Time trial scene |

## 10. Acceptance tests (run at the 14:30 gate and at freeze)

- T1 Reproducible target: two clean builds produce the same ROM SHA-1.
- T2 Referee self-test: original source of 10 random functions → MATCH; one edited line → PARTIAL with the correct first differing offset.
- T3 Lint: `asm(`, `__asm__`, `.byte`/`.word` data in code, and `#pragma` are rejected with a named rule.
- T4 Crew isolation: a test run proves the crew process cannot open anything under `lab/secrets/`.
- T5 End to end: a fresh run produces `fn.matched` events that the Stage shows within 1 second and the overlay heals within 2 seconds.
- T6 Claims: every `claim.made` has a following `verdict` from the Checker; false claims are counted correctly.
- T7 Rebuild: ROM rebuilt from all recovered C + remaining original asm has the original SHA-1.
- T8 Patch: patched build differs from the original only inside the fixed function (referee report lists exactly one function).
- T9 Metrics: `runs/*/metrics.json` validates against the schema; Time trial numbers equal the file.
- T10 Replay: Stage replays a finished run at 1x–20x with no live API calls.
- T11 Phones: 5 phones load and play the patched ROM over the hotspot.

## 11. Run of show (3:00 on stage)

| Time | Beat | Who drives |
|---|---|---|
| 0:00 | Lights low. Projector: glitching game. Speaker delivers pitch lines 1–6 | Pitch lead |
| 0:30 | "So we built Frankenstein." Title scene, "Press start", cut to the Split scene: a teammate plays Doom on the left, the rebuild runs on the right. Hit GO: Diggers start live on 2–3 small functions; the rest of the run is a real earlier run in replay at 8x (say so) | Lane C person |
| 0:55 | A Digger claims a match → Versus scene → the lying instruction, "K.O. Claim rejected." Announcer calls it | Lane C |
| 1:20 | Hand the controller to a judge. "You're playing on code our agents wrote, swapped in while you play." Doomguy's face heals as its code lands | Lane D |
| 1:45 | Time trial: lap times, ghost car, cost per piece. One sentence each, numbers read aloud | Lane B person |
| 2:10 | "When the last piece goes in…" Ending scene: FILE 1 100%, checksums identical, "It's alive." (flash) | Pitch lead |
| 2:25 | The bug: show it happening in the original, then the fixed build. "Only one function changed." | Lane D |
| 2:45 | "Player 2, press start" with the QR. "Pull out your phone." Room plays. Stop talking. | Pitch lead |

## 12. Demo video (record at freeze; 60 seconds, the submission form's length; captions burned in; end on the "Built today / Not ours" card)

Optimize for a judge watching muted on a laptop, and for the first three seconds of a social post.

| Time | Shot |
|---|---|
| 0:00–0:03 | Full-frame: glitching sprite snaps into clean color with a lightning flash. Caption: "This game's code was lost. Watch it come back." |
| 0:03–0:10 | Title scene: FRANKENSTEIN logo, save-file menu, "PRESS START" blinks, press it. Caption: "Coding agents that rebuild lost games, and prove it byte for byte." |
| 0:10–0:25 | Split scene timelapse: Doom played on the left, code streaming on the right, beams healing the game, badge climbing (real run at 16x, labeled) |
| 0:25–0:40 | Versus: a false claim, the exact instruction, K.O. Caption: "Agents lie. The referee doesn't." |
| 0:40–0:55 | Close-up: a judge's hands on the controller while the badge ticks up; Doomguy's face snaps back |
| 0:55–1:00 | Time trial: lap times + ghost car + cost. Captions say the exact numbers |
| 1:00–1:10 | Ending: checksums identical. "It's alive." Patch 1.01, then the bug fix before/after |
| 1:10–1:20 | ASI:One chat: "Verify my fix." The agent replies with a card: observed (bytes match), inferred (name), verdict. Caption: "Any agent can ask before it merges." |
| 1:20–1:30 | Phones in hands playing it. End card: repo link, team names, "Built with Muse Spark, MongoDB, SubQ, Fetch.ai" (only the ones we really used) |

## 13. Judge Q&A (one breath each)

- **"Isn't this just staged?"** The real source is hidden from the agents and used only as an answer key. That's the only way to prove it's exact. The crew can't read that folder; we tested it.
- **"Emulators already preserve games."** They keep games playable. Only source lets you fix, port, or change them. We just fixed one.
- **"Can't the agents fake it?"** They try. That's the Checker's job. Here are the false claims it caught.
- **"Why Doom, if its code is public?"** Because we needed a famous game we could check our answers against. The agents never saw the code, and we scrambled it first. The method is for games whose code really is gone.
- **"Didn't the model just remember the public source?"** We built a private variant (renamed, restructured), and we tested exactly that: asked the model to write the functions from memory. It matched [n]%.
- **"Is the improvement real?"** Held-out functions, library on vs off, same model, same budget. Those are the numbers.
- **"Why Muse Spark?"** It does all the code reasoning, tool calls, and screenshot reading at $1.25 / $4.25 per million tokens; cost per recovered function is on the slide.
- **"What's observed and what's inferred?"** Observed: every accepted function recompiles to identical bytes, and the whole ROM has the same SHA-1. Inferred: names, types, and what each function does. We label both, everywhere.
- **"What about commercial games?"** Same method, but you need the rights. Preservation groups and rights holders are the users.
- **"How far from 100% on a real game?"** We say exactly what % we hit and what kind of functions are left.

## 14. Special-prize map

Only the Meta prize ($5,000 for best use of the Meta Model API) is publicly detailed. At kickoff, ask each partner table what their prize is and write it in `DECISIONS.md`. Claim a partner only if the demo breaks without it.

| Partner | Load-bearing use | Lane |
|---|---|---|
| Meta (Muse Spark 1.3 via Meta Model API) — **$5,000** | Every Digger, the Archivist, function naming from screenshots, the fix; tool-calling loop with the referee as a tool; cost per piece on the Time trial scene | B, D |
| MongoDB Atlas | Idiom library with vector search; attempts + runs as the system of record; change stream optionally feeds the Stage | B (C optional) |
| Subquadratic (SubQ) | Cartographer: whole-program pass over the full disassembly + recovered C to propose shared structs and signatures; measured by ablation | B |
| Fetch.ai (Agentverse + ASI:One) — **$2,500 1st, $2,500 2nd** | Three uAgents on Agentverse with the Agent Chat Protocol: the Referee (verify any C against the ROM), the Excavator (recover a function using the crew, streaming progress), the Curator (status, proof, rebuilt SHA-1). Full primary workflow inside an ASI:One conversation, ASI1 Interactive Cards for verdict and progress, observed vs inferred in every answer. Bonus: multi-agent collaboration (Excavator asks Referee before accepting), reliability (retries, clear failures), optional Payment Protocol (pay per verified recovery, Stripe test mode). | A (D backs up) |
| Google DeepMind (Gemini) | Optional: independent second-model Checker review, only if a Google prize exists; never replaces Muse in the Diggers | B |

### Submission checklist (Fetch.ai requirements are mandatory to be eligible)

- Submit on the Cerebral Valley dashboard.
- **Also register the submission through the AIE Summit ASI:One Submission Agent** (watch their submission walkthrough first).
- Public GitHub repo with run and test instructions, including how to talk to our agents in ASI:One (agent names and addresses).
- At least one agent registered on Agentverse, implementing the Agent Chat Protocol, discoverable and directly usable in ASI:One, with the full primary workflow completed in the conversation.
- Demo video link in both submissions.

## 15. Team working rules (every Claude Code session)

- Commits are made by the person running the session with their own git identity. No AI co-author lines or trailers.
- Read current docs before using any external tool or API; prefer official docs and llms.txt files; note anything that contradicts this playbook in `DECISIONS.md` and follow the docs.
- Never read or print anything under `lab/secrets/` outside Lane A's referee code.
- Never fake a number, a match, or a demo step. Replay is fine if labeled.
- Work without stopping to ask. Pick the reasonable option, note it in `DECISIONS.md`, keep going. Stop only for credentials, spending beyond `RUN_BUDGET_USD`, or destructive actions.
- If an approach fails twice, change approach.
- Post a short update to the team channel after each gate: what works, what's next, what's risky.
- Verify UI changes visually (screenshots), not only with tests.

## 16. Verified facts and sources (checked Nov 6, 2026)

- 87% of classic US games critically endangered (VGHF + Software Preservation Network, 2023): https://gamehistory.org/87percent/
- AI matching decompilation of a 2001 GBA game, 51% matched with Claude Code; earlier 74% of a 60-function benchmark; agents often wrongly claim matches: https://gambiconf.substack.com/p/starting-a-decompilation-project · https://gambiconf.substack.com/p/can-llms-really-do-matching-decompilation
- m2c supports MIPS, ARM and PowerPC, with a `gba` target: https://github.com/matt-kempster/m2c (one toolkit README claims no ARM backend; trust the m2c README, fall back to Ghidra headless if output is poor)
- objdiff supports ARM (GBA): https://github.com/encounter/objdiff
- agbcc (GCC 2.95-based) is the standard matching compiler for GBA decomps: e.g. https://github.com/Dream-Atelier/kl-eod-decomp
- Scaffold pattern (one .s per function, rebuild to byte-identical ROM, tested on an MIT homebrew): https://github.com/masterred92/gba-decomp-toolkit
- Target: GBADoom, prBoom ported to GBA, primarily C, GPLv2+, supports the Doom shareware IWAD: https://github.com/doomhack/GBADoom. Fallbacks: Attack on Voxelburg (https://github.com/MutantStargoat/voxelburg), Celeste Classic GBA.
- Opening hook: the game-decompilation tracker decomp.dev shut its public leaderboard, saying AI turned progress into "a hollow numbers game": https://www.tomshardware.com/video-games/retro-gaming/game-decompilation-tracker-decomp-dev-shuts-its-public-leaderboard-saying-ai-has-broken-the-community-its-creator-blames-forks-that-use-ai-to-finish-other-teams-projects-and-races-to-ship-rough-pc-ports
- mGBA scripting (memory read/write, per-frame callbacks, sockets): https://mgba.io/docs/scripting.html
- Browser mGBA (WASM core, mobile controls): https://github.com/thenick775/gbajs3
- Meta Model API: base `https://api.meta.ai/v1`, model `muse-spark-1.3`, OpenAI / Responses / Anthropic-Messages compatible, `reasoning_effort` minimal…xhigh (max announced), $1.25 / $4.25 per 1M, standard tier 3,000 RPM; contributor tier trains on data: https://docs.litellm.ai/blog/muse_spark_1_3 · https://www.promptfoo.dev/docs/providers/meta/
- SubQ API: base `https://api.subq.ai/v1`, model `subq-preview`, OpenAI-compatible; production tier up to 1M tokens: https://docs.subq.ai/
- Fetch.ai uAgents + Agentverse registration (Chat Protocol, mailbox mode): https://docs.agentverse.ai/llms.txt
- Fetch.ai challenge brief for this event (requirements, prizes, resources): basic ASI:One agent https://uagents.fetch.ai/docs/examples/asi-1 · multi-agent quickstarter https://github.com/fetchai/innovation-lab-examples/tree/main/fetch-hackathon-quickstarter · Payment Protocol example https://innovationlab.fetch.ai/resources/docs/examples/agent-transaction/stripe-horoscope-payment-protocol
- Precedent: SplatForge, 1st place, AI Engineer World's Fair Hackathon 2026: https://cerebralvalley.ai/e/aiewf-hackathon-2026/hackathon/gallery/18
