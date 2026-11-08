# Submission film: one minute, v3 (plain language)

Written for someone who has never heard of decompilation. One short sentence on screen at a time, held long
enough to read twice. Four voices alternate, one line each: Eddy, Karthik, Aiden, Enzo, in turn. Each person reads exactly the on-screen line, calmly, and records each line as its own phone voice memo named by its number (`01.m4a`, `05.m4a`, ...). Drop the files into `lab/film/public/voice/` (or AirDrop them to Eddy). The film places each file at the start of its slot, and a missing file just means silence for that line. Keep each take shorter than its slot (3.5 to 5.5 s). No jargon on screen:
no "SHA-1", no "machine code", no "function", no model names except on the end card.

| Time | Picture | On screen = narration | File · voice |
|---|---|---|---|
| 0:00 to 0:04 | Doom gameplay, full screen, crisp | This is Doom, from 1993. | 01 · Eddy |
| 0:04 to 0:08 | same | For most games this old, the original code is lost. | 02 · Karthik |
| 0:08 to 0:12 | A cartridge, and a blank page with a question mark | The game still runs, but nobody can read how it works. | 03 · Aiden |
| 0:12 to 0:16 | same, the page stays blank | So nobody can fix it, or bring it to new devices. | 04 · Enzo |
| 0:16 to 0:21 | Left: a wall of raw numbers from the cartridge. Right: readable code appearing line by line | Our AI agents read the cartridge and rewrite the code, piece by piece. | 05 · Eddy |
| 0:21 to 0:24.5 | The code goes into a checker box | Then a checker rebuilds each piece. | 06 · Karthik |
| 0:24.5 to 0:28 | A green EXACT MATCH stamp | It passes only if it's an exact match. | 07 · Aiden |
| 0:28 to 0:32 | A chat bubble from the AI: "Done. It matches!" | Sometimes the AI says it got it right when it didn't. | 08 · Enzo |
| 0:32 to 0:36 | A red NOT A MATCH stamp lands on the bubble | The checker caught all 39 of those today. | 09 · Eddy |
| 0:36 to 0:40 | 568 squares; 235 fill in green, the counter ticks up | 235 of Doom's 568 pieces are back so far. | 10 · Karthik |
| 0:40 to 0:44 | The squares snap into a cartridge; a check mark | Put back together, the game is identical to the original. | 11 · Aiden |
| 0:44 to 0:49 | Original Doom, cheat on. Zoom into the health number: 100% | Now that we have the code, we can change it. | 12 · Enzo |
| 0:49 to 0:55 | Edited build, same cheat. Zoom into the health number: 200% | We changed one line of the AI's code. Same cheat, double the health. | 13 · Eddy |
| 0:55 to 1:00 | End card | Doom is just the first. Frankenstein brings lost games back. | 14 · Karthik |

End card line under the title (not narrated, readable): "Built for any game we can compile. Doom is the first." End card small print (not narrated): "Built today: the AI agents, the checker, the patch, this film. Not ours: Doom (id Software),
GBADoom (doomhack), mGBA. Made with Meta Muse, SubQ Snap, Fetch.ai ASI:One, MongoDB Atlas, Gemini." Plus the URL and the team.

Sources: 39 = `tools/counts.py` false_claims_caught; 235 and "identical" = the 16:12 freeze (`lab/demo/union_rebuild.json`);
the 100% and 200% shots = `lab/demo/clips/god_original.mp4`, `god_200.mp4`.
