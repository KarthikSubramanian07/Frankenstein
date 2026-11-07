# Lane A status

Updated 12:46. Owner: Eddy.

| Gate | State | Proof |
|---|---|---|
| Reproducible target (T1) | done | two builds, SHA-1 `d936259b…` (private variant) |
| Manifest, asm, ctx, viz_map | done | 568 game functions, 170 heldout |
| Referee check/context/serve/mock | done | `lab/tests`: original source MATCH, edits PARTIAL, no name leaks |
| Exported targets (judge anywhere) | done | `lab/out/target/*.json`, parity test |
| rebuild / patch | done | relinking unchanged C: 0 bytes differ; one constant: 1 byte, one function |
| ASI:One agent | done | verified live in ASI:One at 12:18 (MATCH and REJECTED) |
| Memory probe, both builds | blocked | needs Eddy's `META_API_KEY` |
| Static-face demo ROMs for D | done | `python3 -m lab.demo.build_demo_roms`; one function changed (`fn_0801B298`) |
| Globals labelled in asm and ctx | done | 761 literal-pool words annotated, 425 ctx headers list their globals |

Next: lint bypass hardening and the crew-to-referee integration check (both running), then the memory probe once the Meta key lands.
