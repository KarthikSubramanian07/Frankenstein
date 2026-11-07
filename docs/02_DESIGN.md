# FRANKENSTEIN — Design: "Frankenstein, the game"

> **Read `DECISIONS.md` → "Corrections" first. Where it disagrees with this file, DECISIONS.md wins (clock, compiler, rebuild, variant, finale, judging).**


Open `design_system.html` to see every scene. This file is the source of truth for the Stage, the overlay captions, the phone page, the slides, and the video.

## The idea

The whole demo is one retro video game, played in scenes. Each moment of the pitch borrows the genre that fits it best, so the room always knows what's happening without reading a word:

| Scene | Genre | Shows | When |
|---|---|---|---|
| 0 Title | Game title screen | Logo, "Press start", save-file menu with the game we're recovering | Opening of the talk and the video |
| 1 Split: Play / Rebuild (home) | Game on the left, rebuild on the right | Left: Doom running live, played by a teammate or a judge, healing as its code returns, with a "NOW RUNNING ON NN% AGENT-WRITTEN CODE" badge. Right: the Hi-score panel, agents' code streaming in, verdicts landing, beams connecting each recovered function to the part of the screen it controls | Most of the live run |
| 1b Hi-score (full screen) | Arcade attract screen | % recovered, the high-score table, liars in red, the cartridge meter | Timelapse in the video, recap |
| 2 Versus | Fighting game | Digger vs Referee, health bars, the exact instruction that lied, "K.O. Claim rejected" | Every false claim |
| 3 Time trial | Retro racer | Each run is a lap, lap times falling, the library-off run as a ghost car, penalties for false claims | The results |
| 4 Ending | Title screen, cleared | File 1 at 100%, checksums identical, "It's alive", patch notes for the fix, "Player 2, press start" with the QR code | Finale |

The common thread across scenes: the same midnight background, the same pixel HUD font, the same narrator ticker, the same evidence rule.

## The Split scene (the heart of the demo)

One side plays, the other side rebuilds, and the two are visibly connected.

**Layout at 1920×1080:** left 1000 px: the game, integer-scaled 4× (960×640) on midnight, with a thin pixel frame and the badge underneath. Right 920 px: the rebuild panel. Top 60 px: the shared HUD (RECOVERED, LIES, TIME). Bottom 60 px: the narrator ticker.

**Left: PLAY**
- Doom running in mGBA, played live with a USB or Bluetooth gamepad. Hand the controller to a judge during the demo; a judge playing Doom while agents rebuild it underneath them is the most memorable moment we can create.
- Region healing: static over the parts of the screen whose code isn't back yet; the status bar with Doomguy's face is the hero region.
- **Live hot-swap (the crazy part, and it's real):** every few accepted functions, the Lab rebuilds the ROM from recovered C plus the remaining original bytes and the Creature swaps it into the running emulator through a save state, without interrupting play. The badge reads "NOW RUNNING ON 63% AGENT-WRITTEN CODE" and ticks up. Because every swap is byte-identical, the game never stutters, which is the proof.

**Right: REBUILD**
- The six newest recovered functions as Hi-score rows (inferred name in guess violet with "?").
- A code window where the current Digger's C streams in token by token, then a verdict stamp: MATCH (mint) or the mini Versus card (red) for a false claim, picture-in-picture, while the game keeps running on the left.
- The cartridge meter along the bottom of the panel.

**The connection (what makes it one demo, not two screens):** when a function is accepted, a pixel beam travels from its row on the right to the region of the game it belongs to on the left, and that region heals as the beam lands, with the coin sound. Optional heartbeat: functions that are executing right now glow in the list (see Lane D).

## Evidence rule (both prize tracks reward this)

- **Proved by the compiler** is drawn bright and solid: match %, "100%", checksums, the instruction that differs, "1 function changed".
- **Our guess** is drawn in guess violet with a question mark: function names ("JUMP ROUTINE?"), descriptions, struct names.
- Every scene that shows a name carries the key: "? = our guess. Everything else is proved."

## Palette

| Name | Hex | Role |
|---|---|---|
| Midnight | `#0B0B2E` | background for every scene except Versus and Time trial |
| Night violet | `#3E2C7A` | title glow, panels |
| Marquee yellow | `#FFD23F` | logo face, cursor, "Press start" |
| Cyan | `#3BC7FF` | table row 1, logo shadow |
| Magenta | `#FF6BD6` | table row 3, highlights |
| Alarm red | `#FF3B3B` | liars, penalties, rejected |
| Player blue | `#1D3FD1` | Digger side of Versus |
| Player red | `#D1281D` | Referee side of Versus |
| K.O. gold | `#FFE36B` | knockout text, health bars |
| Sunset | `#FF7E5F` → `#FEB47B` | Time trial sky |
| Mint | `#7CF2C8` | best lap, "identical" |
| Guess violet | `#9A9AFF` | anything inferred |

## Type

| Face | Role |
|---|---|
| Press Start 2P | HUD, tables, captions, labels, the narrator ticker. The constant across scenes |
| Jersey 10 | Title and Ending logo |
| Bungee | Hi-score logo and the big numbers |
| Russo One (italic) | Versus names and K.O. |
| Audiowide | Time trial headings and lap board |
| Pixelify Sans | Long readable lines: the narrator's spoken caption, speaker notes |
| Chakra Petch | Long documents only (build spec, README body text) |

All are on Google Fonts. Self-host copies in `stage/public/fonts/` so the Stage works offline.

Sizes at 1920×1080 on stage: HUD 28 px minimum, table rows 36 px, big numbers 160 px or more, captions 34 px. Press Start 2P is wide: keep lines under 40 characters.

## Motion and sound (one job each)

- Scene change: a 300 ms blocky pixel dissolve. Nothing else animates between scenes.
- Recovered function: its row slides into the high-score table and a short coin sound plays (Web Audio square wave, 80 ms).
- False claim: the Stage cuts to Versus, a two-frame white flash, a 200 ms screen shake, "K.O." Then back to Hi-score after 4 seconds.
- Milestones (25/50/75/100%): the announcer says "Quarter recovered!" (or similar) once.
- Title and Ending: "Press start" blinks at 1 Hz.
- Reduced motion: no flash, no shake, no blink; sounds off by default; everything else appears instantly.
- Mute everything with `m`.

## Personality

- **The announcer** (the Archivist, voiced): short arcade-announcer lines, never more than one every 8 seconds. "Round sixty-three. Fight." / "Claim rejected!" / "New lap record."
- **The narrator ticker** (written): the Archivist's dry, funny line scrolls along the bottom of Hi-score: "Another claim, another lie. Instruction four disagrees."
- **Digger** talks like a cocky player 1. **Referee** never jokes.

## Words on screen

Plain words, game grammar. Short, uppercase in the pixel HUD (that's the genre), sentence case everywhere else.

- HUD: "RECOVERED 62/84", "LIES 9", "HI-SCORE 84".
- Versus: "DIGGER", "REFEREE", "CLAIM 92%", "EXPECTED adds r0, r1, #0", "GOT adds r0, r2, #0", "K.O. CLAIM REJECTED".
- Time trial: "RUN 1", "MIN PER PIECE", "GHOST: LIBRARY OFF", "PENALTY: FALSE CLAIM", "NEW LAP RECORD".
- Ending: "FILE 1 DOOM NN%" (the true number), "ORIGINAL CHECKSUM", "REBUILT CHECKSUM", "IDENTICAL", "IT'S ALIVE", "PATCH 1.01: 1 FUNCTION CHANGED", "PLAYER 2 PRESS START".
- Never invent a number. Fixture data shows "DEMO DATA" in the corner; replay shows "REPLAY 8X".

## Do not

- No Nintendo, Pokémon, or other trademarked logos, characters, or sounds. Original pixel art only.
- No glow on body text, no gradients on UI panels (gradients only in skies and the logo).
- Don't mix more than two of the display faces on one scene.
