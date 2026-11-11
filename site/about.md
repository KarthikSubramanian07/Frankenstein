# About Frankenstein: games die when their source code does

> Frankenstein is an open-source video game preservation project. AI coding agents rebuild a game's lost C
> source code from the compiled game, one function at a time, and a compiler accepts only the pieces that are
> byte-identical to the original.

## Why it exists

87% of classic US games are critically endangered (Video Game History Foundation and Software Preservation
Network, 2023). For most of them the source code is gone, and without source a game can't be fixed, ported or
studied properly. Matching decompilation, writing C that compiles back to the exact original bytes, is how
preservationists recover it today, and it takes people years per game. We wanted to know how far coding agents
could get if nothing they said was taken on trust.

## How it works

- **Dig.** Agents read the compiled game and write C, one function at a time. They see anonymous ids and machine
  code, never the original source.
- **Check.** A compiler referee rebuilds every candidate in a locked-down container. It's byte-identical or it's
  out, and an independent Checker re-runs the referee on every claim, so agents that lie get caught.
- **Learn.** Each match teaches the crew a general habit, never the answer, and a habit is kept only if it helps
  on functions it hasn't seen.

The first patient is GBADoom, Doom on the Game Boy Advance. 235 of its 568 game functions are rebuilt and
proven, 8.39% of the code by size, and with all of them spliced back into the ROM the game's SHA-1 checksum
doesn't change. The full evidence: https://tryfrankenstein.pages.dev/judges.md

## Who built it

Team Frankenstein built it in one day at the AI Engineer Code Summit hackathon at Shack15 in San Francisco, on
November 7, 2026. Four people each ran one lane of the repository: Eddy built the Lab (the referee and the ROM
rebuild), Karthik Subramanian built the Crew (the agents, the Checker and the habit library), Aidenn built the
Stage (the live show) and Enzo built the Creature (Doom in the browser emulator and the phone player).

## What is ours, and what isn't

Everything in the repository was written on the day, apart from a planning kit and an event clock we brought,
and the commit history is the record. Doom belongs to id Software, GBADoom to doomhack (GPL-2.0-or-later, used
only as the hidden answer key), devkitARM to devkitPro and mGBA to its authors. The models and platforms we built
on are Meta Muse, SubQ Snap, Fetch.ai ASI:One, MongoDB Atlas and Google Gemini. We ship no commercial ROMs.

Source: https://github.com/KarthikSubramanian07/Frankenstein (MIT licensed). Last updated 2026-11-09.
