// Every number and string the film shows. Real data only: each field names its source.
// Owned by the asset pass (fork V1); the scenes read it and never hardcode numbers.
export const DATA = {
  // FROZEN at 16:00 by Lane B's union; update here once, then re-render.
  functions: 225, // frozen at 16:00 (counts.py at 15:20); crew/exports/union/UNION.json "functions" (python3 tools/counts.py)
  totalFunctions: 568,
  pctBytes: 7.54, // counts.py pct_bytes; frozen at 16:00
  liesCaught: 24, // counts.py false_claims_caught (crew/exports, 35 runs)
  fakesRejected: 31, // counts.py fakes_rejected
  fakesAccepted: 0,
  sha1: 'd936259bcbe48b5ce5d8be4d5ffe935c1eece8b2', // original and rebuilt ROM (identical; DECISIONS 15:06)
  endangeredPct: 87, // VGHF and SPN, 2023 (DECISIONS 12:12)
  equivalence: {identical: 20000, total: 20000}, // lab/demo/equivalence/web, recorded GBA outputs
  checkSeconds: 0.2, // referee check time, 0.1 to 0.2 s (DECISIONS 11:24)
  // Filled by fork V1 from real files:
  // lab/out/target/fn_08013CA4.json (12 of its 21 instructions, relocations shown as callee ids) + crew/exports/union/recovered/fn_08013CA4.c
  // (declarations trimmed); referee check MATCH 100% at 15:22, in the union (from doom_r14).
  match: {fn: 'fn_08013CA4', asm: ["push {r4, r5, r6, lr}", "bl fn_08019244", "movs r1, #3", "movs r0, #2", "bl fn_0801D8A4", "ldr r5, [pc, #32]", "ldr r4, [pc, #32]", "ldr r3, [r5, #0]", "ldr r0, [r3, r4]", "bl fn_0801D5E8", "str r2, [r3, r4]", "pop {r4, r5, r6}"], c: "void fn_08013CA4(void)\n{\n    fn_08019244();\n    fn_0801D8A4(2, 3);\n    fn_0801D5E8(data_030064C4->f878);\n    data_030064C4->f878 = 0;\n    data_030064C4->f880 = 0;\n    data_030064C4->f87c = 0;\n}"},
  // verified 15:22 against claim.made seq 455 and verdict seq 456 (offset 68 = +0x44, claim_was_true false)
  lie: {fn: 'fn_0801143C', run: 'doom_r12', attempt: 5, claim: 'Matched it. Pretty sure.', pct: 96.5, offset: '+0x44', expected: 'ldr r2, [pc, #48]', got: 'ldr r3, [r4, #76]'}, // crew/exports/doom_r12/events.jsonl
  // real snap.decision events in crew/exports/doom_r12/events.jsonl (decide_next on fn_08014504 and fn_08018624; review by gemini)
  snap: ['SNAP · ESCALATE · 0.88', 'SNAP · KEEP · 0.85', 'GEMINI · REVIEW · FAKE P 0.00'],
  // lab.agents.frankenstein_agent.answer_prove() at 15:22 (live union, so its count follows the freeze)
  asiOne: "Is the rebuilt game exact?\nOriginal ROM SHA-1: d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2\nROM built from the agents' code: d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2\nIdentical: yes\nFunctions taken from the agents' compiled code: 225 (7.54% of the game's code bytes)\nInferred: none. Every line above is a checksum or a count.",
  memoryProbe: {compiled: 0, of: 20}, // DECISIONS 13:28, lab/out/memory_probe.json (memory alone)
  // crew/exports/doom_hud02 attempts 2-4 at 90.0%; crew/exports/doom_hud03 verdict seq 186: MATCH on attempt 10
  warmStart: {fn: 'fn_0801ABC0', before: 90, beforeRun: 'doom_hud02', after: 'MATCH', afterRun: 'doom_hud03', attempt: 10},
  url: 'tryfrankenstein.pages.dev',
  repo: 'github.com/KarthikSubramanian07/Frankenstein',
  team: ['Eddy Zhao', 'Karthik Subramanian', 'Aiden Huang', 'Enzo Emami'],
  notOurs: ['Doom (id Software)', 'GBADoom (doomhack)', 'the shareware WAD', 'mGBA', 'devkitARM', 'Meta, Subquadratic, Fetch.ai, MongoDB, Google platforms'],
  builtToday: ['the agent crew', 'the referee', 'the Checker', 'the Stage', 'the patches', 'this film'],
};
