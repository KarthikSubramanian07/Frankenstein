# Frankenstein Excavator

Frankenstein rebuilds the lost C source code of DOOM for the Game Boy Advance, one function at a time. This agent does the digging. It never grades its own work.

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
