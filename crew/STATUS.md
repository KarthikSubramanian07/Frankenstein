# Lane B (Crew) status

Updated 2026-11-07 12:45. Numbers come from run files and `DECISIONS.md`.

## Verified now

- **Real Doom:** `doom_r01` matched 28 of 30 small functions through Lane A's real referee, at 1.29 attempts per
  match, in 268 s, for $0.73 of Muse plus $0.06 of SubQ Snap, with 0 false claims.
- **Rebuild:** splicing those 28 into the ROM gives the identical SHA-1 (`d936259b…`).
- **Bench:** `bench_r01` matched 14 of 14 (bench only, not Doom).
- **SubQ Snap:** triage, keep / escalate / abandon, the fakematch gate, the Play-to-recover director (2.4 s), eyes
  (0.7 s) and the router (face function ranked #1).
- **Gemini:** a second opinion on every match, run in parallel with Snap.
- **Habits:** adopted or retired on evidence while the library is learning; frozen in held-out runs.
- **Claims:** claim-first submissions, so the Checker can catch real overconfidence.
- **ASI:One:** the jobs API with plain words, live jobs and an evidence block.
- **Exports:** real runs are committed under `crew/exports/`.
- **MongoDB:** the Atlas sink is ready and turns on when `MONGODB_URI` is set.
- **Tests:** 132 offline tests and green CI.

## In progress

- The face function (`doom_face01`, $3 cap).
- Held-out experiments: library on vs off, Snap on vs off (`crew/EXPERIMENTS.md`, $8 cap).

## Blocked

- Cartographer: SubQ `subq-preview` needs early access from the Subquadratic table.
- MongoDB Atlas: needs a `MONGODB_URI`.

## Next

- The live segment script (`crew.demo`) rehearsed against the real referee.
- The finale function chosen with Lane A.
