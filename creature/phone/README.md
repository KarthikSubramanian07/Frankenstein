# Player 2: play it anywhere

Scan the QR, press START, play Doom. The page runs the team's ROM in the real mGBA WASM core: on a phone by touch, on a laptop by keyboard, and on a TV, console browser or Steam Deck by controller. No ROM or emulator binaries are bundled. The loading screen is a loading screen, never simulated gameplay. The page does not emit `phone.published`.

## Prepare and run

From the repository root:

```sh
cd creature/phone
npm install --ignore-scripts
npm run prepare:core          # copies the mGBA core and the QR encoder into core/
python server.py --rom /absolute/path/to/assembled-patched.gba
# or, dependency-free: node serve.mjs --port 7401 --rom /absolute/path/to/assembled-patched.gba
```

Open http://127.0.0.1:7401 and press START. `--rom` is optional: without it the page says the patched ROM isn't published yet, and anyone can still load a `.gba` from their own device. The ROM must be Lane A's engine **with the shareware IWAD packaged in** (`../runtime/package_rom.py`). An engine-only `lab/out/target.gba` boots and shows GBADoom's own "No IWAD in ROM" message.

## How it plays

| Device | Input | Layout |
|---|---|---|
| Phone, landscape | Touch overlay: D-pad bottom left, FIRE / USE bottom right, STRAFE on the top corners, MAP / MENU small | The game is scaled as large as possible and the controls sit in the letterbox. The game shrinks by up to 20% to keep thumbs off it. On narrow screens the controls overlap it and lift above the 32-row status bar. |
| Phone, portrait | Same controls under the game, GBA style | A gentle "Turn sideways for the big screen." |
| Laptop | Arrows, Z fire, X use, A / S strafe, Enter, Backspace, Esc pauses | The touch overlay hides and a key legend shows. |
| TV, Xbox / PlayStation browser, Steam Deck | Gamepad API, standard mapping | Large type, focus rings, controller-only menus. The legend sits in the letterbox, or fades after 7 s. |

GBADoom's own buttons (upstream README): B fires, A uses (hold to run), L / R strafe, A + R / A + L change weapon, SELECT shows the automap, START opens the menu. Controller mapping: A or RT fires, X, B or LT uses, LB / RB strafe, the left stick moves and strafes, the right stick turns, Y changes weapon, Menu is START and View is SELECT. View + Menu together (or Home) pauses. In menus, the D-pad moves focus, A presses and B goes back. Plugging in a controller shows a toast and hides the touch overlay. Touching the screen brings the overlay back.

Touch details: every pointer is tracked on its own, so you can hold FIRE while moving, and a third finger can strafe. The D-pad reads eight 45° sectors and keeps tracking while your thumb slides, including past its edge. Touching the seam between FIRE and USE presses both. Pressed controls go opaque and vibrate for 8 ms where supported (not on iPhone). Selection, callouts, double-tap zoom, pinch, pull-to-refresh and the context menu are all suppressed on the play surface.

PRESS START does the gesture-gated work in one tap: it starts the game, resumes audio (iOS needs this), requests full screen, and then tries a landscape orientation lock. Full screen and the lock fail quietly where unsupported; iPhone Safari has neither. Add `?windowed` to the URL to skip full screen on a laptop.

## Fast first load, then offline

- The servers send gzip and an ETag. Over the wire, the core drops from 1.85 MB to 0.6 MB and the engine ROM from 1.4 MB to 0.37 MB. The page shows real byte progress for both.
- The pinned core is cached for a day. The page and the ROM always revalidate with a cheap 304, so a newly published patched ROM is never stale.
- `sw.js` makes the page an installable PWA (`manifest.webmanifest`: fullscreen, landscape) that plays offline after the first load. It registers only after the first downloads, so it fills its cache from the HTTP cache and nothing downloads twice. Cached responses keep the server's COOP/COEP headers, so the page stays cross-origin isolated offline (checked in Chromium). The ROM is network-first, so a newer ROM always wins when online.

## Honest labels

- Without evidence the page says "Doom in a browser emulator (mGBA core). This page doesn't vouch for how the ROM was built."
- With `--report build.json`, the page says "This is the rebuilt game running in a browser emulator (mGBA core). X% of its game code was written by our agents and proven byte for byte." The report must be a real `build.rom` payload (`identical: true`, `pct_agent_code`, not a fixture), and its `rom_sha1` must be the served ROM. For a packaged ROM, pass `--engine engine.gba` instead: its SHA-1 must equal the report's `rom_sha1`, and the package must pass `package_rom.validate_package` (Python host; `serve.mjs` runs the same engine-preservation check). Anything else and the server refuses to start. It is never called a native port.
- "Play it your way" (in the pause sheet) offers "Download the ROM" for RetroArch or a flash cart **only** when a ROM is served and [DISTRIBUTION.md](DISTRIBUTION.md) reads `Status: approved`. Today it says "Download coming after the license check". The same panel shows a QR code of the page, for handing off to another device.

## Core provenance and API

`@thenick775/mgba-wasm@2.6.0-beta.5` (MPL-2.0, [source](https://github.com/thenick775/mgba/tree/feature/wasm)) and `qrcode-generator@2.0.4` (MIT) are pinned in `package-lock.json`. `prepare.mjs` copies them to same-origin `core/`. Don't commit `node_modules`, `core/` or game data. The page uses `mGBA({canvas, wasmBinary})`, `FSInit`, `filePaths().gamePath`, `FS.writeFile`, `loadGame`, `toggleInput`, `buttonPress/buttonUnpress`, `pauseGame/resumeGame` and `setVolume`.

The threaded core needs COOP `same-origin` and COEP `require-corp`, which both servers send on every response (including 304s). Plain HTTP on a LAN address is not a secure context, so phones need an HTTPS host that can set these headers. GitHub Pages can't. Hosting and game-data distribution are team decisions; no tunnel is assumed.

## Verification (2026-11-07)

Verified with Playwright mobile emulation on this Mac, using a local Node and Python host:

- **Devices:** iPhone 15 portrait and landscape (WebKit), and Pixel 7 landscape and portrait (Chromium).
- **States:** every state was captured.
- **Touch input:** checked end to end through the real mGBA core with a 656-byte input-probe GBA ROM (scratchpad only, not committed). The ROM lights one box per GBA button, and screenshots are read back pixel by pixel. That covered 44 checks: diagonals, sliding, FIRE while moving, three fingers, the FIRE / USE seam, START, SELECT and R. Chromium used real CDP multi-touch; WebKit used dispatched pointer events.
- **Geometry:** no control covers the status-bar rows on any of the four devices.
- **TV and desktop:** at 1920x1080 and 1280x720, keyboard-only and controller-only play were checked, with a stubbed `navigator.getGamepads`.
- **PWA:** `Page.getInstallabilityErrors` is empty. After an offline reload the page is still controlled by the service worker and still cross-origin isolated, and it plays.

Earlier, the real 5,704,780-byte package booted to gameplay ([BOOT.md](../runtime/BOOT.md)). There was no packaged playable ROM on this Mac (GbaWadUtil is Windows-only), so Doom gameplay itself was not re-run here.

Still to check on real hardware:

- iOS Safari and Android Chrome on physical phones: audio unlock, haptics, the notch safe areas and five phones at once.
- The Xbox, PlayStation and smart-TV browsers. Some don't count a controller press as a user gesture, so sound may wait for the first touch or key.
- WebKit's service worker offline path, which was checked only in Chromium.
