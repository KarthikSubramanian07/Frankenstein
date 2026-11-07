# Frankenstein Referee

Frankenstein brings back the lost source code of classic games. AI agents rewrite it from the compiled cartridge, one function at a time, and nothing counts unless a compiler proves it's byte-identical to the original. Doom is our first patient: so far 179 of its 568 functions are back, and the game rebuilt with them has the same SHA-1 as the original. It's built for any compiled game with a matching compiler and a reproducible build; it has been proven on Doom (GBADoom for the Game Boy Advance) and tried on a second game, Attack on Voxelburg (4 of 20 functions on a first run).

This agent is the referee you can talk to. Ask it to:

- check a C function against the original ("Does this C match fn_0801B724?" followed by your code)
- verify a bug fix ("Verify my fix for fn_…") and report exactly which functions changed and the new ROM checksum
- recover a function with the agent crew ("Recover fn_…"); it re-checks the crew's answer itself before reporting it
- report progress ("How much of DOOM is back?")
- prove the rebuilt game is exact ("Prove the rebuild is exact"), with both checksums
- suggest functions to try ("Which functions can I try?")

Every answer separates what the compiler observed (byte matches, checksums, which functions changed) from what is only inferred (function names, what the code does).

Built at the AI Engineer Code Summit hackathon, Nov 7 2026. Target game: GBADoom by doomhack (GPL-2.0-or-later), with the Doom shareware episode. Source: https://github.com/KarthikSubramanian07/Frankenstein
