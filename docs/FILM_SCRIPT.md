# Submission film: one minute, narration script

Read this aloud in one take, at a calm pace (about 140 words a minute). Leave a one-second pause at each `/`.
Record on a phone, voice memo is fine, quiet room, phone 20 cm from your mouth. Push the file to
`lab/film/public/voice/narration.m4a` (or `.wav`) by 16:20, or AirDrop it to Eddy.

The number in [brackets] is the 16:00 frozen count. Read the number Lane B posts at 16:00.

| Time | Narration (Karthik) | Caption | On screen |
|---|---|---|---|
| 0:00 | "Same game. Same cheat. / On the right, we changed one line of code that AI rebuilt from the cartridge." | Doom, rebuilt by AI from machine code. Then changed. | God mode: health 100% next to 200% |
| 0:06 | "Most classic games survive only as a cartridge. / The source code is gone." | 87% of classic games are endangered (VGHF and SPN, 2023). | The cartridge; the recipe card with its lines missing |
| 0:11 | "Our agents read the machine code and write the C back. / It only counts if it compiles to the exact same bytes." | Meta's Muse writes the C. Byte for byte, or it doesn't count. / From memory alone: 0 of 20 compiled. | Machine code becomes C, then MATCH |
| 0:20 | "Agents lie. / Twenty-four times today they claimed a match that wasn't. / The referee caught every one." | 24 lies caught · 30 fakes rejected · 0 let through. Agents lie. Compilers don't. | A real false claim, rejected at one instruction |
| 0:28 | "[175] of Doom's 568 functions are back. / Rebuilt into the game, it's identical to the original, byte for byte." | [175] of 568 functions, proven. SHA-1 identical. | The counter, two identical checksums |
| 0:36 | "Stuck at ninety percent? The next run starts from its best try." | Run over run: a 90% near-miss became a MATCH. (No held-out gain yet; we don't claim one.) | fn_0801ABC0: 90% in run 1, MATCH in the warm-start run (DECISIONS 14:03) |
| 0:40 | "That's what source buys you. / Change the game. Run the same code in a browser, and get the same answers." | One line of recovered C changed. 20,000 of 20,000 identical in a browser. | God mode at 200%; the equivalence page |
| 0:46 | "Muse writes it. SubQ Snap judges it. The compiler proves it. / And anyone can ask for it in ASI:One." | Muse writes · Snap judges · the compiler proves · ASI:One asks | The four partners, each doing its job |
| 0:53 | "Frankenstein. / Lost games, rebuilt and proven." | Built today / Not ours (at least 3 s) | Credits, tryfrankenstein.pages.dev |

About 135 words, 57 seconds. If it runs long, drop the 0:36 voice line first (keep its caption), then "The source code is gone."
Sources: 87% DECISIONS 12:12; 0 of 20 DECISIONS 13:28; 24 / 30 / 0 `python3 tools/counts.py`; 90% to MATCH DECISIONS 14:03 (doom_hud03); [175] and the SHA-1 from the 16:00 freeze.
