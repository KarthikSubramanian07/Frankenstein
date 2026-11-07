# Laptop capture and 60-second video

The static-face ROM is the primary effect. Use the optional overlay only after real gameplay, face recovery, and the referee path work. These instructions describe setup; an OBS scene collection has not been exported or verified yet.

## OBS composition

Set the base/output canvas to 1920x1080 and recording to 60 fps, H.264 in an MKV container (then remux to MP4). Confirm the resulting 60-second MP4 is under 100 MB. Use a short real test recording to check game audio, text legibility and dropped frames before the final take.

For Split, add sources from bottom to top:

1. Color source `#0B0B2E`, filling the canvas.
2. mGBA window/game capture, cropped to its 240x160 game pixels and scaled to 960x640 with point sampling, initially x=20, y=100. Verify Lane C's current actual frame geometry and adjust both game and overlay together.
3. Optional Browser source `http://127.0.0.1:7302/`, width=960, height=640, at the exact same position. Browser source background must remain transparent. Do not use `preview=1` or `sample=1` in the real scene.
4. Stage Browser source `http://127.0.0.1:5173/?scene=split&obs=1`, width=1920, height=1080. Confirm the left opening is transparent and the capture is not obscured. The Stage dev URL is currently 5173; its data server is 7201 and event websocket is 7202.

Create Title and Versus scenes using Stage's actual routes. Use an ending scene only when Lane C has implemented it; until then use `endcard.html` as the final Browser source. Create Game (capture only), and Phones only if actual phone play is available. Keep controller/game focus on mGBA while changing scenes with OBS hotkeys that do not overlap gameplay keys. Test the chosen keys locally.

Set transitions to a short cut/fade until a real pixel-dissolve asset exists. Avoid untested flashes. Do not fabricate imported OBS JSON, successful captures, QR URLs or gamepad readiness.

## Submission video: exactly 60 seconds maximum

| Time | Real capture | Caption / evidence |
|---|---|---|
| 0–5 s | Doom running; static face begins to restore | "Recover the code. Restore the face." State that static marks unrecovered code. |
| 5–16 s | Split: real recovery attempt and submitted C | "Agents reconstruct C from machine code." Mark sample/replay and actual speed if used. |
| 16–26 s | Referee rejection with actual differing instruction | "Nothing lands on a claim alone." Use a genuine rejection, not scripted fake evidence. |
| 26–38 s | Accepted function, actual rebuild report, real face recovery | Show the real percentage and matching checksum. Claim a swap only if confirmed. |
| 38–47 s | Actual before/after of the verified one-function change | "Recovered code can change again." Call it a bug fix only if the bug is real and reproduced. |
| 47–54 s | Actual ASI:One verification or measured results; phone play if tested | Show only working partners/features and real numbers. Cut rather than stage missing footage. |
| 54–60 s | Built today / Not ours end card | Credits, repo URL, original contribution split. |

Burn captions into the exported video, at least 34 px at 1080p; keep most captions to two short lines. Use Lane C's self-hosted font files if available, otherwise a readable local font. No need for a vertical cut. End card lists only features actually built and partners actually used; edit it before recording.

The honest laptop-only fallback is real Doom + recovered face + referee evidence + a labeled recorded modification. Phone playback is a bonus. Save the final exported video and verify it plays on a second device before submission.
