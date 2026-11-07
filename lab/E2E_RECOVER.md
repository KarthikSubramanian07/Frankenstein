# E2E: "Recover fn_X" through the real crew (2026-11-07, 12:59 to 13:21 PST)

## Start command (running now, PID 78291)

```bash
cd "/Users/eddyz/Hackathon Destruction/frankenstein"
SSL_CERT_FILE=/etc/ssl/cert.pem CREW_HOURLY_USD=2 \
  nohup crew/.venv/bin/python -m crew.serve --host 127.0.0.1 --port 7111 >> /tmp/cv/crew_serve.log 2>&1 &
```

- `crew/.venv` is new: `python3 -m venv crew/.venv && crew/.venv/bin/pip install -r crew/requirements.txt`. Without
  `python-dotenv`, `crew/config.py` silently skips `.env`, and the doctor reports `META_API_KEY missing`.
- `SSL_CERT_FILE=/etc/ssl/cert.pem` is required because python.org Python on macOS has no CA bundle. Without it, the
  Meta and SubQ calls fail with `CERTIFICATE_VERIFY_FAILED`.
- `CREW_HOURLY_USD=2` caps spend for this test. The default is $5/hour. An excavator job reserves $1.80
  (`max_usd` 1.5 × 1.2), so with a $2 cap only one excavator job can run per hour. For the demo, restart without
  that variable.
- Doctor, after the fixes above: meta OK (muse-spark-1.3, muse-wonder-1.0), subq OK (snap only, no subq-preview),
  referee OK, MongoDB WARN (local JSON library), target `lab/out/manifest.json`.

## Function tested

`fn_08005008`: game, thumb, 8 bytes, train split, difficulty 0.011, no callees, not in `crew/exports/doom_r01/recovered/`.

## Step a: direct `POST /jobs {"fn":"fn_08005008","max_usd":0.5}` gives j_1

| status | attempts | best_pct | cost_usd | src_path |
|---|---|---|---|---|
| matched | 2 | 100.0 | 0.0314 | `runs/r_asi_01/recovered/fn_08005008.c` |

Evidence: referee MATCH with `claim_was_true: true`. The Snap review returned fakematch_p 0.12. The recovered C was
`const char *fn_08005008(void) { return "test"; }`.

## Step b: signed envelope "Recover fn_08005008" to the excavator `/submit` from a throwaway identity

The excavator started the crew job each time, but the crew never matched, so the C never went to the Referee agent:

| job | sender (throwaway) | status | attempts | best_pct | cost |
|---|---|---|---|---|---|
| j_2 / r_asi_02 | agent1qvk9z45l… | abandoned | 4 | 66.7 | $0.032 |
| j_3 / r_asi_03 | agent1q25747s3… | abandoned | 4 | 66.7 | $0.043 |
| j_4 / r_asi_04 | agent1qwcys3rz… | abandoned | 4 | 66.7 | $0.040 |

The Digger kept emitting `return 0x08149b78;` or `&data_08149B78`, which leaves a different literal-pool word or
relocation at offset 4. Only j_1 found the string-literal form. Wonder (attempts 3 and 4) did not fix it, and attempt 4
failed lint.

Log lines (`/tmp/excavator.log`) show that the excavator received each message and replied to the sender. The replies
failed only because the throwaway sender is unregistered, which is expected:

```
ERROR:    [frankenstein-excavator]: Unable to resolve destination endpoint for agent: agent1qvk9z45lr6kh4ex5564h5758lm77jj3mrmgxvgdjaty5pcfyvjksww46e8a
ERROR:    [frankenstein-excavator]: Unable to resolve destination endpoint for agent: agent1q25747s3qqdzzemh2l9mctmaza3xhn9m7jlnset55nh072xcyxtt7v8mer7
```

The crew API confirmed j_2, j_3 and j_4 with `fn_08005008` (`GET /jobs/j_N`). There is no new `asking Referee agent
about fn_08005008` line and no new `fn_08005008` line in `/tmp/cv/agent.log`. The only excavator-to-referee MATCH on
record is the earlier selftest:

```
INFO:     [frankenstein-excavator]: asking Referee agent about fn_0801B724
INFO:     [frankenstein-excavator]: reply from Referee agent: ### Verdict for `fn_0801B724`: **MATCH**
INFO:     [frankenstein-referee]: answered agent1qf4w7kmtsg…: ### Verdict for `fn_0801B724`: **MATCH**   (/tmp/cv/agent.log)
```

## Findings for Lane A and Lane B

1. **The excavator's event loop freezes on unregistered senders.** The first injected message blocked the agent for
   about 16 minutes: `/submit` timed out and `sample` showed the main thread in a synchronous gRPC `poll`. The Almanac
   ledger lookup for the throwaway sender, used for the ack and the "On it" reply, runs on the loop. After
   `Ledger unavailable. Contract interactions temporarily disabled`, later lookups failed in seconds. Real ASI:One
   senders resolve, but a ledger outage would freeze the excavator in the same way.
2. **Request for Lane B:** fn_08005008 matches in about 1 of 4 runs. If the Digger is shown the referee's relocation
   or `first_diff` context for literal-pool words, it might find `return "<string>"` sooner. Not blocking.

Total model spend: $0.147 (`/health` `spent_last_hour_usd`).
