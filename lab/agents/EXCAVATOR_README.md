# Frankenstein Excavator

Frankenstein brings back the lost source code of classic games. AI agents rewrite it from the compiled cartridge, one function at a time, and nothing counts unless a compiler proves it's byte-identical to the original. Doom is our first patient: so far 235 of its 568 functions are back, and the game rebuilt with them has the same SHA-1 as the original. It's built for any compiled game with a matching compiler and a reproducible build; it has been proven on Doom (GBADoom for the Game Boy Advance) and tried on a second game, Attack on Voxelburg (4 of 20 functions on a first run). This agent does the digging. It never grades its own work.

Ask it to:

- recover a function by id ("Recover fn_0801B724")
- recover something by description ("Recover the face"); the crew picks the most likely function from your words

What happens next:

1. A crew of coding agents writes C for the function until its own checker says it matches.
2. The Excavator sends that C, in an agent-to-agent chat message, to a separate agent: the Frankenstein Referee (agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0). The Referee compiles it and compares every byte with the original.
3. The Excavator answers you only after the Referee replies, and quotes the Referee's verdict word for word.

If the crew is down, it tells you that, and nothing goes to the Referee.

Every answer keeps what the compiler observed (byte matches) apart from what is only inferred (which game routine this is).

Built at the AI Engineer Code Summit hackathon, Nov 7 2026. Target game: GBADoom by doomhack (GPL-2.0-or-later), with the Doom shareware episode. Source: https://github.com/KarthikSubramanian07/Frankenstein
