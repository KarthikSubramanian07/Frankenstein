# Lane A status

Updated 13:05. Owner: Eddy.

| Gate | State | Proof |
|---|---|---|
| Reproducible target (T1) | done | two builds, SHA-1 `d936259b…` (private variant) |
| Manifest, asm, ctx, viz_map | done | 568 game functions, 170 heldout |
| Referee check/context/serve/mock | done | `lab/tests`: original source MATCH, edits PARTIAL, no name leaks |
| Exported targets (judge anywhere) | done | `lab/out/target/*.json`, parity test |
| rebuild / patch | done | relinking unchanged C: 0 bytes differ; one constant: 1 byte, one function |
| ASI:One agent | done | verified live in ASI:One at 12:18 (MATCH and REJECTED) |
| Lint hardening (red-teamed) | done | 13 bypass classes tried; all blocked; second pass on `gcc -E` output; 25 tests |
| Crew-to-referee integration | done | `lab/INTEGRATION_CREW.md`: works end to end, 6 fixes requested from B |
| Rebuild from the crew's 28 recoveries | done | `doom_r01`: identical SHA-1, 28 functions, 0.25% of code bytes |
| Fetch.ai multi-agent | done | Excavator asks the Referee agent through Agentverse mailboxes; self-test MATCH logged by both agents |
| Memory probe, both builds | done | 0 of 20 matched on both builds: 10 refused (even with GPL framing), 10 did not compile against the real headers |
| Static-face demo ROMs for D | done | `python3 -m lab.demo.build_demo_roms`; one function changed (`fn_0801B298`) |
| Globals labelled in asm and ctx | done | 761 literal-pool words annotated, 425 ctx headers list their globals |

Next: memory probe once the Meta key lands.
