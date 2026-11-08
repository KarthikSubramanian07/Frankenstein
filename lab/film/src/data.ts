// Every number and string the film shows. Real data only: each field names its source.
// Owned by the asset pass (fork V1); the scenes read it and never hardcode numbers.
export const DATA = {
  // FROZEN at 16:00 by Lane B's union; update here once, then re-render.
  functions: 235, // frozen at 16:00 (counts.py at 15:20); crew/exports/union/UNION.json "functions" (python3 tools/counts.py)
  totalFunctions: 568,
  pctBytes: 8.39, // counts.py pct_bytes; frozen at 16:00
  liesCaught: 39, // counts.py false_claims_caught (crew/exports, 35 runs)
  fakesRejected: 32, // counts.py fakes_rejected
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
  asiOne: "Is the rebuilt game exact?\nOriginal ROM SHA-1: d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2\nROM built from the agents' code: d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2\nIdentical: yes\nFunctions taken from the agents' compiled code: 235 (8.39% of the game's code bytes)\nInferred: none. Every line above is a checksum or a count.",
  memoryProbe: {compiled: 0, of: 20}, // DECISIONS 13:28, lab/out/memory_probe.json (memory alone)
  // crew/exports/doom_hud02 attempts 2-4 at 90.0%; crew/exports/doom_hud03 verdict seq 186: MATCH on attempt 10
  warmStart: {fn: 'fn_0801ABC0', before: 90, beforeRun: 'doom_hud02', after: 'MATCH', afterRun: 'doom_hud03', attempt: 10},
  // public shared chat https://asi1.ai/shared-chat/5dfc14f7-815e-42e7-a0be-96db539cf5ab, captured 16:0x (stills in public/assets/asi_one_*)
  asiOneLabel: 'real ASI:One chat, 15:41 (count at that time: 179)',
  // 384 real bytes of the cartridge starting at fn_08013CA4 (lab/out/target.gba, offset 0x13CA4)
  matchHex: '70 B5 05 F0 CD FA 03 21 02 20 09 F0 F9 FD 08 4D 08 4C 2B 68 18 59 09 F0 95 FC 88 21 00 22 2B 68 09 01 1A 51 5A 50 04 49 5A 50 70 BC 01 BC 00 47 C4 64 00 03 78 08 00 00 7C 08 00 00 F0 B5 DE 46 45 46 57 46 4E 46 F6 22 00 24 E0 B5 0D 00 B4 21 EA 4E 33 68 52 00 87 B0 9C 50 04 3A 9C 50 04 3A 9C 50 2C 32 99 50 80 3A 9C 50 04 32 9C 50 08 3A 9C 50 B3 39 9C 3A 99 50 80 46 06 F0 D5 FE 05 F0 8F FA 03 21 02 20 09 F0 BB FD DD 4F 33 68 D8 59 09 F0 58 FC 88 22 33 68 12 01 DC 51 9C 50 D9 4A 9C 50 D9 4A 98 58 04 F0 23 FF 31 68 D7 4A 8B 58 01 33 02 D0 01 23 5B 42 8B 50 04 F0 CD FB 94 23 32 68 D3 5C 02 2B 00 D1 38 E2 03 AC 43 46 09 21 20 00 CF 4A 00 95 F1 F7 6D FB 20 00 09 F0 7E FB 00 27 34 68 CB 4B 80 46 E7 50 07 23 43 44 18 00 9A 46 09 F0 CD FB 1A 21 11 F0 3A FC C6 4D 00 23 02 22 28 21 60 51 09 F0 E9 FC DF 23 1B 01 E0 50 34 68 60 59 00 22 02 21 40 00 99 46 09 F0 5C FC BE 4B E0 50 34 68 BE 4B E7 50 63 59 00 2B 46 DD 50 46 09 F0 C7 FB 24 23 9B 46 01 33 05 00 9A 46 4A 46 BB 00 A4 58 DB 19 DB 00 E4 18 6B 78 2A 78 1B 02 13 43 1B 04 23 60 EB 78 AA 78 1B 02 13 43 1B 04 63 60 28 1D 05 F0 03 F9 5B 46 E0 54 28 00 0C 30 05 F0 FD F8 53 46 E0 54 26 23 2A 7D E2 54',
  // End card: close[0] is the big title, the rest are the closing lines (swap with one edit, then render).
  close: ['Frankenstein', 'Doom is just the first. Frankenstein brings lost games back.'],
  url: 'tryfrankenstein.pages.dev',
  repo: 'github.com/KarthikSubramanian07/Frankenstein',
  team: ['Eddy Zhao', 'Karthik Subramanian', 'Aiden Huang', 'Enzo Emami'],
  notOurs: ['Doom (id Software)', 'GBADoom (doomhack)', 'the shareware WAD', 'mGBA', 'devkitARM', 'Meta, Subquadratic, Fetch.ai, MongoDB, Google platforms'],
  builtToday: ['the agent crew', 'the referee', 'the Checker', 'the Stage', 'the patches', 'this film'],
};
