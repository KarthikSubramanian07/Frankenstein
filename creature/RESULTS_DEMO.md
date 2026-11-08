# The demo: choose Doom, scan, play

**EVENT HARD RULE FROM ENZO: ALL AGENTS STOP at 16:58 Pacific on 2026-11-07. No edits, commits or pushes after that deadline, anywhere in this repo. Supersedes the earlier 16:59 cutoff. Murmur broadcast 302f6c01.**

Enzo's explicit direction, 2026-11-07. This is the primary demo experience and supersedes the previous log-first presentation. Canonical implementation brief for every lane.

## User journey

1. **Computer: choose a game.** A clean game picker opens with **Doom selected**. Only runnable titles are selectable. One clear action: **Play on your phone**.
2. **Computer: scan.** Selecting Doom reveals a large, real QR code and readable URL. The encoded HTTPS URL opens the selected Doom player directly. Never encode localhost, an invented URL, a file path or a placeholder. The computer keeps the QR visible while the phone plays.
3. **Phone: load Doom.** Show **Doom is loading** with real asset/core readiness. No development instructions or recovery logs interrupt this flow. If the browser needs a gesture for audio, one **Play Doom** tap is allowed after readiness.
4. **Phone: controls arrive.** Immediately before gameplay, a short, sleek animation shows a simplified grey Game Boy Advance, including D-pad, A/B, shoulders, Start and Select. Those control groups move into their actual on-screen thumb-control positions. The shell disappears; the controls remain. This is an interface animation, not generated gameplay.
5. **Phone: play.** Run the actual verified Doom package through the existing mGBA core, with usable move/turn, fire, use, strafe, menu and map inputs. The flow must reach actual gameplay; retain menu/select usability if automatic new-game entry is not verified. Never present a title screen as proof that gameplay works.

## Visual and interaction contract

- Restrained graphite/grey UI, pale text and one small accent; large readable Doom title, generous spacing. No sponsor wall, log panel or technical settings in the primary path.
- The handheld-to-phone transition lasts roughly 1.5–2.2 seconds. Reduced motion skips the travel. Rotation/resizing must settle controls to their new actual positions; no invisible overlay may trap input.
- Touch input supports simultaneous movement and fire, releases on pointer cancel/blur, avoids covering the health HUD, and respects safe areas. Portrait works; landscape is suggested, never a blocking instruction.
- Errors are real and recoverable: failed assets, unsupported isolation or absent ROM show a concise retry state. Progress is derived from downloads/readiness, never a fake timer.
- Keep credits and honest build evidence in a secondary sheet. A verified build claim must use the report for the actual served package. Current aggregate recovery and a rebuilt snapshot are different facts.

## Owners / no duplicate edits

| Owner | Deliverable | Files / interface |
|---|---|---|
| D / indulgent-attic | Phone loading → animation → actual Doom; packaging; integration and end-to-end check | `creature/phone/`, this spec, runtime evidence. Player URL contract: `/?game=doom&demo=1`. Unsupported `game` values fail clearly. Existing default player remains supported. |
| D delegated animation worker | Handheld/control morph only | New `creature/phone/arrival.js` and `arrival.css`, integrated by D. |
| C / one nominated C session | Computer game picker → QR; clean results presentation | `stage/`; accepts explicit phone HTTPS URL, preserves query `game=doom&demo=1`. Ask D before changing phone files. |
| B / coherent-vest | Hosting/deploy owner, real HTTPS URL, phone reachability and headers | Existing team deployment path. Prepare exact command/config and report actual URL, not a proposal. Preserve approved public ROM judging window unless Enzo changes it. Coordinate bundle handoff with D. |
| A / triple-hippo | Frozen engine/report, provenance and concise proof/credits | `lab/`; audit facts and exact hash chain. Do not replace this user-defined flow with a narrated recovery pipeline. |

Murmur kickoff broadcast: **ef34a457**. Reply STARTED with exact files, ETA and blockers; publish checkpoints to main and lane handoffs. D integrates; commit only lane-owned files. Do not start duplicate services or model spending.

## Acceptance checks

- Computer opens with Doom selected; action reveals a scannable code encoding the verified player URL.
- A physical phone scans it and loads the correct game. HTTPS, COOP/COEP and required core assets all succeed; errors stay readable.
- Loading → optional browser-required gesture → grey handheld → adapted live controls is observed, including reduced motion and rotation.
- Actual E1M1 gameplay is observed, with movement, turning and simultaneous fire. Record device/browser, time, URL and package hash. Desktop emulation does not count as a physical phone.
- No fake QR, gameplay footage substituted for the emulator, fabricated progress, synthetic recovery events, or unverified device claims.
- Save a short end-to-end recording of computer selection, phone scan and play, with Built today / Not ours accessible.

## Current dependencies

D already has verified original and god_200 playable packages. Prefer original-equivalent rebuilt Doom for this flow; god_200 is an optional separate demonstration, not a required selection step. Public ROM distribution was previously authorized for 17:00–18:45 judging and applicable final round only; downloads remain hidden and D owns removal of production and preview copies afterward. Get a concrete serving plan ready now. Final physical-phone proof and publishing status must be reported honestly.

## Implementation at cutoff

D implemented the fallback computer picker under `creature/phone/results.html` while C awaited its own user's approval. The QR uses a supplied public HTTPS URL (`?player=...`) or a public same-origin host; localhost produces an honest waiting state and local preview link, never a fake QR. Phone URL: `/?game=doom&demo=1`.

The phone has restrained grey UI, actual loading progress, a 1.8-second handheld morph animating real control elements, reduced-motion/interruption cleanup, and frame-timed real New Game menu inputs derived from the existing headless scenario. Auto-resume is disabled for this demo flow. The existing default player remains the fallback.

Syntax checks and Python compilation passed. Static bundle `creature/phone/dist/results-demo-v1` built with 30 files, original playable SHA-1 e1ddb8fb96764422d5fb6b1c84c83b85c98236bd and verified 8.4% rounded build label (235-function report, exact 8.39%). Local preview server :7420. **New flow has not yet been visually rehearsed or tested on a physical phone. It is not a completed end-to-end demo.** Public HTTPS URL/deployment is pending B; no public URL or success is invented. At the hard cutoff, stop work and leave these limits explicit.
