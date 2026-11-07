# Frankenstein Referee

Frankenstein rebuilds the lost C source code of DOOM for the Game Boy Advance, one function at a time. Coding agents write the C, and nothing counts unless a compiler proves it turns into exactly the original machine code, byte for byte.

This agent is the referee you can talk to. Ask it to:

- check a C function against the original ("Does this C match fn_0801B724?" followed by your code)
- verify a bug fix ("Verify my fix for fn_…") and report exactly which functions changed and the new ROM checksum
- recover a function with the agent crew ("Recover fn_…"); it re-checks the crew's answer itself before reporting it
- report progress ("How much of DOOM is back?")
- prove the rebuilt game is exact ("Prove the rebuild is exact"), with both checksums
- suggest functions to try ("Which functions can I try?")

Every answer separates what the compiler observed (byte matches, checksums, which functions changed) from what is only inferred (function names, what the code does).

Built at the AI Engineer Code Summit hackathon, Nov 7 2026. Target game: GBADoom by doomhack (GPL-2.0-or-later), with the Doom shareware episode. Source: https://github.com/KarthikSubramanian07/Frankenstein
