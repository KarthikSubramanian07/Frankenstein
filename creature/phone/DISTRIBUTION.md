# ROM distribution

Status: not approved

The player page shows a "Download the ROM" button only when a ROM is being served **and** the line above reads exactly `Status: approved`. Both servers read this file at request time. Until then the page says "Download coming after the license check." Playing in the browser is a separate question from handing people a file to keep.

Changing the status is a team decision, recorded in `DECISIONS.md` with who approved it and why. Answer every question below first.

## Open license questions

1. **The Doom shareware WAD.** The playable ROM carries id Software's shareware `doom1.wad` (episode one), converted by GbaWadUtil. The shareware terms allowed copying the unmodified shareware package. Does a converted WAD inside a ROM, offered as a download, still count? Who at the team confirmed it, and against which text of the licence?
2. **GPLv2 source offer.** The engine is our build of GBADoom (doomhack/GBADoom, GPL-2.0-or-later). Anyone who receives the binary must get the corresponding source, or a written offer for it. `lab/out/NOTICE.md` says Lane A publishes `variant.patch` against doomhack/GBADoom@7763f5f after judging, and on request before then. A download button needs that source (or the offer) linked right beside it, at the same moment.
3. **The emulator is not in the download.** The mGBA core (MPL-2.0) runs only in the browser, and its source is linked from the page. RetroArch and flash-cart users bring their own emulator or hardware.
4. **No commercial content, ever.** We never host retail Doom, Ultimate Doom, Doom II or any other commercial WAD or ROM. The download is the shareware episode only. A ROM rebuilt from any other WAD is not distributable here.
5. **What the label may say.** The download inherits the page's honesty rules: "rebuilt" and the agent-written percentage appear only when the server was given a real, byte-identical rebuild report that matches the served ROM. It is never called a native port.

## When approved

Run a server with `--rom` pointing at the approved, packaged ROM, and change the status line in the same commit as the `DECISIONS.md` entry. The button appears for every visitor straight away. To withdraw it, change the line back.
