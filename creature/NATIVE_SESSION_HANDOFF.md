# Native Lane D session handoff

Enzo explicitly approved a fresh native Codex task to continue this same Lane D project and load the registered native Murmur tools. Existing Work chat could not load them. Its temporary Python/stdin bridge was repeatedly rejected by automatic approval review as a telemetry endpoint, including read-only calls. Do not retry, repackage or bypass that blocked bridge. Use native Murmur tools only, with existing approvals and telemetry disabled; if native tools are unavailable or an action is rejected, report the limitation and use authorized GitHub handoffs.

## Workspace and coordination

Use the real full checkout:
C:\Users\emami\Documents\Codex\2026-11-07\new-chat\Frankenstein-live

Remote: https://github.com/KarthikSubramanian07/Frankenstein, main.
The sibling Frankenstein directory is an old partial mirror, NOT the active Git checkout.
Read AGENTS.md, CLAUDE.md, DECISIONS.md and the newest lane HANDOFFS/STATUS files before editing. D owns creature/. Enzo authorized small frequent commits/pushes and receiving other lanes' commits. Never force-push main or overwrite incoming changes. Git fetch origin main followed by merge origin/main avoided a FETCH_HEAD race with the Murmur daemon.

Murmur v0.2.3 is already installed at:
C:\Users\emami\Documents\Codex\2026-11-07\new-chat\work\murmur\mur.exe
The user ran stop/join in normal PowerShell; Claude/Codex/Grok MCP registration succeeded, and the normal daemon publishes presence. Use pinned docs/murmur/ instructions; do not run mur init. Telemetry is disabled by MURMUR_NO_USAGE=1 and clone git config murmur.usage=false. The pinned checkin.Off source verifies either disables check-in requests. Do not enable telemetry.

A confirmed D presence at 14:13. Real incoming message and outgoing message e00492e2 were verified before the Work bridge became blocked. Session names change: run native who/lookup instead of assuming old addresses. Last known peers: triple-hippo (Lane A/Eddy), coherent-vest (Lane B/Karthik), Aiden's device aidens-macbook-air-88-cdfb. Read inbox and set a concrete Lane D status. Current requests are also on GitHub issue #2.

## Goal and current priority

Finish a convincing Doom demo before the 14:55 Pacific freeze, record by 16:10 and submit by 16:30 (check current clock). Judges scan an actual QR and play instantly on phones. The broader idea is choosing an old game and moving it to another interface. Enzo wants autonomous work and parallel agents, with a cheap Luna coordinator during active work. All earlier subordinate tasks are completed; no agents currently need integration.

User pressed Escape to stop Computer Use. Do not resume emulator/game/browser control on that old authorization. Approval to create this new task is limited to task creation. Code, packaging, HTTP tests, native Murmur and Git coordination can proceed; obtain renewed user direction before resuming stopped UI control.

## Delivered and verified

- Static/original Doom packaged with pinned upstream GbaWadUtil + shareware WAD on Windows; all engine preservation and payload checks passed.
- Engine original: d936259bcbe48b5ce5d8be4d5ffe935c1eece8b2.
- Engine static face: 752c61e50fc1255e301e8efa4011082bf380c3e2.
- Original playable package: creature/runtime/generated/doom-variant-playable.gba, 5,704,780 bytes, SHA1 e1ddb8fb96764422d5fb6b1c84c83b85c98236bd.
- Static playable package: creature/runtime/generated/doom-static-playable.gba, 5,704,780 bytes, SHA1 337fbb15462b57eb6cc5a35bcf11e36646e130e2.
- Both omit GUS. Same actual processed-WAD SHA1 628f0749251adbc059e3f15bd9b18bd403285ad3. Keep music settings identical in every package.
- Current browser player actually reached New Game/episode/skill/gameplay with static face; movement, turn, fire and varying face expressions at full health observed. Game ran over 30 s across checks, no continuous recording. Screenshot committed: creature/shots/static-face-browser.jpg. Original basic boot/input was observed earlier; controlled continuous 30 s test remains open.
- prepare_swap.py now has rebuild/patch/restore modes, two-report restore checks, manifest fallback and strict actual engine/package/WAD verification. 19 synthetic gate checks and compilation passed. No runtime swap verified.
- New real doom_r12 build.rom seq606 extracted verbatim to creature/runtime/evidence/doom-r12-build.json: 6 functions, 0.36% code, identical original engine. Source/check record in .source.json. All 9 export files matched EXPORT SHA1s after Windows CRLF→canonical Git LF normalization. This is not the old28-function run.
- Static phone bundler creature/phone/bundle.py prepares 22 allowlisted files with isolation headers, truthful status, pinned notices. Judging SW caches shell only, ROM/status network-only; download false. Generated local dist/judging-restored-r12 has actual verified build label. Nothing deployed or QR-published.
- Universal player already has touch, keyboard, gamepad, PWA and QR hand-off code from teammates. Physical phones/console testing remains open.
- One-origin host is implemented and committed 49abd44 + 7d8f796: Node serve.mjs accepts --stage stage/dist and mounts Stage at /stage/, player at /. 29 HTTP checks passed; root verified real routes, assets, fonts, ROM and isolation headers on 7416. Windows junction test was EPERM; canonical containment implemented. Browser composition NOT yet checked after this change because UI control was stopped.
- Prior cross-origin Stage5173→player7412 iframe failed in IAB despite isolation headers; a temporary CORP same-site probe did not help and was discarded. One-origin hosting is the intended next check.
- Stage builds/typecheck passed after incoming revisions; 8/9 tests passed, remaining test Windows symlink EPERM. No tracked Stage edits by D. Latest Stage is one game/count/log screen plus ending card, silent. Current game rect x40,y140,1200x800(5x), log right. Space toggles card, C shows credits. Legacy scenes require legacy=1. Re-read newest stage/HANDOFF_D.md; C is still iterating.

## Immediate next steps

1. Native Murmur who/status/inbox; confirm D is reachable. No temporary bridge retry. Read A/B replies and newest main.
2. A produced a REAL recovered-function modification:
   lab/demo/hud_shift/fn_0801C130.c and report.json.
   Recovered wrapper's second argument becomes a1-4, intended graphics4px higher.
   Referee patch: exactly one function, 32 bytes, engine SHA1 19dcd9017bf1c869cb960ea0cdfd175832eafcb1.
   It was NOT emulator-tested. Binary lab/out/hud_shift.gba was absent in last checkout. D requested A commit that engine (ignore exception, no WAD), or exact 32-byte compiled delta + offset/baseline hash, through issue#2. Receive, verify full engine SHA, package with identical no-GUS data, then test only when UI control is authorized again.
3. A says in-place patch preserves RAM layout (no added .data/.bss); swap at vblank, outside the patched function. Actual mGBA save/load compatibility and runtime acknowledgment remain unverified. Do not pass --state-compatible or emit rom.swapped just from a report. Honest ROM reopen/restart fallback is allowed and must be labelled.
4. B's union sweep/recovered sources have arrived under crew/exports/union; total may be much larger now. Obtain latest REAL rebuild/report and headline from B/A. Do not carry six/28/86 as a global current total without fresh evidence. Functions can be headline; byte-percent evidence is separate.
5. Check one-origin Stage/player composition after authorization, then real physical iOS Safari/Android Chrome and five phones on venue Wi-Fi, HTTPS headers, actual QR, OBS/60s video ending Built today / Not ours.
6. Phone hosting decision in DECISIONS: public processed-shareware ROM only during judging17:00–18:45 (and final round if applicable), then remove production AND preview copies; download button stays hidden. Do not deploy early or invent a public URL.
7. Enzo demo laptop was selected, but Docker/referee/Crew private-key setup remains unresolved here. No Docker on PATH and WSL access failed in the sandbox earlier. B should help; private keys never in Git or Murmur. Existing real builds on A/B may support a Mac demo laptop plus out-of-band packaged ROM transfer if the human team chooses it.

## Useful local commands

node creature/phone/serve.mjs --port 7416 --stage stage/dist --rom creature/runtime/generated/doom-static-playable.gba
(Use normal argument spacing: --port 7416.)
Then /stage/?game=http%3A%2F%2F127.0.0.1%3A7416%2F%3Fwindowed&replay=doom_r12&speed=8
Data server: node stage/server/index.mjs, HTTP 7201/WS 7202. No live run was active; use real replay labels.
Build: node stage/node_modules/vite/bin/vite.js build stage --config stage/vite.config.ts
Typecheck: node stage/node_modules/typescript/bin/tsc --noEmit -p stage/tsconfig.json
Pinned Stage dependencies were integrity-verified and extracted to ignored node_modules after npm ci complained about a missing FreeBSD optional package.

## Claims and follow-on scope

Doom's actual source was not lost. It is the first patient/test case with source hidden from agents. Static-face flicker is a hand-written visualization rule; face function fn_0801B298 remains unrecovered unless NEW evidence proves otherwise. Never claim an original ouch-face bug fix or face recovery from restoring original code. The new HUD shift is a candidate real recovered-source modification and still needs runtime proof.

Pokémon Red opening/menu + first interactions and a genuine geographic coverage map are explicitly requested after Doom. Lane A's pret build/referee and local crew target exist; assembly echo MATCH is trivial, not equal to Doom C recovery. D still needs GB/core selection and real visited/behavior-validated/code-verified telemetry distinctions. Do not claim Pokemon runtime support yet. Local-model editable controls and generated screen extension are research goals, not delivered features; SubQ Snap is decisions/scoring, not verified pixel generation.

No secrets, fake events, fake QR, invented copyright exemptions or overstated device support. Preserve truthful evidence and move quickly.
