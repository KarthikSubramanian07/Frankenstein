# Laptop capture and 60-second video

## Current primary show: Lane C revision 1075572

The default Stage is now one silent game/count/log screen and an ending card. Use http://127.0.0.1:5173/?obs=1 over the separate game capture at x=40, y=140, 1200×800 (5×). Space toggles the main screen/card; C on the card shows Built today / Not ours. Old multi-scene URLs and director mode below now require legacy=1. Keep replay labels visible. The browser game iframe remains unverified here (STATUS.md); separate OBS capture is the intended alternative and still needs a real recording test. The latest frozen frontend build/typecheck passed.

Lost games, rebuilt and proven. Doom is the first patient: its source is public, so the team can hide it from the agents and check every answer. The demo shows the method for recovering games whose source is gone. Lead with Doom running and a real compiler proof; the static-face ROM is a deliberate display-rule visualization. The current recovered set does not include the face function. Use the optional overlay only after real gameplay and the referee path work. These instructions describe setup; an OBS scene collection has not been exported or verified yet.

## OBS composition

Set the base/output canvas to 1920x1080 and recording to 60 fps, H.264 in an MKV container (then remux to MP4). Confirm the resulting 60-second MP4 is under 100 MB. Use a short real test recording to check game audio, text legibility and dropped frames before the final take.

For Split, add sources from bottom to top:

1. Color source `#0B0B2E`, filling the canvas.
2. mGBA window/game capture, cropped to its 240x160 game pixels and scaled to 1200x800 with point sampling, at **x=40, y=140**, as confirmed in `stage/HANDOFF_D.md`. No game-content crop. Adjust game and overlay together if Stage geometry changes.
3. Optional Browser source `http://127.0.0.1:7302/`, width=1200, height=800, at the exact same position. Browser source background must remain transparent. Do not use `preview=1` or `sample=1` in the real scene.
4. Stage Browser source `http://127.0.0.1:5173/?scene=split&obs=1`, width=1920, height=1080. Confirm the left opening is transparent and the capture is not obscured. The Stage dev URL is currently 5173; its data server is 7201 and event websocket is 7202.

Stage's scenes are now implemented. Use the following Browser-source URLs (1920x1080) for the other scenes:

| OBS scene | Stage URL suffix |
|---|---|
| Title | `/?scene=title` |
| Rebuild | `/?scene=split` |
| Caught | `/?scene=versus` |
| Faster | `/?scene=timetrial` |
| Alive | `/?scene=ending` |
| Credits | `/?scene=ending&page=credits` |

The Ending consumes real rebuild/patch/publication events. Its Built today / Not ours card is the primary final card; `endcard.html` is an editable standalone fallback only. Stage keys are `0` Title, `1` Rebuild (`5`/`h` aliases), `2` Caught, `3` Faster, `4` Alive, and `space` on Alive for credits. OBS Browser sources need interaction/focus to receive those keys; distinct scene sources avoid that dependency during a take. Create Game (capture only), and Phones only if actual phone play is available. Keep controller/game focus on mGBA while changing scenes with OBS hotkeys that do not overlap gameplay keys. Test the chosen keys locally.

For browser-only composition, Stage accepts `?scene=split&game=http://127.0.0.1:7411/` (use the actual player port). Both hosts must send isolation headers. For the frozen show use `cd stage && npm run demo`; see the latest `stage/HANDOFF_D.md`.

The Stage's phone QR comes from the real `phone.published` event. It resolves `qr_png` through the Stage server's `/file?path=` endpoint, restricted to PNGs under `creature/`. A missing QR must remain visibly unavailable; do not add a placeholder code. The running-code badge stays on original code until a real `rom.swapped` event arrives.

Set transitions to a short cut/fade until a real pixel-dissolve asset exists. Avoid untested flashes. Do not fabricate imported OBS JSON, successful captures, QR URLs or gamepad readiness.

## Submission video: exactly 60 seconds maximum

| Time | Real capture | Caption / evidence |
|---|---|---|
| 0-5 s | Doom running; static face begins to restore | "Lost games, rebuilt and proven." State that static marks unrecovered code. |
| 5–16 s | Split: real recovery attempt and submitted C | "Agents reconstruct C from machine code." Mark sample/replay and actual speed if used. |
| 16–26 s | Referee rejection with actual differing instruction | "Nothing lands on a claim alone." Use a genuine rejection, not scripted fake evidence. |
| 26-38 s | Accepted function and actual rebuild report; separately show display-rule restoration if tested | Show the real percentage and matching checksum. Label face static as our visualization. Claim a swap only if confirmed. |
| 38-47 s | Actual before/after of the verified one-function display patch | "Source code lets a game change again." This patch is hand-written demo code; do not call the face recovered or an original bug fixed. |
| 47–54 s | Actual ASI:One verification or measured results; phone play if tested | Show only working partners/features and real numbers. Cut rather than stage missing footage. |
| 54-60 s | Stage `?scene=ending&page=credits` | Built today / Not ours, credits, repo URL. |

Burn captions into the exported video, at least 34 px at 1080p; keep most captions to two short lines. Use Lane C's self-hosted font files if available, otherwise a readable local font. No need for a vertical cut. End card lists only features actually built and partners actually used; edit it before recording.

Say "Doom is our first patient" rather than suggesting Doom's actual source was lost. End with "Games don't have to die." The laptop fallback is real Doom + referee evidence + a labeled display-rule modification. QR phone play remains the intended finale; report physical-device/public-host gates honestly. Save the final exported video and verify it plays on a second device before submission.
