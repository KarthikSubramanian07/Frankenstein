# Pokémon Red as a crew target

Lane A built this target. It has a manifest, per-routine assembly and context files, and a referee on :7103. The crew loads it with no code changes. Lane B only needs to change the prompt.

## Run it

```
python3 lab/pokered/make_target.py                # writes lab/out/games/pokered/ (follows slice.json: 165 routines as of this run) and runs the name scan
python3 -m lab.referee serve --game pokered       # referee on 127.0.0.1:7103 (Doom stays on :7101)
```

Point the crew at it with two environment variables:

```
FRANK_MANIFEST=lab/out/games/pokered/manifest.json
REFEREE_URL=http://127.0.0.1:7103
```

Checked with these variables set: `crew.target.Target` loads 128 train and 37 held-out routines (165 in all). `asm()` reads `lab/out/games/pokered/asm/<id>.s`. `context()` falls back to `GET :7103/context/<id>`, because `Target.context` only looks in `lab/out/ctx/`. `digger_user()` builds the prompt and `n_instructions()` counts the instructions.

## What the files contain

- Ids are `rt_BB_AAAA`: ROM bank and address, lowercase hex. The manifest `addr` is `0x00BBAAAA` and `mode` is `"sm83"`. Each entry also has `bank`, `bank_addr` and `inline_data`. One routine, `rt_01_42dd`, has `inline_data: true`. Its bytes don't all decode as instructions, so it can't match until the referee's data allowance covers it.
- `asm/<id>.s` is a fresh SM83 disassembly in RGBDS syntax. Other routines appear as `rt_` ids, branch targets inside the routine as `.l_AAAA`, and everything else as numbers. It contains no original labels or comments.
- `ctx/<id>.inc` holds the rules and the ids this routine references, as `;` comments.
- Callees and callers are edges inside the slice and use `rt_` ids. They don't match the schema's `fn_` patterns (see DECISIONS).

## Requests to Lane B

1. Choose the system prompt from the manifest. When `functions[].mode == "sm83"`, replace `DIGGER_SYSTEM` with an SM83 version. It must say this: you rewrite one Game Boy (SM83) routine as **RGBDS assembly**, not C. Define it under its exact label, `rt_BB_AAAA:` on the first line. Use only `.local` labels inside it. Refer to every other routine, RAM address or data label by its `xx_BB_AAAA` id or a plain number. No `db/dw/ds`, `SECTION`, `INCLUDE`, `MACRO`, `DEF/EQU/EQUS`, `REPT` or new global labels, because the linter rejects them. Macros already in the source tree (`farcall rt_0d_7258`, `HIGH()`, `BANK(rt_..)`) are allowed. The `predef` macro needs a symbolic name, so write its expanded form instead. Keep it byte-stable for prompt caching by making it a second constant, not an f-string.
2. Make the tool text match the language. In `TOOLS[0]`, change "Compile the candidate C with the project's exact compiler and flags" and the `src` text "Complete C source" to "assemble the candidate RGBDS routine in the full game source", but only for sm83 targets.
3. Fix the fences in `digger_user`. When the mode is sm83, fence the context as ```` ```asm ```` (it's `;` comments, not ```` ```c ````), change "Write the C now" to "Write the assembly now", and label recovered neighbours and cases as asm.
4. Make the Checker rules mode-aware. `ABS_ADDR` and the message "data_ id (L006)" only apply to C. For sm83, accept numbers and `xx_BB_AAAA` ids. Distill prompts should say "assembly" where they say "C".
5. Optional: let `Target.context` read `<manifest dir>/ctx/<id>.inc` before `lab/out/ctx/<id>.h`, so the HTTP fallback isn't needed.

Be honest about difficulty: the disassembly given to the Digger reassembles to the same bytes. Echoing it back gets a MATCH, so this target tests the pipeline, not recovery difficulty. Present any Pokémon MATCH that way, and don't count it alongside Doom's C matches.

## Verified (no model calls)

- `POST :7103/check` with the original source of `rt_01_4496` and `rt_01_5e8a`, routine and RAM names rewritten to ids (`/tmp/pk/e2e.py`), returns MATCH 100.0.
- With the 148-routine slice, submitting each generated `asm/<id>.s` unchanged to `check()` matched 142 of 147. The other five got NO_COMPILE: `rt_01_62ff`, `rt_01_7375`, `rt_01_7656`, `rt_03_4754` and `rt_10_5010`. For these the referee's source splice removes more than the routine's byte extent, so tables and labels after the code disappear. That's a Lane A referee fix, not a crew issue.
