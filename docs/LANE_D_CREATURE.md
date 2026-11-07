# LANE D — The Creature (Game, Overlay, Phones, Video)

> **Read `DECISIONS.md` → "Corrections" first. Where it disagrees with this file, DECISIONS.md wins (clock, compiler, rebuild, variant, finale, judging).**


Paste everything below the line into Claude Code as your first message, from the repo root.

---

You are the game and showtime engineer on FRANKENSTEIN. Agents rebuild a GBA game's lost source; your job is the body: the game on the projector that visibly heals as its code is recovered, the bug fix that proves recovered source is alive, the phones in the audience's hands, and the recording of the demo video. Run `git pull --rebase` first: the foundation (tag `v0-foundation`, made by `docs/LANE_0_BOOTSTRAP.md`) already has the folders, contracts, schemas, and fixtures. Read `docs/00_START_HERE.md`, `contracts/CONTRACTS.md`, and `docs/02_DESIGN.md` first. You own `creature/` only.

Until Lane A's target ROM and `viz_map.json` exist (~11:00 and ~13:15), develop against the public build of GBADoom (https://github.com/doomhack/GBADoom, built with the shareware IWAD per its README; keep ROMs out of git) and a hand-written mock `viz_map`. Never wait.

## Part 1 — The sprite tap (mGBA + Lua) — by 12:00

- Read mGBA's current scripting docs (https://mgba.io/docs/scripting.html): `callbacks:add("frame", …)`, memory domains, reading OAM, and the socket API.
- `creature/tap/oam_tap.lua`: on every frame (or every 2nd frame if needed), read the 128 OAM entries, decode x, y, shape/size → w/h, tile index, palette, hidden flag; send one compact JSON line over a TCP socket to `127.0.0.1:7300`.
- `creature/bridge/` (Python, asyncio): accepts the Lua socket, enriches each sprite with `subsystem` using a tile-range map you build empirically (`creature/tile_map.json`: play the game, log which tile indices the ship, rocks, bullets, enemies, and HUD use), computes `heal` from `runs/live/events.jsonl` + `lab/out/viz_map.json`, and serves contract sprite frames on ws://127.0.0.1:7301.
- Tooling: `creature/tap/record_tiles.lua` to help build the tile map in 10 minutes.

## Part 2 — The heal overlay — by 14:00

Doom draws its whole frame itself (no hardware sprites for the 3D view), so heal by **screen region** from `viz_map.json`: the bottom 32 px status bar (Doomguy's face, ammo, health) heals with the `hud` subsystem; the weapon area with `weapons`; the 3D view's static fades with `world` and `enemies`. Doomguy's face snapping clean is the hero shot. The per-sprite approach below still applies to any game that uses hardware sprites (fallbacks).


A transparent full-window page (`creature/overlay/`, served on 7302) drawn exactly over the mGBA game window in OBS.
- Unhealed sprites: crawling static and RGB-offset glitch inside the sprite's box, intensity = 1 − heal of its subsystem. Healed sprites: nothing drawn (the clean game shows through).
- When a subsystem crosses 100%, a single bright pixel-dissolve sweep across its sprites (plus the coin sound from the Stage), then calm.
- Background layers (BG0–BG3): optional whole-screen film-scratch layer whose opacity falls with overall % recovered. This is also the fallback if per-sprite mapping isn't reliable by 14:00.
- Scale-correct for any window size (GBA is 240×160; integer scaling preferred).
- Honest note to put in `DECISIONS.md` and say if asked: the overlay uses the hidden answer key's file grouping (`viz_map.json`) only to know which sprites belong to which code; the agents never see it.

## Part 2b — Play / Rebuild: the live side-by-side — by 14:00

This is the demo's centerpiece (see the Split section of `docs/02_DESIGN.md`).
- **Live play:** mGBA with a USB or Bluetooth gamepad mapped and tested; a second pad as backup. Rehearse handing the controller to a judge.
- **Live hot-swap:** whenever Lane A's `rebuild` produces a new ROM (they emit `build.rom`), save state in the running mGBA, load the new ROM, load the state, all from your Lua script or the bridge, so play continues uninterrupted. Verify the swapped ROM's SHA-1 equals the original before swapping; refuse otherwise. Emit `rom.swapped` with `pct_agent_code` (code bytes from recovered C ÷ game code bytes) and the SHA-1. If a swap ever stutters visibly, swap only during menus or deaths.
- **Heartbeat (stretch, after everything else works):** show which functions are executing right now. Check the current mGBA scripting docs for CPU register access; if the program counter can be sampled, sample it each frame (and more often if the API allows), map addresses to `fn_` ids with the manifest, and send `heartbeat` messages to the Stage. If it can't, skip it; never fake it.
- **The bug, live:** in the finale, the player triggers the bug on the left; the patched ROM is hot-swapped in; the player repeats the action and the bug is gone, without restarting the game.

## Part 3 — OBS (the projector and the video) — by 14:30

- Scene collection `creature/obs/frankenstein.json` with scenes: Title (Stage scene 0), **Split** (mGBA window capture integer-scaled 4× at x=20,y=100 + your heal overlay on it + Stage `/?scene=split` full-screen on top; this is the main demo scene), Game (full-screen game + overlay), Hi-score (Stage 1b), Versus (Stage 2), Time trial (Stage 3), Ending (Stage 4), Phones (camera or a phone capture if you have one).
- Hotkeys for every scene. A fullscreen projector output. A recording profile: 1920×1080, 60 fps, high-quality local recording.
- A 300 ms pixel-dissolve transition between scenes, and a two-frame white flash used only for K.O. and "It's alive".

## Part 4 — The bug fix (the finale) — decided by 13:00, patched by 14:45

The line we want to say: "This game shipped with a bug its creator never patched. We just did."
- Find a real bug in the target game. The famous vanilla "ouch face" bug is already fixed in GBADoom (`source/st_stuff.c` lines 149 and 205 keep the vanilla line commented out above the fix), and "demo compatibility is broken" is not a 6-second visible bug in one function. Look for a vanilla bug GBADoom kept, inside a function Lane B can recover. Pick something visible in 6 seconds of play. Reproduce it in the original build and record a clip of it happening.
- Identify the responsible function's `fn_` id. Work with Lane B so that function is recovered and accepted (priority in the live or learning run).
- Write the minimal fix as a change to the **recovered** source (`runs/live/recovered/<fn>.c`), not the hidden original. Save it as `creature/fix/<fn>.fixed.c` with a 3-line explanation.
- Run `python -m lab.referee patch --fn <fn> --src creature/fix/<fn>.fixed.c --json`. It must report exactly one changed function. Emit a `patch.verified` event into the live run.
- Record the after clip: same input, bug gone.
- If no real bug can be confirmed by 13:00, do an honest, visible modification instead (for example, a new ship palette or a speed tweak) and change the pitch line to "it can change again." Tell the pitch lead in the team channel.

## Part 5 — Phones in the room — by 15:00

- `creature/phone/`: a static page that boots the mGBA WASM core (build from source or use the core from https://github.com/thenick775/gbajs3; check its license, MPL-2.0 for the mGBA core) and loads `lab/out/patched.gba` with on-screen touch controls, nothing else. Wrap it in the Ending scene's look ("PLAYER 2", midnight, Jersey 10 logo, Press Start 2P), per `02_DESIGN.md`.
- Serve with the headers the WASM build needs for threads (`Cross-Origin-Opener-Policy: same-origin`, `Cross-Origin-Embedder-Policy: require-corp`), or use a single-threaded build if headers are a problem.
- Expose it with a `cloudflared` quick tunnel (or the hotspot's local IP). Generate a QR PNG; emit `phone.published` with the URL and QR path.
- Test on iOS Safari and Android Chrome, with 5 phones at once over the hotspot. Keep the ROM small and cache it.
- Credits: id Software (Doom), the prBoom authors, and doomhack (GBADoom) on the phone page and the video end card. The phone build uses the shareware IWAD only.

## Part 6 — Screenshots for naming (helps Lane B, optional)

Every 3 seconds during the live run, save a screenshot to `creature/shots/<frame>.png` with the OAM snapshot beside it, so the Archivist can name functions from what they draw using Muse Spark's image input.

## Priority note

At 13:30, if Lane A's ASI:One agent isn't answering end to end, pause Part 5 and pair with Lane A. The Fetch.ai prize ($2,500 1st, $2,500 2nd) requires it; the phone page is only a nice finale.

## Part 7 — The demo video — record at freeze

You own recording; Lane C owns the Stage screens and director timing. Follow the shot list in `00_START_HERE.md` section 12.
- Open on the heal moment: a glitching sprite snapping clean with the lightning frame. That first 3 seconds decides whether people keep watching.
- Captions burned in (big, high contrast, in the design's caption style). Assume it's watched muted.
- Include Lane A's 40-second ASI:One capture, cut to ~10 seconds (verify → card with observed vs inferred).
- Every sped-up segment labeled with its real speed. Every number on screen comes from real files.
- 60 seconds, the length the submission form asks for. End on the "Built today / Not ours" card (README panel). Export 1080p H.264 under 100 MB, no vertical cut. Copy it to a second laptop and a USB stick.

## Tests

- Bridge: replaying a recorded tap log yields the same sprite frames.
- Heal math equals a recomputation from `events.jsonl` + `viz_map.json`.
- Overlay holds 60 fps with 64 sprites glitching.
- Patch: `changed_functions` has exactly one id; patched ROM boots in desktop mGBA and the phone page.
- Phone page loads in under 5 seconds on the hotspot.

## Hand-offs

- 12:00: tap + bridge streaming real sprites from the release ROM. Post a short screen recording.
- 13:15: switch to Lane A's real ROM and viz_map.
- 14:30: OBS scenes ready; golden path dry run #1.
- 13:00: bug confirmed, or the honest fallback announced.
- 14:45: fix verified through `lab patch` (exactly one function changed).
- 15:00: QR works on five phones.
- Freeze − 60: demo video exported.

## Rules

Follow `docs/00_START_HERE.md` section 15. Never show a fix that wasn't verified by the referee. Never claim the phone version is a "native port"; it is the patched game, built from recovered source, running in a browser emulator. Start now; do not ask whether to begin.
