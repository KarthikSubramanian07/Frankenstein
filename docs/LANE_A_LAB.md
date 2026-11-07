# LANE A — The Lab (Referee)

> **Read `DECISIONS.md` → "Corrections" first. Where it disagrees with this file, DECISIONS.md wins (clock, compiler, rebuild, variant, finale, judging).**


Paste everything below the line into Claude Code as your first message, from the repo root.

---

You are the build and verification engineer on FRANKENSTEIN, a hackathon project where coding agents rebuild a Game Boy Advance game's lost C source from its compiled ROM. Run `git pull --rebase` first: the foundation (tag `v0-foundation`, made by `docs/LANE_0_BOOTSTRAP.md`) already has the folders, contracts, schemas, and fixtures. Read `docs/00_START_HERE.md` and `contracts/CONTRACTS.md` in full before writing code. You own `lab/` only.

Your lane is the ground truth. If your referee is wrong, the whole demo is a lie. Correctness beats speed; then speed.

## Your deliverables

1. A reproducible target: a real open-source GBA game, built from source with a pinned compiler and flags, producing a ROM whose SHA-1 is identical across two clean builds.
2. `lab/out/manifest.json`, `lab/out/asm/*.s`, `lab/out/viz_map.json`, per-function context headers, exactly per the contracts.
3. The answer key in `lab/secrets/` (original source), gitignored, readable only by the referee.
4. `python -m lab.referee` with `check`, `context`, `rebuild`, `patch`, `serve`, and `mock serve`, matching the contract JSON exactly.
5. A fakematch linter with named rules.
6. Tests that prove the referee is right.
7. **Required for the Fetch.ai prize ($2,500 1st, $2,500 2nd):** three uAgents on Agentverse, usable entirely inside an ASI:One conversation (Step 7). Start it no later than 12:30, right after the referee is real.

## Step 0 — Toolchain (target: done by 10:30)

- Fetch current docs first: pret's agbcc README, the m2c README (it lists ARM and a `gba` target), objdiff docs (`objdiff-cli --help`), and the GBA scaffold pattern in https://github.com/masterred92/gba-decomp-toolkit (one `.s` per function with raw `.2byte`/`.4byte`, rebuild to identical ROM). Use what you can; do not copy code you don't understand.
- Build agbcc from source into `lab/tools/agbcc/`. Install an Arm GNU toolchain (binutils + `arm-none-eabi-objdump`) and pin its version in `lab/TOOLCHAIN.md`.
- Install `capstone` (Python) for Thumb disassembly and `objdiff-cli` if available.
- Write `lab/doctor.sh` that prints versions and fails loudly on anything missing.

## Step 1 — The target: GBADoom (confirmed by 11:15)

**GBADoom** (https://github.com/doomhack/GBADoom): a port of prBoom to the GBA, primarily C, GPLv2+. Build it with the Doom **shareware** IWAD (freely distributable) via its GbaWadUtil step, exactly as its README says. Credit id Software, the prBoom authors, and doomhack on every screen and in the README.

Never use a commercial ROM.

**Fallbacks** (only if GBADoom won't build by 11:15): Attack on Voxelburg (https://github.com/MutantStargoat/voxelburg), then Celeste Classic GBA (https://github.com/JeffRuLz/Celeste-Classic-GBA).

**Mandatory contamination guard.** Doom's code is among the most copied code in the world; the model has seen it. Judges will ask. Before building the answer key, make a private variant public code cannot match:
- Rename every function, global, struct, and field (agents only ever see `fn_`/`data_` ids).
- Apply mechanical, codegen-changing edits across the game: reorder struct fields, change some constants and table sizes, split or merge helpers, change loop forms, reorder functions within files. Gameplay must look identical.
- Build the target only from this variant; store the diff in `lab/secrets/variant.patch`.
- **Memory probe (shown on stage):** give Muse Spark the original public names of 20 functions (for example `P_MobjThinker`, `R_DrawColumn`), ask it to write them from memory, compile those against our target through the referee. Write the result to `lab/out/memory_probe.json` (contract section 6b) and a line in `DECISIONS.md`. Expected near zero. That number is the answer to "didn't the model just remember Doom?" and it goes on the Time trial scene and the slides. Run the probe by 12:30 so the number exists early.

**Scope for the demo.** Doom is big. Tag subsystems in `viz_map.json` by source file: `hud` (st_*.c, the status bar and Doomguy's face), `weapons` (p_pspr.c and related), `enemies` (p_enemy.c, monster thinkers), `world` (r_*.c renderer, everything else). Tell Lane B to prioritize `hud` then `weapons`; those are the on-stage moments ("Doomguy's face is 100% back").

Compiler: GBADoom builds with devkitARM GCC; use the exact version and flags from its Makefile, pinned and written down (agbcc will not build it). Library code (crt0, newlib, libgcc, soft-float helpers) is `scope: "library"`. The IWAD data is data, not code, and does not count toward %.

## Step 2 — Build, split, manifest (target: 11:00–11:30)

- Build the game into an ELF with symbols and a ROM. Build twice from clean; SHA-1 must match. Test this (T1).
- From the ELF: list every function (name, address, size, Thumb/ARM mode, source file). Anonymize as `fn_<ADDR8HEX>`. Keep the mapping `id → original name, file` only in `lab/secrets/names.json`.
- Disassemble each function into `lab/out/asm/<id>.s` (Thumb, with addresses, labels, literal pools shown as data, relocation targets named by `fn_` ids or `data_<addr>`). This is the only view of the code the crew gets.
- Compute callers/callees from the disassembly. Compute `difficulty` (0–1) from size, branch count, and call count.
- Split ~30% of game functions into `heldout`, stratified by size. Fixed random seed; write it down.
- Write `viz_map.json` grouping functions by their original source file into 3–6 subsystems with friendly labels ("the ship", "the rocks", "the score"). This file is for the screen only.
- Write the context header per function (`lab/out/ctx/<id>.h`): GBA hardware register defines, types, and extern declarations for callees and referenced globals using anonymized names, so a candidate compiles in isolation. Do not leak original names or comments.

## Step 3 — The referee (target: 11:30)

`check(fn, src)`:
1. Run the linter (Step 4). Lint failure returns `LINT_FAIL` without compiling.
2. Compile `ctx header + src` with the exact compiler and flags to an object.
3. Extract the candidate function's bytes. Compare to the target function's bytes from the original build, masking relocated fields (read relocations from both objects; compare symbol targets, not raw addresses).
4. `match_pct` = matching instructions ÷ target instructions × 100. `MATCH` only if all bytes and relocation targets are identical and the size is identical.
5. On mismatch, report `first_diff` and the `diff` list with disassembled instructions on both sides.
6. Never print, log, or return anything from `lab/secrets/`.

If `objdiff-cli` gives you a reliable per-function JSON report, you may use it inside `check`; otherwise implement the comparison with capstone and the object's relocation table. Either way, the JSON contract is fixed.

Performance target: under 3 seconds per check. Cache compiled ctx headers. Allow 8 concurrent checks (process pool).

`rebuild(recovered_dir)`: assemble a full ROM where every function with an accepted `.c` in `recovered_dir` is compiled from that C, and every other function comes from its original bytes (raw `.2byte` per-function `.s`, the scaffold pattern). Link in original order. Return SHA-1 and `identical`. With zero recovered functions it must equal the original SHA-1 (T7 baseline).

`rebuild --fast`: incremental rebuild that recompiles only newly accepted functions and relinks, target under 10 seconds, because Lane D hot-swaps the rebuilt ROM into the live game on stage every few accepted functions. Emit `build.rom` to `runs/live/events.jsonl` after each rebuild, with `pct_agent_code`.

`patch(fn, src)`: like rebuild, but with one function replaced by a modified source. Report exactly which functions' bytes changed. Write the patched ROM to `lab/out/patched.gba`.

`serve`: FastAPI or a tiny stdlib HTTP server with the contract endpoints. `mock serve`: same endpoints backed by `contracts/fixtures/`, for other lanes.

## Step 4 — Fakematch linter (named rules)

Reject, with rule ids and a one-line reason each:
- `L001` inline assembly (`asm`, `__asm__`, `__asm`)
- `L002` raw bytes or words emitted into code (`.byte`, `.2byte`, `.word`, `.inst`, arrays of opcodes cast to function pointers)
- `L003` `#pragma` or `__attribute__` that changes codegen (allow only what the ctx header defines)
- `L004` `register` asm bindings (`register int x asm("r4")`)
- `L005` more than 2 consecutive `goto` labels or computed gotos
- `L006` references to anything outside the ctx header (new externs with addresses)
- `L007` source longer than 8× the target instruction count in lines (padding to coax the compiler)
- `L008` copying the asm file's text into comments or strings

Write the rules in `lab/LINT.md`. The Checker (Lane B) adds a softer "period idiom" review on top; your rules are the hard floor.

## Step 5 — Tests (write them as you go)

- Referee self-test: the original source of 10 random functions (pulled from secrets inside the test only) → `MATCH`.
- One-line change (swap operand order, change a constant) → `PARTIAL` with the right `first_diff.offset`.
- Each lint rule has a failing example.
- `rebuild` with 0 and with 10 recovered functions → identical SHA-1.
- `patch` on a known function → `changed_functions` has exactly that one id.
- Crew isolation helper: `python -m lab.guard check <path>` exits non-zero for anything under `lab/secrets/`. Lane B calls this; also make `lab/secrets` mode 700.
- Concurrency: 8 parallel checks return correct results.

## Step 6 — Hand-offs

- 11:00: commit the real `manifest.json` + `asm/` + `ctx/`. Post the function count and split counts.
- 11:30: referee `serve` running on 7101 on your machine; share the LAN address. Post: "referee is real."
- 13:15: `viz_map.json` real. Post subsystem labels.
- 13:30: ASI:One verify workflow works end to end on a phone (gate in the playbook).
- 15:00: `rebuild` and `patch` proven with tests; tell Lane D the command they'll run on stage.
- 15:30: Excavator + Curator working; 40-second ASI:One capture sent to Lane D; agent names and addresses in `DECISIONS.md` and the README.

## Step 7 — ASI:One agents (Fetch.ai prize; mandatory requirements)

The Fetch.ai track at this event asks for agents that reconstruct software from binaries with evidence that separates observed from inferred, agents that improve on held-out tasks, and agents that verify before trusting. That is our project. To be eligible, all of these must be true at submission:

- At least one agent registered on Agentverse.
- Implements the Agent Chat Protocol (ACP).
- Discoverable and directly usable through ASI:One.
- Meaningful tool execution or multi-agent orchestration.
- The complete primary workflow happens inside an ASI:One conversation; no custom frontend required.
- Public GitHub repo with instructions to run and test.
- Submission also registered through the AIE Summit ASI:One Submission Agent.

**Read first (tonight if possible):** their 5-minute setup guide (in the challenge brief), the basic ASI:One-compatible agent (https://uagents.fetch.ai/docs/examples/asi-1), the multi-agent quickstarter (https://github.com/fetchai/innovation-lab-examples/tree/main/fetch-hackathon-quickstarter), Agentverse docs (https://docs.agentverse.ai/llms.txt), and the ASI1 Interactive Cards docs linked from the innovation lab. Use mailbox mode so no tunnel is needed. Follow the current docs over anything written here.

**The agents (`lab/agents/`)**

| Agent | What a person asks in ASI:One | What it does |
|---|---|---|
| Frankenstein Referee | "Does this C match fn_08000A1C?" (pastes code) · "Verify my fix" | Runs `check` (or `patch`), replies with the verdict |
| Frankenstein Excavator | "Recover fn_08000A1C" · "Bring back the scoring code" | Calls the crew jobs API (`POST /jobs`), streams progress messages, and before reporting success asks the Referee agent to verify the result (real agent-to-agent message, visible in the reply) |
| Frankenstein Curator | "How much of DOOM is back?" · "Prove the rebuild is exact" | Calls `GET /status`, `rebuild`; returns % recovered, false claims caught, original vs rebuilt SHA-1 |

Route intents with Muse Spark (function calling over the three agents' tools), so one ASI:One conversation can move between "recover", "verify", and "prove" naturally.

**Every reply has two labeled parts:**
- *Observed (proved by the compiler):* status, match %, first differing instruction, SHA-1 equality, which functions changed in a patch.
- *Inferred (our best reading, not proof):* function names, what the code does, types.

**Interactive Cards (recommended by the track):** a verdict card (expected vs produced instruction around the first difference, a clear MATCH / REJECTED state), a progress card (% recovered, matched of total, false claims caught, cost), and a proof card (two SHA-1s, identical yes/no). Fall back to well-formatted text if cards misbehave; never block the workflow on cards.

**Reliability (bonus points):** timeouts on every tool call, one retry with backoff, plain-language errors ("The referee is offline; try again in a minute"), never claim success without a referee result in hand.

**Payment Protocol (bonus, stretch only after everything above works):** "pay per verified recovery" for preservation labs and rights holders, implemented with the Stripe test-mode example in the brief. Never charge for an unverified result.

**Acceptance:** from a fresh ASI:One chat on a phone, a teammate can (1) ask how much is recovered, (2) paste a candidate for a small function and get a REJECTED card with the first differing instruction, (3) paste the fixed function and get MATCH, (4) ask the Excavator to recover a small function and watch it consult the Referee before reporting. Record this as a 40-second screen capture for the Fetch.ai submission and send it to Lane D for the demo video.

If you are behind at 13:30, Lane D pauses phone-page work and pairs with you. This step protects up to $5,000.

## Rules

- Follow the team working rules in `docs/00_START_HERE.md` section 15.
- Never fake a match. If the referee is uncertain, it says `PARTIAL`.
- Never let the crew or the Stage touch `lab/secrets/`.
- Post a short update at each hand-off time above.

Start with Step 0 now. Do not ask whether to begin.
