# Lane A submission text (paste-ready)

Drafted for the submission page. Numbers come from `lab/STATUS.md`, `lab/HANDOFFS.md`, `lab/README.md`, `lab/LINT.md`, `lab/TOOLCHAIN.md` and `DECISIONS.md`. The memory probe numbers are blanks until the probe runs.

## Best Use of Fetch.ai: Agents That Prove Their Work

Frankenstein brings lost games back from the cartridge, and its two Fetch.ai agents prove their work. Neither one reports a recovered function until a compiler has checked it byte for byte against the original Doom.

The Frankenstein Referee (`agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0`) and the Frankenstein Excavator (`agent1qf4w7kmtsgv4fdyuj72nwethhjwhmdh7m3u7kqe5tgz4wyq8nmmmq5gjacp`) speak the Agent Chat Protocol and reach ASI:One through Agentverse mailboxes.

The whole workflow happens in an ASI:One chat. Ask the Referee "Which functions can I try?", "Does this C match fn_0801B724?" with a ```c block, "Verify my fix for fn_…", "Recover fn_…", "How much of DOOM is back?" or "Prove the rebuild is exact". A verified fix comes back with every changed function and the new ROM checksum.

Every reply has two parts. Observed is what the compiler proved: byte matches, SHA-1s, which functions changed. Inferred is our reading, such as which game routine a function probably is.

The Excavator digs and never grades itself. Send "@frankenstein-excavator Recover the face" and it starts a crew job.

When the crew has C, the Excavator sends it to the Referee agent in an agent-to-agent chat message and answers only after the Referee's verdict comes back, quoted word for word.

If the crew is down, it says so and nothing goes to the Referee. In the self-test, both agents logged the MATCH exchange.

One honest limit: both agents, the referee and the crew all run on one laptop.

Code: `lab/agents/frankenstein_agent.py`, `lab/agents/excavator_agent.py`, `lab/agents/run_agent.sh`, `lab/agents/run_excavator.sh`, `lab/agents/connect_mailbox.py`.

## How the referee proves a match

The referee compiles with devkitARM GCC 16.1.0 (pinned in Docker), using GBADoom's own Makefile flags minus `-flto=8`. LTO lets the linker merge functions across files, which breaks per-function matching.

Each candidate compiles to its own object file. The referee disassembles it and compares every instruction with the same function in the original's object. At relocation sites (calls and literal-pool addresses), both sides must point at the same anonymous `fn_` or `data_` id at the same offset, so real names never reach the agents.

A call to a static function in the same file has no relocation and its bytes depend on layout, so both sides compare it as "calls fn_X".

The target is a private variant of GBADoom with 11 body-only edits, so a model can't pass by reciting the original from memory.

Rebuild works by object splice. The referee re-checks every recovered function, writes the agents' own compiled bytes into the ROM, and keeps linked addresses only where it proved the relocations identical. The crew's 28 recoveries from run `doom_r01` give a ROM with an identical SHA-1. They are small functions, 0.25% of code bytes.

Patch compiles a fix, links it with `ld` at the function's real address and writes it in place. Relinking unchanged C changes 0 bytes, and changing one constant changes 1 byte in one function.

## Trust but Verify: the referee can't be talked into anything

A candidate that breaks any of 11 lint rules gets `LINT_FAIL` and is never compiled. The rules block inline assembly, raw bytes emitted into code, pragmas and attributes, register bindings, computed gotos, hard-coded ROM and RAM addresses, padding, copied asm in comments, and any include other than a system header (`lab/LINT.md`).

We red-teamed our own linter. We tried 13 bypass classes, including token pasting, line splices, digraphs, trigraphs and fake linemarkers, and all 13 are blocked.

Lint now runs twice: on the source as written, then on the `gcc -E` output, keeping only the candidate's own lines. A macro like `J(as,m)("nop")` or `_Prag##ma` gets caught after expansion. 25 tests cover this (`lab/tests/test_lint_hardening.py`).

Karthik found the worst hole. Anyone in ASI:One can paste C into the referee, and a `%:include` digraph could print `.env` into the compile log. His fix makes lint read the source the way the preprocessor does, and the referee withholds any compile log that mentions another file.

## What's real and what isn't (Lane A)

Real: every compiler verdict comes from devkitARM GCC on the private variant. The SHA-1s are real, including the identical rebuild from 28 crew recoveries. The ASI:One exchange is real: at 12:18 the Referee agent returned MATCH and REJECTED verdicts inside ASI:One.

Display rule: code we haven't recovered yet shows as static. The static-face ROM swaps the face function (`fn_0801B298`) for a 44-byte stub that shows a random face frame each tick. It changes that one function.

Not built: a native port. Doom runs as a GBA ROM.

The variant's source stays private until after judging. GBADoom is GPL-2.0-or-later, so we publish `variant.patch` after judging and send it to anyone who asks before then.

## Memory probe

Did the model just remember Doom? Muse Spark gets only a function's public name and writes it from memory, and its function replaces the original in the real source file and is compared against two targets: the unmodified GBADoom build and our private variant. It matched 0 of 20, against both the unmodified build and our variant. It refused 10 of them, even when told the code is GPL. The other 10 did not compile against GBADoom's real headers: it invented struct fields and remembered different function signatures.
