# Frankenstein: lost games, rebuilt and proven

> Frankenstein is a video game preservation project. AI coding agents rebuild a game's lost C source code from
> the compiled game, one function at a time, and a compiler accepts only byte-identical code. Doom (GBADoom on
> the Game Boy Advance) is the first patient.

87% of classic games are endangered (VGHF and SPN, 2023), and their source code is gone. Our agents rebuild it
from the cartridge, and a compiler checks every byte.

- Website: https://tryfrankenstein.pages.dev/
- Source code (MIT): https://github.com/KarthikSubramanian07/Frankenstein
- Agent guide: https://tryfrankenstein.pages.dev/llms.txt

## How it works: dig, check, learn

1. **Dig.** Agents read the compiled game and write C, one function at a time.
2. **Check.** A compiler rebuilds every piece. Byte-identical or it's out, and lies get caught.
3. **Learn.** Each match teaches the crew a habit, kept only if it helps on code it hasn't seen.

## Five partners, five organs

- **Meta Muse writes it.** Every line of recovered C.
- **SubQ Snap judges it.** Where each attempt goes, and what's fake.
- **Fetch.ai ASI:One lets anyone ask.** Recover a function from a chat.
- **MongoDB remembers it.** The habits and every run.
- **Google Gemini double-checks.** A second lab on every match.

## Proof: Doom, the first patient

- **235 of 568** game functions rebuilt from the cartridge and proved byte for byte.
- **8.39%** of the code by size: the small ones come first.
- **SHA-1 identical.** With all 235 put back into the ROM, the game's checksum doesn't change.
- **0 fakes accepted.** 39 lies caught and 32 fakes rejected along the way.

Source: `crew/exports/union/UNION.json`, re-verified by the referee and on a second machine (DECISIONS 14:52 and
the 16:12 freeze). The full evidence, track by track: https://tryfrankenstein.pages.dev/judges

## Play it anywhere a browser runs

The rebuilt game runs in an in-browser emulator (the mGBA core) on phones, TVs, controllers and the home
screen. A port compiled from the recovered source is next.

## Built today, and what isn't ours

Built at the AI Engineer Code Summit hackathon, Shack15, San Francisco, on November 7, 2026, after 10:45 PT.
The commit history is the record.

Built today:

- The referee, the function split and the fake linter in `lab/`
- The agent crew, the Checker and the habit library in `crew/`
- The Stage in `stage/`, and the phone player in `creature/`
- The Frankenstein Referee and Excavator agents on ASI:One
- This site; its illustrations were generated with Gemini

Not ours (credited, never claimed):

- Doom by id Software, and the Doom shareware WAD
- GBADoom by doomhack, GPL-2.0-or-later, used only as the hidden answer key
- devkitARM GCC by devkitPro, and GbaWadUtil
- mGBA, the browser emulator core
- Meta Muse, SubQ Snap, Fetch.ai (ASI:One, Agentverse), MongoDB Atlas and Gemini

Prior work we brought: the planning kit in `docs/` and the event clock `tools/hackclock.py`.

## More

- [For judges](https://tryfrankenstein.pages.dev/judges): every track, criterion by criterion
- [About](https://tryfrankenstein.pages.dev/about) · [Contact](https://tryfrankenstein.pages.dev/contact) · [Privacy](https://tryfrankenstein.pages.dev/privacy)

Doom is a trademark of id Software. Not affiliated with or endorsed by id Software, doomhack, Nintendo, or any
platform named here. Logos are trademarks of their owners, used to credit our partners.
