# Lane A on stage

Run everything from the repo root. One command checks every beat below: `python3 -m lab.demo.rehearse` (about 5 s, exit 0 means ready).

## Pre-show (cold start, about 3 minutes)

1. Docker Desktop running. `docker ps` shows `frank-lab Up`. If it doesn't: `bash lab/setup_referee.sh`.
2. Referee: `python3 -m lab.referee serve` in its own terminal. Check with `curl -s localhost:7101/health`, which should print `{"ok": true, "mock": false}`. If it says `mock: true`, you started the wrong one.
3. Agents, each in its own terminal (logs are what rehearse reads):
   `mkdir -p /tmp/cv; bash lab/agents/run_agent.sh 2>&1 | tee /tmp/cv/agent.log` and `bash lab/agents/run_excavator.sh 2>&1 | tee /tmp/excavator.log`.
   Wait for `Manifest published successfully` in both. Port 8001/8002 busy means an old copy is still running; it frees itself within a minute.
4. `caffeinate -dims &` so the laptop doesn't sleep. Plug in power. Turn on Do Not Disturb.
5. `python3 -m lab.demo.rehearse` shows 8/8 PASS.
6. Open the ASI:One chat with the Referee agent (`agent1q088qnxafee4aug0qz4xnd9zkk4veq2r9ez07mp047u8enqhckc5w2hstx0`) in a browser tab and send one warm-up message.
7. Terminal font large, `clear`.

## The beats, in demo order

Shell setup once: `B=fn_0801B724; echo "int $B(void) { return 1; }" > /tmp/wrong.c; echo "int $B(void) { return 0; }" > /tmp/right.c`

1. **Referee rejects a candidate.** `python3 -m lab.referee check --fn fn_0801B724 --src /tmp/wrong.c`
   Point at `PARTIAL 50.0%` and the first diff at offset 0: expected `movs r0, #0`, got `movs r0, #1`. "One wrong instruction and it says no."
2. **MATCH.** `python3 -m lab.referee check --fn fn_0801B724 --src /tmp/right.c`
   Point at `MATCH`, 100%, about 120 ms.
3. **ROM rebuilt from agent code.** `python3 -m lab.referee rebuild --recovered crew/exports/doom_r01/recovered --json`
   Point at `"identical": true` and `rom_sha1` equal to `original_sha1`, then `recovered: 28`, `pct_agent_code: 0.25`. Say: "recovered functions are built from the agents' C, the rest from the original." Takes about 4 s.
4. **Finale patch.** `python3 -m lab.referee patch --fn fn_0801B724 --src /tmp/wrong.c --json`
   Point at `"changed_functions": ["fn_0801B724"]` and `unchanged: 567`: only one function changed. The static-face ROM is the same mechanism: `python3 -m lab.demo.build_demo_roms` prints `changed_functions: ['fn_0801B298']`. Present the static face as a demo visualization, never as a recovery.
5. **ASI:One agent in chat.** In the open tab: "Does this C match fn_0801B724?" plus `int fn_0801B724(void) { return 0; }`. Point at `Verdict ... MATCH` and the observed vs inferred split.
6. **Memory probe.** `cat lab/out/memory_probe.json`
   Last run: 20 public GBADoom functions written from memory by muse-spark-1.3, 0 MATCH against unmodified GBADoom (mean 0.0%) and 0 MATCH against our variant (mean 0.0%). The model can't recite this code, so the matches come from the work and not from memorization. Quote only what the file says on the day; rerun prints the same line via rehearse.

## When something dies

- Wi-Fi down: beats 1 to 4 and 6 are all localhost and keep working. Only the ASI:One chat needs the network. Fall back to the answer the agent already logged: `grep -A25 "answered" /tmp/cv/agent.log`, or a screenshot of a good chat taken during pre-show (take one).
- Referee dies (connection refused): `python3 -m lab.referee serve` again; it is up in under 2 s. The CLI forms above also work without the server, as long as `frank-lab` is up.
- Container dies: `docker start frank-lab`. If that fails, `bash lab/setup_referee.sh` (slower; skip to the chat beat while it runs).
- Agent dies: rerun its `run_*.sh`; the mailbox reconnects within a minute. Use the logged transcript meanwhile.
- Mailbox warnings (`Failed to connect to mailbox server`) in the logs are transient; ignore them unless chat stops answering.

## Reset between judge groups

`clear`, then `python3 -m lab.demo.rehearse`. It reruns every beat, which rewrites `lab/out/rebuilt.gba` and `lab/out/patched.gba` the same way the demo does, and tells you in 5 s whether anything died. Start a new ASI:One chat so the next group doesn't see the old one.

## Last rehearsal

2026-11-07, Eddy's laptop, live referee (4.4 s total, exit 0):

```
PASS  health          0.01s  referee real on :7101
PASS  reject          0.14s  PARTIAL 50.0%  first_diff @+0: expected `movs	r0, #0` got `movs	r0, #1`
PASS  match           0.12s  MATCH 100%  (120 ms)
PASS  rebuild         3.65s  identical  sha1 d936259bcbe4  recovered 28  agent code 0.25%
PASS  patch           0.14s  changed_functions ['fn_0801B724']  unchanged 567  sha1 d2380a21d182
PASS  static-face     0.19s  changed_functions: ['fn_0801B298']  (44 of 1164 bytes)
PASS  memory-probe    0.00s  20 fns, muse-spark-1.3: unmodified 0 MATCH (mean 0.0%)  vs variant 0 MATCH (mean 0.0%)
PASS  agents          0.04s  alive + published: frankenstein_agent, excavator_agent
8/8 beats PASS
```
