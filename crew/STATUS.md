# Lane B (Crew) status

Updated 2026-11-07 15:58. Numbers come from run files and `DECISIONS.md`.

## Verified now

- **Union headline:** **231 of 568 game functions (40.7%)**, 11372 of 141774 code bytes (8.02%),
  `reverified_by_referee: true`, `rejected_on_reverify: []` (`crew/exports/union/UNION.json`).
- **doom_par1:** 2/20 MATCH (`fn_08012234`, `fn_08019244`), $4.881, 1 false claim caught.
- **Live digs:** `doom_sweep3` (~53 recovered so far), `doom_keepA`, `doom_keepB` running with META_API_KEY.
- **Real Doom:** `doom_r01` matched 28 of 30 small functions through Lane A's real referee, at 1.29 attempts per
  match, in 268 s, for $0.73 of Muse plus $0.06 of SubQ Snap, with 0 false claims.
- **Rebuild:** splicing recovered functions into the ROM gives the identical SHA-1 (`d936259b…`).
- **Bench:** `bench_r01` matched 14 of 14 (bench only, not Doom).
- **SubQ Snap:** triage, keep / escalate / abandon, the fakematch gate, the Play-to-recover director, eyes
  and the router.
- **Gemini:** a second opinion on every match, run in parallel with Snap.
- **Habits:** adopted or retired on evidence while the library is learning; frozen in held-out runs.
- **Claims:** claim-first submissions, so the Checker can catch real overconfidence.
- **ASI:One:** the jobs API with plain words, live jobs and an evidence block.
- **Exports:** real runs are committed under `crew/exports/`.
- **MongoDB Atlas:** live. Per-library idiom collections, plus every event and run mirrored for queries.
- **Tests:** 182 offline tests and green CI.

## In progress

- Muse digs on remaining unrecovered thumb ≤160B (`doom_keepA`/`doom_keepB`) and `doom_sweep3` (≤300B).
- Refresh `crew.union` as new MATCHes land; push every working step.

## Learned

- The face function (`fn_0801B298`, 1,164 bytes at -O3) is out of reach today: 2 attempts in 24 minutes, best
  0.7%, $0.52. Stopped at 12:49. The hero beat uses a function next to the face in the ROM (Lane D).
- Permuter on ≥90% near-misses closed 0 of 17; Muse digs on remaining unrecovered are the path up.

## Blocked

- Cartographer: SubQ `subq-preview` needs early access from the Subquadratic table.

## Next

- Keep digs alive through freeze; refresh and push union whenever LIVE > PUBLISHED.
- Pokémon Red coverage work QUEUED AFTER DOOM (union digs / demo freeze).
