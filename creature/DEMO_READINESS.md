# Integrated demo readiness

Enzo requests a catch-up on main, then one Murmur broadcast asking all lanes whether Lane D can run the integrated demo. This is a readiness request, not a declaration that the demo is ready.

## Current checkpoint (2026-11-07, approximately 15:06 Pacific)

D fast-forwarded main through `60af358` and read the updated lane handoffs, decisions, Stage integration handoff and source files. Thirteen incoming commits included the tightened Checker, restored union source, current rebuild proof, revised site and recording-time change.

- The latest committed union evidence reports **170 / 568 functions (29.9%), 4.78% of code bytes; all 170 spliced into an identical engine**, SHA-1 `d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2`. This is committed evidence from B, not a new local referee run.
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
| Current Stage TypeScript | Passed |
| Latest full tallies | B reports 33 finished runs / 24 lies / 30 fakes; this checkout has only 9 finished metrics and returns 5 / 2. Do not replace global totals with partial local counts. |

No runtime swap, public phone QR, physical-phone validation or recorded finale is claimed.

## Readiness broadcast for the native Murmur session

Run native `who` and `inbox`, update D's status, then use native `send` with `to: "*"` once:

**Subject:** Lane D requests READY/BLOCKED before integrated demo rehearsal

**Body:** Enzo wants us to run the complete demo and display it now after a readiness check. Please reply READY or BLOCKED, your exact commit, launch command, dependencies, live-versus-replay status, and blocker/ETA. A: supply the latest 170-function rebuilt engine plus rebuild report, and the hud_shift engine or exact 32-byte delta with offset/baseline hash, via an agreed no-WAD artifact path. B: confirm real live-run/jobs startup and Meta billing status; provide the full exported metrics/tallies and the exact run to rehearse. C: confirm frozen Stage, current game geometry, required origins for same-origin host :7416, and the intended main/ending/credits route. D: packages and one-origin host source are present, but the service is stopped; latest union/patch artifacts, integrated browser validation, phones and recording are pending. Please name the launch owner so we do not start duplicate services. Keep any replay explicitly labelled. Record replies in your handoff and creature/DEMO_READINESS.md.

**Actual Murmur delivery:** PENDING. The native session must record the returned send id and real replies here; do not fill these from assumptions.

| Lane | Reply | Exact launch input still needed |
|---|---|---|
| A | Awaiting confirmation | Latest rebuild report + engine, HUD-shift delta/engine |
| B | Awaiting confirmation | Live jobs/run ownership, billing test, complete metrics |
| C | Awaiting confirmation | Frozen build, :7416 data-server origin, run/ending configuration |
| D | Partial local services verified | Start current integrated host/server only after agreeing launch ownership |

## Launch plan after replies

1. Receive and verify A/B artifacts; package with the same processed WAD/no-GUS settings. An identical engine should produce the existing original package byte for byte. Test the visible HUD modification before calling it a finale.
2. Rebuild Stage. Restart the stale Stage server with an explicit `STAGE_ORIGINS` list including localhost ports 5173 and 7416. Preserve any other team-required origins.
3. Start `node creature/phone/serve.mjs --port 7416 --stage stage/dist --rom creature/runtime/generated/doom-variant-playable.gba`. Add a verified build label only after its actual engine/report verification passes.
4. Display the player and Stage on the same origin: `http://127.0.0.1:7416/stage/?game=http%3A%2F%2F127.0.0.1%3A7416%2F%3Fwindowed&replay=doom_r12&speed=8` is the existing honest replay fallback, not a live run and not the union's 170-function proof.
5. Confirm game, controls, event labels, checksum card and Built today / Not ours. A live segment requires an actual active run from B. Public phone distribution remains governed by the team's recorded judging window; no invented URL or QR.
