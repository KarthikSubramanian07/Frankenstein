# Fakematch lint rules (`lab/referee/lint.py`)

A candidate that breaks any rule gets `LINT_FAIL` and is never compiled. Lane B's Checker adds a softer idiom review on top.

| Rule | Rejects |
|---|---|
| L001 | Inline assembly (`asm`, `__asm`, `__asm__`) |
| L002 | Raw bytes or words emitted into code (`.byte`, `.2byte`, `.4byte`, `.hword`, `.short`, `.word`, `.inst`) |
| L003 | `#pragma`, `_Pragma` or `__attribute__` |
| L004 | `register` asm bindings (`register int x asm("r4")`) |
| L005 | Computed gotos, or more than 2 consecutive labels |
| L006 | Hard-coded RAM or ROM addresses (0x02, 0x03, 0x08 regions); use the `fn_`/`data_` ids. I/O, palette, VRAM and OAM casts are allowed |
| L007 | More than 8 non-blank lines per target instruction (padding to coax the compiler) |
| L008 | Three or more long instructions from the function's asm copied into comments or strings |
| L009 | Any include except a `<system>` header: quoted, absolute, `..`, `#embed` or macro includes could read `lab/secrets` through the compile log |
