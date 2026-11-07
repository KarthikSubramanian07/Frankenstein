# Fakematch lint rules (`lab/referee/lint.py`)

A candidate that breaks any rule gets `LINT_FAIL` and is never compiled. Lane B's Checker adds a softer idiom review on top.

| Rule | Rejects |
|---|---|
| L001 | Inline assembly (`asm`, `__asm`, `__asm__`) |
| L002 | Raw bytes or words emitted into code (`.byte`, `.2byte`, `.4byte`, `.hword`, `.short`, `.word`, `.inst`) |
| L003 | `#pragma`, `_Pragma`, `__attribute__` or C23 `[[attributes]]`. One exception: exactly one `__attribute__((target("arm")))` written literally in front of a function definition, and only when the manifest gives the function `mode: "arm"`. Voxelburg compiles every file `-mthumb` and its IWRAM functions carry this attribute in the original, so they can't match without it. Everything else stays banned: `target("thumb")`, `target("arm")` combined with anything, `optimize`, `naked`, `section`, `[[gnu::...]]`, a second copy, one on a prototype or inside a `#define`, and any on a Thumb function. Doom's ARM functions need nothing: their IWRAM files already compile with `-marm` |
| L004 | `register` asm bindings (`register int x asm("r4")`) |
| L005 | Computed gotos (`goto *p`, `&&label`), or more than 2 consecutive labels. Logical `a && b` is fine |
| L006 | Hard-coded RAM or ROM addresses (0x02, 0x03, 0x08 regions); use the `fn_`/`data_` ids. I/O, palette, VRAM and OAM casts are allowed. Hex or decimal, with or without parentheses |
| L007 | More than 8 non-blank lines, or more than 320 non-blank characters, per target instruction (padding to coax the compiler) |
| L008 | Three or more long instructions from the function's asm copied into comments or strings |
| L009 | Any include except a `<system>` header: quoted, absolute, `..`, `#embed`, `__has_include` or macro includes could read `lab/secrets` or `.env` through the compile log. Lint sees the source as the preprocessor does (line splices joined, `%:` digraphs as `#`, strings lexed before comments), and the referee withholds any compile log that mentions another file |
| L010 | Any preprocessor directive except `include`, `define`, `undef`, `if`/`ifdef`/`ifndef`/`elif`/`else`/`endif`, `error`, `warning`. Blocks `#line` and `# 1 "file"` linemarkers (which could relabel candidate code as a system header), `#embed`, `#include_next`, `#import` |
| L011 | ARM instruction intrinsics (`__builtin_arm_cdp`, `mcr`, `ldc` and friends), whose immediates encode chosen instruction bits |

Lint runs twice. The raw pass checks the source as written, with digraphs (`%:`, `<:`, `<%`) and `??=` mapped to their plain forms. If it passes, the referee runs `gcc -E` with the same flags and ctx header and lints the expansion again (L001 to L006 and L011), keeping only the lines that the linemarkers attribute to the candidate. That catches anything built by token pasting or macros, such as `J(as,m)("nop")`, `_Prag##ma`, `__attri##bute__` or `0x0300##1234`. Violations from this pass say "(after macro expansion)". The expansion may contain the allowed `target("arm")` only as many times as the raw source spells it out (0 or 1), so a macro can't build it.
