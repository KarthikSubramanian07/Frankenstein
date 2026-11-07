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
- **MongoDB Atlas:** live. Per-library idiom collections, plus every event and run mirrored for queries.
- **Tests:** 182 offline tests and green CI.

## In progress

- Held-out round 2 on harder functions (57 to 200 bytes) with clean code: library on vs off, Snap on vs off,
  repeats for noise ($15 cap). Round 1 (16 to 56 bytes) showed no real difference; see `crew/EXPERIMENTS.md`.

## Learned

- The face function (`fn_0801B298`, 1,164 bytes at -O3) is out of reach today: 2 attempts in 24 minutes, best
  0.7%, $0.52. Stopped at 12:49. The hero beat uses a smaller HUD function (Lane D).

## Blocked

- Cartographer: SubQ `subq-preview` needs early access from the Subquadratic table.

## Next

- The live segment script (`crew.demo`) rehearsed against the real referee.
- The finale function chosen with Lane A.
