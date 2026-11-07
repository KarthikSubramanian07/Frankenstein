# Real browser boot: 2026-11-07

The private variant engine has booted in the browser mGBA core. The title screen, New Game menu, episode selection, skill selection and episode-one game rendering were visually checked. Holding the on-screen Up control for 600 ms moved the player forward. This verifies a basic browser boot and input path, not full game correctness, recovery, a swap, desktop Lua, or physical-phone compatibility.

## Exact inputs

| Input | Identity |
|---|---|
| Engine SHA-1 | `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2` |
| Upstream utility + shareware WAD | `doomhack/GBADoom@7763f5f9adf18f83a59093bc1ab786fe2c36591f` |
| Shareware input WAD SHA-1 | `5b2e249b9c5133ec987b3ea77596381dc0d6bc1d` |
| Playable package SHA-1 | `e1ddb8fb96764422d5fb6b1c84c83b85c98236bd` |
| Playable bytes | 5,704,780 |
| Browser core | `@thenick775/mgba-wasm@2.6.0-beta.5`, npm tarball SHA-512 verified |

The converter preserved all engine bytes except the expected IWAD metadata, added format-15 processed shareware data, and passed WAD bounds/marker checks. The package is still the original private variant; it has not been rebuilt from the recovered C. No `rom.swapped`, `patch.verified`, or `phone.published` success was emitted.

## Reproduce locally on Windows

From the repository root, first obtain a matching engine and real exported run. The importer verifies the manifest, engine and every export file before writing a `VERIFIED.json` marker:

```sh
node creature/runtime/sync_inputs.mjs --commit 33b8a016705328c9d97027e9fc5a4e8459e7c08f --run doom_r01 --out creature/runtime/generated/inputs-demo
node creature/runtime/prepare_vendor.mjs
python creature/runtime/package_rom.py --engine creature/runtime/generated/inputs-demo/target.gba --expected-engine-sha1 d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2 --wad creature/runtime/vendor/GBADoom-7763f5f/GbaWadUtil/doom1.wad --utility creature/runtime/vendor/GBADoom-7763f5f/GbaWadUtil/GbaWadUtil.exe --out creature/runtime/generated/doom-variant-playable.gba
```

`prepare_vendor.mjs` verifies all 11 upstream files against pinned Git blob identities. Its binary dependencies and the WAD remain in ignored `vendor/`. The packager invokes the upstream executable without a shell and validates the output; a raw WAD append is not valid. Omit optional GUS music-bank setup for this initial boot.

Then prepare the phone core using the instructions in `../phone/README.md`, and serve the assembled game:

```sh
node creature/phone/serve.mjs --port 7411 --rom creature/runtime/generated/doom-variant-playable.gba
```

Open `http://127.0.0.1:7411/`, choose START DEMO, then the on-screen START and A controls to enter a game. Deliberate pointer presses were used; brief automation clicks can occur between emulator input polls. This server binds localhost only and supplies COOP/COEP headers. It is not a public phone URL or a distribution approval.

## Remaining demo gate

Lane A still needs to supply the current static-face stub and its activation/build instructions. We can now test it against a known-working browser/package path. A verified recovered-function rebuild, matching package proof and real observed swap are still required before claiming the game is running on agent-written code.
