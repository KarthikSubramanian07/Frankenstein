# Player 2 browser page

This is a small vanilla browser player using the real mGBA WASM API. No ROM or emulator binaries are bundled. The waiting screen is a loading state, not simulated gameplay. It does not emit `phone.published` or claim that a ROM is a verified recovered build.

## Prepare and run

From the repository root:

```sh
cd creature/phone
npm install --ignore-scripts
npm run prepare:core
python server.py --rom /absolute/path/to/assembled-patched.gba
```

On Windows, use a quoted Windows path for `--rom`. The `--rom` argument is optional: the page can load a `.gba` selected locally by the user. Open http://127.0.0.1:7401 and press START DEMO. Browser audio begins on that gesture. Touch controls support simultaneous buttons; keyboard controls are shown below the game.

The game must be Lane A's assembled ROM **with the shareware IWAD appended**. An engine-only `lab/out/target.gba` is insufficient for a playable Doom demo. No WAD is downloaded automatically.

## Core provenance and API

The exact dependency is `@thenick775/mgba-wasm@2.6.0-beta.5`, MPL-2.0, from [thenick775/mgba, feature/wasm](https://github.com/thenick775/mgba/tree/feature/wasm). This published-version candidate is taken from the current [gbajs3 package.json](https://github.com/thenick775/gbajs3/blob/master/gbajs3/package.json), rather than assuming upstream branch version 2.6.0 has reached npm. A registry lookup here failed with ENOTFOUND; installation still needs confirmation on a network-enabled machine. `prepare.mjs` copies the installed `dist/mgba.js` and `dist/mgba.wasm` to same-origin `core/`. Keep the generated lockfile after installation for repeatability. Do not commit `node_modules`, generated binaries or game data.

Verified API references: upstream `README.md`, `src/platform/wasm/index.html`, `src/platform/wasm/pre.js`: `mGBA({canvas})`, `FSInit`, `filePaths().gamePath`, `FS.writeFile`, `loadGame`, `toggleInput`, `buttonPress/buttonUnpress`, `pauseGame/resumeGame`, `setVolume`. The source and MPL license must accompany any later emulator binary distribution as required by that license.

The threaded core needs same-origin JS/WASM plus COOP `same-origin` and COEP `require-corp`; the supplied server sends them. Plain HTTP on a phone network address is not a secure context. Physical phone deployment requires a GitHub-coordinated HTTPS host with these headers and approval of the game-data distribution route. No LAN share or tunnel is assumed. GitHub Pages does not provide arbitrary response-header configuration; use a host that supports these headers or a verified single-threaded core.

## Current verification and remaining gate

The source can be checked with `node --check player.js`, `node --check prepare.mjs` and `python -m py_compile server.py`. Local HTTP checks should confirm isolation headers, working page assets, `/game.gba` 404 without an explicit ROM, and denial of directory/source access. No new test suite is introduced (DECISIONS scope rule).

Validation here: both JavaScript files passed `node --check`; Python passed compilation; server started on localhost:7401. HTTP probing from this shell was blocked by WinError 10013, so browser rendering and request behavior remain unverified. npm registry lookup was blocked by ENOTFOUND. WASM installation, assembled-ROM boot, iOS Safari / Android Chrome, five simultaneous phones and loading time remain real-device gates. This page reports missing core/ROM errors explicitly. API keys never enter the page. Public hosting and a published QR come after those gates; generating a QR for localhost would not make it playable on a phone.

Credits on the page distinguish today's shell from Doom (id Software), prBoom, GBADoom (doomhack), and the prior mGBA emulator.
