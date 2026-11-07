# FRANKENSTEIN — Pitch deck (text version)

> **Read `DECISIONS.md` → "Corrections" first. Where it disagrees with this file, DECISIONS.md wins (clock, compiler, rebuild, variant, finale, judging).**


Slide copy and speaker notes. The designed version is `Frankenstein_Pitch_v1.pdf` (game-scenes style). Bracketed values like `[__]` are filled only from `runs/*/metrics.json` and real build output.


## Slide 1

- FRANKENSTEIN
- LOST GAMES, REBUILT AND PROVEN
- FILE 1   DOOM   0%
- SOURCE CODE: LOST
- FILE 2   NEW GAME
- PRESS START
- [TEAM NAMES]

**Say:** “Somewhere in a drawer there's a cartridge with your childhood on it.” Pause. Let the room picture it.


## Slide 2

- GAME OVER
- 87% OF CLASSIC VIDEO GAMES RELEASED IN THE U.S. ARE CRITICALLY ENDANGERED.
- Video Game History Foundation and Software Preservation Network, 2023. Measured as not commercially available.

**Say:** “It's probably not for sale anywhere.” Read the number and stop. The lost-code point is the next slide.


## Slide 3

- PLAYABLE IS NOT ALIVE
- EMULATOR
- Keeps an old game playable exactly as it shipped. Bugs and all, forever.
- SOURCE CODE
- Lets someone fix it, rebuild it for new devices, or change it. For most old games it's gone. All that's left is machine language people can't read.

**Say:** “Emulators can keep some of them playable. But for most old games, the code that made them is gone.” This answers the emulator question early.


## Slide 4

- VICTOR FRANKENSTEIN
- NEVER CHECKED HIS WORK.
- OURS CHECKS EVERY PIECE,
- BYTE FOR BYTE.

**Say:** “So we built Frankenstein: coding agents that study a finished game and rebuild its lost code, piece by piece.” Land the doctor line.


## Slide 5

- WORLD 1: HOW A PIECE GETS IN
- EVERY PIECE THEY GET RIGHT TEACHES THE NEXT RUN A GENERAL HABIT OF THE COMPILER, NEVER THE ANSWER.

**Say:** Walk it left to right in one breath. Then: “and every piece they get right teaches the next run.”


## Slide 6

- HOW TO PLAY THIS DEMO
- THE GAME ON SCREEN, CRAWLING WITH STATIC.
- ONE SIDE PLAYS. THE OTHER SIDE REBUILDS.
- A DIGGER CLAIMS A MATCH. THE REFEREE CATCHES THE LIE.
- A JUDGE PLAYS ON CODE OUR AGENTS JUST WROTE.
- TIME TRIAL: FASTER ON FUNCTIONS IT HAS NEVER SEEN.
- THE REBUILT GAME IS IDENTICAL TO THE ORIGINAL.
- WE FIX A BUG THE CREATOR NEVER PATCHED. YOU PLAY IT.

**Say:** Say what's live and what's replay before anyone asks: two or three functions live, the rest a real earlier run at 8x, labeled on screen.


## Slide 7

- DIGGERCLAIM 92%
- 63
- REFEREE100%
- DIGGER
- VS
- REFEREE
- “Matched it. Pretty sure.”
- EXPECTEDadds r0, r1, #0
- GOTadds r0, r2, #0
- K.O. CLAIM REJECTED
- [N] LIES CAUGHT THIS RUN

**Say:** “Every piece one agent writes is checked by another.” Point at the red register. Fill [N] from metrics.json; never round up.


## Slide 8

- TIME TRIAL
- RUN 1 TRAINING   [__] MIN / PIECE
- RUN 2 HELD-OUT   [__] MIN / PIECE
- GHOST: LIBRARY OFF [__] MIN / PIECE
- MATCH RATE   [__]% VS [__]%
- MEMORY TEST   [__] OF 20 MATCHED
- MUSE SPARK   [__] CALLS, $[__] PER PIECE
- PENALTIES
- FALSE CLAIMS [__]
- FAKES REJECTED [__]
- SAME MODEL, SAME BUDGET

**Say:** “And every game they bring back makes the next one faster.” Read held-out on versus the ghost exactly. If it isn't better, say so.


## Slide 9

- THE EVIDENCE RULE
- BRIGHT = PROVED
- This function recompiles to identical bytes. The rebuilt game has the same checksum. The fix changed exactly one function.
- VIOLET ? = OUR GUESS
- Names like “SHOTGUN FIRE?”, what a function does, why it was written that way.

**Say:** Every scene and every chat answer keeps these apart. This is “evidence that separates observed from inferred.”


## Slide 10

- IT'S ALIVE
- FILE 1   DOOM   [__]%
- ORIGINAL CHECKSUM
- [40 HEX CHARACTERS]
- REBUILT CHECKSUM
- [40 HEX CHARACTERS]
- IDENTICAL
- PATCH 1.01: 1 FUNCTION CHANGED.
- A BUG THE CREATOR NEVER FIXED.
- BEFORE / AFTER
- CLIP
- THE BUG, THEN THE FIX

**Say:** “When the last piece goes in, the game wakes up. And because its code is back, it can finally be fixed.” Only say the bug line if Lane D verified it.


## Slide 11

- PLAYER 2
- PULL OUT YOUR PHONE
- THE FIXED GAME, BUILT
- FROM THE CODE OUR
- AGENTS RECOVERED
- QR CODE
- FROM
- PHONE.PUBLISHED
- PRESS START

**Say:** Say the line, show the code, then stop talking. Let the room play.


## Slide 12

- ANY AGENT CAN ASK BEFORE IT MERGES
- Verify my fix for fn_08000A1C.
- FRANKENSTEIN REFEREE, ON ASI:ONE
- PROVED: MATCH. 42 of 42 instructions identical. Rebuilt game identical except this function, as intended.
- OUR GUESS: this is the status bar face routine?
- REFEREE VERIFIES. EXCAVATOR RECOVERS AND ASKS THE REFEREE FIRST. CURATOR PROVES THE REBUILD.

**Say:** For the Fetch.ai judges: the whole workflow happens inside an ASI:One conversation, and agents talk to each other before anything counts.


## Slide 13

- CREDITS
- MUSE SPARK 1.3   META MODEL API
- EVERY DIGGER, THE REVIEW, THE ANNOUNCER, NAMING FROM SCREENSHOTS
- AGENTVERSE + ASI:ONE   FETCH.AI
- THE REFEREE, EXCAVATOR AND CURATOR AGENTS
- ATLAS VECTOR SEARCH   MONGODB
- THE IDIOM LIBRARY, EVERY ATTEMPT AND VERDICT
- SUBQ   SUBQUADRATIC
- THE WHOLE-PROGRAM PASS, MEASURED NOT ASSUMED

**Say:** Only keep a credit if it actually ran today. Delete any line that didn't, before you present.


## Slide 14

- NEW GAME+
- ANYWHERE THE ONLY THING LEFT IS THE COMPILED PROGRAM:
- RECOVER IT, PROVE IT, MAINTAIN IT AGAIN.
- First users: game preservation groups and rights holders. We only work on software we're allowed to.

**Say:** One sentence on the bigger picture, then move on. Don't overclaim.


## Slide 15

- HINTS
- “YOU COMPILED IT YOURSELVES.”
- On purpose. The real source was hidden from the agents and used only as an answer key. That's the only way to prove it's exact.
- “EMULATORS ALREADY SAVE GAMES.”
- They keep games playable. Only source lets you fix them. We just did.
- “CAN'T THE AGENTS FAKE IT?”
- They try. A linter and an independent Checker reject fakes; the count is on screen.
- “HOW FAR FROM 100%?”
- We say the exact percentage and which kinds of functions are left.

**Say:** Name the hard question first, answer in one breath each.


## Slide 16

- CONTINUE?
- GAMES DON'T HAVE TO DIE.
- 9
- [REPO LINK]   [DEMO VIDEO]   [ASI:ONE AGENTS]

**Say:** Say “Games don't have to die.” Stop. Don't add a summary.


## Slide 17

- STAFF ROLL: SOURCES
- 87% critically endangered: Video Game History Foundation and Software Preservation Network, 2023 (gamehistory.org/87percent)
- AI matching decompilation of a 2001 GBA game, and agents falsely claiming matches: gambiconf.substack.com
- Toolchain: pret agbcc, m2c (ARM, gba target), objdiff (ARM), decomp-permuter
- Target game: GBADoom (github.com/doomhack/GBADoom), prBoom port, GPLv2+, Doom shareware; Doom by id Software
- Meta Model API and Muse Spark 1.3: dev.meta.ai. Fetch.ai, Agentverse, ASI:One: docs.agentverse.ai
- SubQ: docs.subq.ai. MongoDB Atlas Vector Search: mongodb.com/docs
- Every run number: runs/*/metrics.json in our repo

**Say:** Leave this up during Q&A if there's time.
