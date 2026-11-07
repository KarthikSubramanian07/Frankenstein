# Lane A status

Updated 12:35. Owner: Eddy.

| Gate | State | Proof |
|---|---|---|
| Reproducible target (T1) | done | two builds, SHA-1 `d936259b…` (private variant) |
| Manifest, asm, ctx, viz_map | done | 568 game functions, 170 heldout |
| Referee check/context/serve/mock | done | `lab/tests`: original source MATCH, edits PARTIAL, no name leaks |
| Exported targets (judge anywhere) | done | `lab/out/target/*.json`, parity test |
| rebuild / patch | done | relinking unchanged C: 0 bytes differ; one constant: 1 byte, one function |
| ASI:One agent | done | verified live in ASI:One at 12:18 (MATCH and REJECTED) |
| Memory probe, both builds | blocked | needs Eddy's `META_API_KEY` |
| Static-face demo ROMs for D | in progress | ETA 13:15, `lab/demo/` |

Next: static-face ROMs; literal-pool globals in asm and ctx (helps the crew match); lint bypass hardening; crew-to-referee integration check.
