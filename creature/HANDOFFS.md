# Lane D handoffs

Latest pre-push follow-up: aggregate 225/568, 7.54% bytes; received A's separate 179-function/5.34% identical rebuild report and validated it against the local package. :7416 restarted with that verified report (UI rounds to 5.3%); :7417 stays unlabelled as an identical rebuild. B now reachable, direct readiness request 51ae0b5b pending. See DEMO_READINESS.md.

## Native continuation / responses to A and C, 15:44 Pacific

- Native Murmur **indulgent-attic** works, broadcast **f791fd09** delivered; actual A/C READY replies recorded in `DEMO_READINESS.md`.
- **A:** god_200 engine/delta dcac800 received and independently hash/delta checked. Windows package SHA-1 matches **5d43443779b97dfe1bcec8205f51ec11ce30a787**, no GUS. Please provide the final frozen union rebuild report; no current union build label is inferred from counts alone. Local game control remains paused, so A's screenshots are upstream runtime evidence only.
- **C:** launch ownership received in d8c7c46. Restored `--stage` after 0ce5df0 removed it, preserving `/controls.js`; regression test passed. Built Stage, started :7416 original, :7417 modified, :7201/:7202 data with explicit origins. 24 HTTP checks pass; `/road` now works and `live:null` is explicit. Geometry/routes received.
- **B:** exact live run, jobs ownership and billing readiness still requested. Current exported tallies reproduce 179/568, 5.34% bytes, 24 lies / 31 fakes rejected / 0 accepted, across 35 finished runs. Please send the 16:00 freeze and rebuild report.
- **Pokemon: QUEUED AFTER DOOM**, specifically integrated visual rehearsal and phone/recording proof. No GB runtime support claimed.

## Controllers: pick your device, see the mapping, remap it (for Enzo)

Player 2 has a **Controller** chip under PRESS START and in the pause sheet. It opens How you'll play: a device picker (Xbox-, PlayStation- and Nintendo-style, 8BitDo, Steam Deck, generic, keyboard, touch), auto-detected from Gamepad API vendor ids, and a drawn controller map labelled with Doom actions, unmapped controls included. Remapping works by CHANGE, then a button, key or touch slot within 5 s, with swaps reported. Profiles are saved per device, with a reset and a Nintendo A/B swap. The overlay, legend and start hint follow whichever input was used last. The new module is `phone/controls.js`; it was added to both servers, `sw.js` and `bundle.py` (asset list and judging service worker shell). It was checked with Playwright: stubbed Xbox, PS and Switch ids, a remap verified through the probe ROM, persistence, keyboard, touch, iPad and TV. See [phone/README.md](phone/README.md). With your doom_r12 `build.rom`, start the server with `--report` (and `--engine` for the package), and the page will say "rebuilt from recovered code" with the real 0.36%. Not yet tried on real controllers or console browsers.

## Current Lane D checkpoint from this session

Source/proof checkpoints 54dca9e and 3aec71c are on main. The static-face playable package boots in the current player; movement, turn, fire and face expressions at full health were observed. Restore preflight and the static phone deployment bundle are implemented and checked. STATUS.md is the current evidence ledger.

- **Rebuild report now available:** the new doom_r12 export contains a real build.rom (seq606, six functions, 0.36%, identical engine). D verified all nine canonical export hashes and both actual package chains. Verbatim payload/source evidence is in runtime/evidence/doom-r12-build*.json. The old 28-function report is optional for that separate headline; it is no longer blocking file verification. State compatibility and an observed runtime swap remain open.
- **C:** the direct player works, but its Stage iframe showed refused-to-connect in the in-app browser despite isolation headers. A temporary HTML CORP same-site probe did not help; no speculative header change committed. Separate OBS capture remains the alternative, needing an actual capture test.
- **Murmur:** a real message from Eddy's machine was received; active Lane A peers are visible. Our outbound send failed explicitly in Git credential-manager. Global registration is protected. Use the team-pinned docs/murmur files; D needs a normal-terminal stop/join to finish outgoing integration.
- **Latest Stage:** pulled and rebuilt 1075572 (one main log screen plus ending card); Vite and TypeScript checks pass. Default/obs URL is 5173; space toggles card and C shows credits. Older scenes need legacy=1. Data 7201/7202 shows real exports; live:null.
- **Still open:** actual rebuild report → production preflight → observed runtime swap; original controlled 30-second active play; physical phones and public HTTPS/QR; OBS/60-second recording. No recovered-face, swap or public-phone success claimed.

## Active assignment from Enzo: implement Pokémon player/adapter support

Read [docs/POKEMON_IMPLEMENTATION.md](../docs/POKEMON_IMPLEMENTATION.md). Next checkpoint: game/core registry and selection, confirmed Game Boy loading support, editable input-profile path and real transition telemetry contract. Preserve working Doom. Report STARTED / QUEUED AFTER DOOM (specific gate) / BLOCKED (exact input). Source/behavior recovery stays distinct from original-code playback.

## Play anywhere: the phone page became the universal player (for Enzo, 2026-11-07)

`creature/phone/` now plays on a phone (an on-screen touch overlay, landscape-first), a laptop (keyboard with a legend), a TV, an Xbox or PlayStation browser, or a Steam Deck (Gamepad API, controller-only menus). It installs as a PWA (fullscreen, landscape) and plays offline after the first load while keeping COOP/COEP. The servers add gzip and ETag revalidation, plus a `/status.json` endpoint. Details, mappings and verification are in [phone/README.md](phone/README.md).

- **Honest label:** "This is the rebuilt game … X% … proven byte for byte" appears only when you start a server with `--report` holding a real, byte-identical `build.rom` report that matches the served ROM. For a packaged ROM, add `--engine` (the report's engine, checked with `package_rom.validate_package`). Otherwise the server refuses to start.
- **Download:** "Download the ROM" stays hidden until [phone/DISTRIBUTION.md](phone/DISTRIBUTION.md) says `Status: approved`. That file lists the open questions: the shareware WAD terms, the GPLv2 source offer (`lab/out/NOTICE.md`), and no commercial content. The pause sheet also shows a QR code of the page, for handing off to another device.
- **Verified:** with Playwright on an iPhone 15 (portrait and landscape), a Pixel 7 (portrait and landscape), and 1920x1080 and 1280x720 screens, using an input-probe ROM through the real core and stubbed gamepads.
- **Still needs you:** a physical-phone test on iOS Safari and Android Chrome, a test on a console browser, and a run with the packaged playable ROM. GbaWadUtil is Windows-only, so there was no WAD-packaged ROM on the Mac this was built on.

## New follow-on target from Enzo: Pokémon Red

After a good Doom demo, add a bounded Pokémon Red opening slice: landing/title menu plus first Pokémon interactions. Show a real geographic map with attached interaction branches beside gameplay, with visited/validated/code-verified progress kept distinct. See [POKEMON_RED_PLAN.md](POKEMON_RED_PLAN.md) and [issue #4](https://github.com/KarthikSubramanian07/Frankenstein/issues/4). A/B task briefs and direct requests were added to their folders at Enzo's instruction.

Latest upstream received: Stage sponsor judgment rail and clearer Versus evidence; run.started.library_backend; Atlas library updates; Crew says the large face function is out of reach today. Finish Doom's smaller-HUD/phone proof before starting Pokémon runtime work. A's Game Boy architecture/rights feasibility questions remain explicit planning gates.

## Product direction from Enzo: QR-first portable play

Judges scan a real QR and immediately play on their phones. Doom is today's supported demonstration; the north star is selecting an old game and adapting it to another device/interface. Explore (1) a genuinely local model proposing fully human-editable control mappings and (2) generated visual continuation into extra display area. Phone play is a demo requirement. These adaptation experiments are not yet implemented. Read [EXPERIENCE_IDEA.md](EXPERIENCE_IDEA.md) and respond through [issue #3](https://github.com/KarthikSubramanian07/Frankenstein/issues/3).

Owner: Enzo. Latest coordination protocol in CLAUDE.md received: check main and other lanes' handoffs at least every10 minutes during active work, publish checkpoints at least every20 minutes. Connector commits are serialized while shell Git is unavailable. See STATUS.md and runtime/BOOT.md for current proof.

## From B: Play to recover and eyes ran on Karthik's Mac (15:21, `crew/exports/doom_play01`)

No Lane D code was changed. Your tap, bridge, director adapter and `package_rom.validate_package` ran as committed. Commands, event lines and gaps are in `docs/DEMO_SCRIPT.md` ("Play to recover and Snap's eyes on Karthik's Mac").

- **Packaging on macOS:** `tools/package_rom_native.py` packages with GbaWadUtil built from the public GBADoom source (`tools/mgba_headless/build.sh`). Your pinned-.exe hash check is untouched. The original package `e1ddb8fb…` and the static-face package `337fbb15…` come out byte-identical to yours. god_200 is `5d43443779b97dfe1bcec8205f51ec11ce30a787`.
- **Tap without a window:** `tools/mgba_headless/frank_mgba` runs libmgba 0.10.5 with the same Lua API as Tools > Scripting. `oam_tap.lua` connected to the bridge on :7300. Its screenshots and PC samples fed `director_adapter --forward` into a live `--director` run. Mapping: 678 of 704 samples resolved to 37 game functions. The desktop mGBA app (0.10.5, Lua 5.4.7, socket API present) also booted the ROM to its title screen. Loading the script through its menus was not done, because UI automation on a laptop in use is unsafe.
- **For the finale:** god_200 shows a clear change about 1 s after the D-pad cheat (Up Up Down Down Left Left Right Right). Health reads 200% and the change covers 115 pixels, all in the health digits. Snap's eyes: 0.994 changed and 0.994 to 0.996 otherwise the same. With identical inputs, hud_shift shows no status-bar change during play, and instant_raise differs for only about 0.4 s.

## Responses to A

1. **Boot the private variant:** passed basic browser checks. Packaged engine SHA-1 d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2 with the pinned upstream utility/shareware WAD. Package5,704,780 bytes; SHA-1 e1ddb8fb96764422d5fb6b1c84c83b85c98236bd. Title, New Game, episode/skill menus, in-level rendering and forward movement were visually observed. A continuous 30-second active play test is still pending.
2. **Static-face delivery:** received lab/demo/README.md, build script and current face fn_0801B298. Other ids received: ticker fn_0801B728, drawer fn_0801B7FC. Binary and full patch report now received in9a45076: lab/out/static_face.gba and lab/demo/static_face_report.json. Runtime flicker/restore testing remains pending.
3. **Packaging/save states:** received A's instructions. D's runtime/package_rom.py now validates the full packaged file, preserved engine bytes and processed WAD. prepare_swap.py independently checks engine/package/proof chains and identical WAD payload before referee gates; actual save-state swap remains unverified.
4. **Distribution:** no public ROM URL/QR emitted. Localhost browser only. Karthik's distribution decision remains required before hosting processed WAD publicly.

## Responses to B

1. **Real export:** received doom_r01 and verified all31 exported file hashes plus manifest/target identity. runtime/sync_inputs.mjs makes that repeatable from a pinned commit. This verifies export consistency, not an independent referee rerun.
2. **Telemetry:** bridge/director_adapter.py targets the real crew.run --director endpoint :7112/heartbeat. It forwards only fresh observed ids and optional screenshot bytes; inspect-only by default. Local bridge/Lua end-to-end still needs the connected demo host.
3. **Heartbeat aging/lifecycle:** B's handoff says stale samples now expire after12s and intake port closes when run ends; received.
4. **Eyes:** received crew.eyes command. Will use on real before/after frames; no synthesized visual judgment is claimed.
5. **Face recovery/finale:** face attempt status received (early attempts far off); keep the smaller-HUD fallback under consideration. Static-face display stub alone must not be presented as recovered source.

## Responses to C

1. Routes and exact Split x20/y92,960x640 received from stage/HANDOFF_D.md. OBS instructions updated.
2. Actual ending credits scene is primary; standalone D endcard is fallback. Badge must remain original code until a real rom.swapped.
3. No phone.published event or fake QR supplied. Public/physical phone play is not yet verified.

## Requests from D

- **A static-face artifact request resolved:** engine binary and full report received in9a45076. D has read lab/INTEGRATION_CREATURE.md and queues restore-mode proof, baseline validation, consistent WAD/music settings and target/static playtests. No runtime restore/recovery success claimed.
- **To A+B:** propose one already accepted recovered Thumb-ROM function for a visible single-function modification that fits its original byte span. We select the honest modification finale, not a claim about an unconfirmed original bug. Candidate/patch still unverified.
- **To C / product launcher owner:** Node player alternative is now committed as creature/phone/serve.mjs; accepts --port and --rom, binds localhost with isolation headers. Existing Python host remains supported. Current browser validation used port7411 because the shell's7401 listener was stalled; this is a local test override, no shared-port contract change.

## Current blocker / next action

Connected Windows environment became unavailable during desktop ROM-open action. No current desktop boot or Lua success is claimed. Resume host connection, package static-face engine, verify flicker vs normal face, run real telemetry through the bridge/Director, then test a verified source rebuild/swap. Browser boot evidence was saved locally as creature/shots/browser-boot.jpg before disconnection. Runtime/vendor, generated packages and core binaries stay ignored.

## Requests from the demo director (13:15, see `docs/DEMO_SCRIPT.md`)

1. **Doom on the demo laptop (blocker).** Karthik's Mac runs the referee and the Stage but has no playable ROM, no mGBA, no OBS and no wine (GbaWadUtil is a Windows exe). Hand the two playable packages (static face, and restored) to the demo laptop out of band (USB, never git), or package them in Docker on the Mac, and write their SHA-1s in `creature/STATUS.md`. Then `FRANK_PHONE_ROM=<static-face playable .gba> make up`.
2. **The phone URL.** HTTPS with COOP and COEP and no tunnel: a Cloudflare Pages deploy with a `_headers` file is the simplest. The ROM's licence decision is Karthik's (`lab/HANDOFFS.md`, response 6); prepare the deploy, publish only after he decides. Then append `phone.published {url, qr_png}`.
3. **Run the phone checklist** in `docs/DEMO_SCRIPT.md` (iOS Safari, Android Chrome, 5 phones on venue Wi-Fi, under 10 s to title) and log each with time and device in `STATUS.md`. Emulated Chrome and WebKit on localhost passed (ready in 0.65 to 1.75 s, isolated, engine boots).
4. **Snap's eyes frames.** Once Lane A picks the patch, capture before and after PNGs from the browser player at the same game moment and run `python -m crew.eyes before.png after.png --claim "…" --run runs/live --fn <fn>`.
5. **Optional local Play-to-recover:** `?director=http://127.0.0.1:7112` makes the player post a 240×160 PNG to `/heartbeat` every 3 s during a live run (laptop only, nothing public).
