# Integrated demo readiness

Enzo requests a catch-up on main, then one Murmur broadcast asking all lanes whether Lane D can run the integrated demo. This is a readiness request, not a declaration that the demo is ready.

## Current checkpoint (2026-11-07, approximately 15:05 Pacific)

D fast-forwarded main through `da1b682`, including `d04afdf`, `5e2c478`, `165709e` and `b6392f1`, and read the updated handoffs, decisions, Stage integration files and both demo scripts. The incoming history included the tightened Checker, restored union source, current rebuild proof, revised site and recording-time change.

- The latest committed union evidence reports **170 / 568 functions (29.9%), 4.78% of code bytes; all 170 spliced into an identical engine**, SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`. This is committed evidence from B, not a new local referee run.
- A's new proposed script `docs/DEMO_SCRIPT_V2.md` adds a judge-triggered god-mode demonstration and **god_200**, a one-function recovered-C modification intended to show 200% health. It remains a draft until the team picks it; current `docs/DEMO_SCRIPT.md` remains the working script. The source/report are present, but the binary is absent and neither new patch is playtested here. The button-reader function is original; only the god-mode function is recovered. Source changes were read, not executed.
- Recording now starts at **16:30 Pacific** (`.hackathon.json`). Submission deadline remains 17:00.
- Meta billing is reported blocked by HTTP 402 monthly_spend_limit_reached. Do not promise fresh model recovery until B verifies billing and a real call.
- The existing native Codex session appeared in the Murmur daemon log as **dusky-tripod** under Enzo's device, with telemetry disabled. The older Work chat has no native Murmur tools. Its supported app-to-task message attempt also failed with `Codex app tool request failed`. It did **not** send a Murmur broadcast. Do not restart the rejected temporary bridge.

## Actual checks on Enzo's laptop

| Check | Observed result |
|---|---|
| Stage frontend :5173 | HTTP 200, isolation headers present |
| Stage data :7201/health | HTTP 200, `live: null` |
| Stage :7201/road | HTTP 404 although current source implements it: running server is stale |
| Stage data CORS for :7416 | Replies with allow-origin :5173, not :7416 |
| Original player :7413/status.json | ROM configured; no verified rebuild label |
| One-origin host :7416 | Connection refused: not running |
| Crew :7111, referee :7101 | Connection refused |
| Latest union engine `lab/out/rebuilt.gba` | Missing locally |
| HUD-shift engine `lab/out/hud_shift.gba` | Missing locally; source/report exist |
| New `lab/out/god_200.gba`, `lab/out/instant_raise.gba` | Missing locally; recovered-C edits/reports are committed |
| Current Stage TypeScript | Passed |
| Latest full tallies | Resolved by `d04afdf`: local `python tools/counts.py` now reproduces **35 finished runs, 24 lies caught, 30 fakes rejected, 0 accepted**, 170/568 and 4.78%. Earlier partial local counts are superseded. |

No runtime swap, public phone QR, physical-phone validation or recorded finale is claimed.

## Readiness broadcast for the native Murmur session

Run native `who` and `inbox`, update D's status, then use native `send` with `to: "*"` once:

**Subject:** Lane D requests READY/BLOCKED before integrated demo rehearsal

**Body:** Enzo wants us to run the complete demo and display it now after a readiness check. Please reply READY or BLOCKED, your exact commit, launch command, dependencies, live-versus-replay status, and blocker/ETA. A: supply the latest 170-function rebuilt engine plus rebuild report, and the god_200 engine (first choice), instant_raise engine (fallback), or exact compiled patch deltas with offset/baseline hash; hud_shift is an earlier fallback, via an agreed no-WAD artifact path. B: confirm real live-run/jobs startup and Meta billing status; confirm d04afdf's full metrics (reproduced here: 24/30/0 across 35 runs) and the exact run to rehearse. C: confirm frozen Stage, current game geometry, required origins for same-origin host :7416, and the intended main/ending/credits route. D: packages and one-origin host source are present, but the service is stopped; latest union/patch artifacts, integrated browser validation, phones and recording are pending. Please name the launch owner so we do not start duplicate services. Keep any replay explicitly labelled. Record replies in your handoff and creature/DEMO_READINESS.md.

**Actual Murmur delivery:** PENDING. The native session must record the returned send id and real replies here; do not fill these from assumptions.

| Lane | Reply | Exact launch input still needed |
|---|---|---|
| A | Awaiting confirmation | Latest rebuild report + engine, god_200/instant_raise compiled deltas or engines |
| B | Awaiting confirmation | Live jobs/run ownership and billing test; complete metrics now received |
| C | Awaiting confirmation | Frozen build, :7416 data-server origin, run/ending configuration |
| D | Partial local services verified | Start current integrated host/server only after agreeing launch ownership |

## Launch plan after replies

1. Receive and verify A/B artifacts; package with the same processed WAD/no-GUS settings. An identical engine should produce the existing original package byte for byte. Test god_200 first (expected 200% health), instant_raise second, then the older HUD modification if needed. Do not claim a visible finale until observed.
2. Rebuild Stage. Restart the stale Stage server with an explicit `STAGE_ORIGINS` list including localhost ports 5173 and 7416. Preserve any other team-required origins.
3. Start `node creature/phone/serve.mjs --port 7416 --stage stage/dist --rom creature/runtime/generated/doom-variant-playable.gba`. Add a verified build label only after its actual engine/report verification passes.
4. Display the player and Stage on the same origin: `http://127.0.0.1:7416/stage/?game=http%3A%2F%2F127.0.0.1%3A7416%2F%3Fwindowed&replay=doom_r12&speed=8` is the existing honest replay fallback, not a live run and not the union's 170-function proof.
5. Confirm game, controls, event labels, checksum card and Built today / Not ours. A live segment requires an actual active run from B. Public phone distribution remains governed by the team's recorded judging window; no invented URL or QR.
