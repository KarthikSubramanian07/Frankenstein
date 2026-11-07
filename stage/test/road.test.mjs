// ROAD: only the union or a fn.matched counts as recovered; a claim pulses until a result; close is never counted.
import test from 'node:test';
import assert from 'node:assert/strict';
import { emptyLive, roadApply, roadView, bandOf } from '../src/road_state.ts';
import { scanEvents } from '../server/road.mjs';

const base = {
  day_start: '2026-11-07T18:45:00.000Z', tz: 'America/Los_Angeles',
  union: { functions: 2, of: 5, bytes: 32, of_bytes: 3632, pct_bytes: 0.88, reverified_by_referee: true, target_rom_sha1: 'abc', fns: ['a', 'b'] },
  cells: [['a', 12], ['b', 20], ['c', 200], ['d', 400], ['e', 3000]],
  close: { fns: ['d'], threshold_pct: 90, label: 'close' },
  climb: [{ fn: 'b', ts: '2026-11-07T20:30:00.000Z', run: 'r2' }, { fn: 'a', ts: '2026-11-07T20:10:00.000Z', run: 'r1' }],
  runs: [{ id: 'r1', start: '2026-11-07T20:00:00.000Z', end: '2026-11-07T20:40:00.000Z', matched: 2, cost_usd: 1 }],
  totals: { runs: 1, cost_usd: 1, lies_caught: 3, fakes_rejected: 1, fakes_accepted: 0, first_run_start: '2026-11-07T20:00:00.000Z' },
};
const ev = (type, fn, min) => ({ type, fn, ts: new Date(Date.UTC(2026, 10, 7, 20, min)).toISOString(), payload: {} });

test('the union alone: counts, bytes, bands, climb, rate and cost', () => {
  const v = roadView(base, emptyLive());
  assert.equal(v.n, 2);
  assert.equal(v.of, 5);
  assert.equal(v.bytes, 32);
  assert.equal(v.ofBytes, 3632);
  assert.deepEqual(v.cells.map((c) => c.st), ['ok', 'ok', 'orig', 'close', 'orig']);
  assert.deepEqual(v.bands.map((b) => [b.got, b.total]), [[2, 2], [0, 1], [0, 1], [0, 1]]);
  assert.equal(v.close, 1);
  assert.deepEqual(v.climb, [Date.parse('2026-11-07T20:10:00.000Z'), Date.parse('2026-11-07T20:30:00.000Z')]);
  assert.equal(v.perHour, 4); // 2 functions, first run 20:00 to latest proof 20:30
  assert.equal(v.costPer, 0.5);
});

test('a claim pulses until its result; a new match flips the cell, ticks the count and grows the band', () => {
  const live = emptyLive();
  assert.deepEqual(roadApply(live, ev('fn.claimed', 'c', 50)), [{ kind: 'claimed', fn: 'c' }]);
  assert.equal(roadView(base, live).cells[2].st, 'dig');
  assert.equal(roadView(base, live).n, 2); // being dug is not recovered
  assert.deepEqual(roadApply(live, ev('fn.matched', 'c', 52)), [{ kind: 'matched', fn: 'c' }]);
  const v = roadView(base, live);
  assert.equal(v.cells[2].st, 'ok');
  assert.equal(v.n, 3);
  assert.equal(v.bytes, 232);
  assert.deepEqual(v.bands[1], { label: '121 to 300 B', got: 1, total: 1 });
  assert.equal(v.climb.length, 3);
  // a repeat match, or a match of something already in the union, changes nothing
  assert.deepEqual(roadApply(live, ev('fn.matched', 'c', 53)), []);
  roadApply(live, ev('fn.matched', 'a', 54));
  assert.equal(roadView(base, live).n, 3);
});

test('abandoned stops the pulse; a close function being dug is still not counted; hello resets the stream', () => {
  const live = emptyLive();
  roadApply(live, ev('fn.claimed', 'e', 1));
  assert.deepEqual(roadApply(live, ev('fn.abandoned', 'e', 2)), [{ kind: 'released', fn: 'e' }]);
  assert.equal(roadView(base, live).cells[4].st, 'orig');
  roadApply(live, ev('fn.claimed', 'd', 3));
  const v = roadView(base, live);
  assert.equal(v.cells[3].st, 'dig');
  assert.equal(v.close, 1);
  assert.equal(v.n, 2);
  roadApply(live, ev('fn.matched', 'zz', 4)); // not a game function: ignored
  assert.equal(roadView(base, live).n, 2);
  roadApply(live, { type: 'stage.hello' });
  assert.equal(live.digging.size + live.matched.size, 0);
});

test('size bands and the run scanner', () => {
  assert.deepEqual([120, 121, 300, 301, 1000, 1001].map(bandOf), [0, 1, 1, 2, 2, 3]);
  const lines = [
    { type: 'run.started', ts: '2026-11-07T20:00:00Z', payload: { game_id: 'doom' } },
    { type: 'verdict', fn: 'x', ts: '2026-11-07T20:01:00Z', payload: { match_pct: 91, claim_was_true: false } },
    { type: 'verdict', fn: 'x', ts: '2026-11-07T20:02:00Z', payload: { match_pct: 80, fake_rejected: true, attempt: 2 } },
    { type: 'fn.matched', fn: 'y', ts: '2026-11-07T20:03:00Z', payload: {} },
    { type: 'run.finished', ts: '2026-11-07T20:04:00Z', payload: { cost_usd: 0.4 } },
  ].map((e) => JSON.stringify(e));
  const sc = scanEvents(lines);
  assert.equal(sc.lies, 1);
  assert.equal(sc.fakes.size, 1);
  assert.equal(sc.best.get('x'), 91);
  assert.equal(sc.first.get('y'), '2026-11-07T20:03:00Z');
  assert.equal(sc.cost, 0.4);
  assert.equal(scanEvents([JSON.stringify({ type: 'fixture' })]).fixture, true);
});
