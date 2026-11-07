// The judgment rail: every line comes from a real event field, and the reducer cases are additive.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { emptyState, apply } from '../src/state.ts';
import { museCounts } from '../src/judgment.ts';

const read = (rel) => fs.readFileSync(new URL(rel, import.meta.url), 'utf8').split('\n').filter(Boolean).map((l) => JSON.parse(l));
const REAL = '../../crew/exports/doom_r01/events.jsonl';
const FIXTURE = '../../contracts/fixtures/events.sample.jsonl';

const run = (events) => {
  const s = emptyState();
  const lines = [];
  for (const e of events) for (const f of apply(s, e)) if (f.kind === 'judgment') lines.push(f.line);
  return { s, lines };
};
const plain = (html) => html.replace(/<[^>]+>/g, '');
const base = { v: 1, ts: '2026-11-07T20:00:00.000Z', run_id: 'r_t', seq: 1, actor: 'scheduler', fn: null };
const started = (extra = {}) => ({ ...base, type: 'run.started', payload: { label: 'doom · train', split: 'train', library: 'learning', diggers: 2, model: 'muse-spark-1.3', budget_usd: 1, game_id: 'doom', fn_total: 3, escalation_model: 'muse-wonder-1.0', ...extra } });
const snap = (payload, fn = null) => ({ ...base, type: 'snap.decision', fn, payload });

test('real doom_r01: one line per Snap decision, values straight from the events', () => {
  const events = read(REAL);
  const { s, lines } = run(events);
  const decisions = events.filter((e) => e.type === 'snap.decision');
  assert.equal(lines.filter((l) => l.sponsor === 'snap').length, decisions.length);
  const tri = events.find((e) => e.payload.op === 'triage');
  assert.equal(plain(lines[0].text), `READ ALL ${tri.payload.functions} FUNCTIONS · ${(tri.payload.latency_ms / 1000).toFixed(1)} S`);
  const esc = decisions.filter((e) => e.payload.action === 'escalate');
  const escLines = lines.filter((l) => l.op === 'decide');
  assert.equal(escLines.length, esc.length);
  assert.equal(plain(escLines[0].text), `ESCALATE TO MUSE WONDER · ${esc[0].payload.confidence.toFixed(2)}`);
  const reviews = decisions.filter((e) => e.payload.op === 'review');
  const rv = lines.filter((l) => l.op === 'review');
  assert.equal(rv.length, reviews.length);
  rv.forEach((l, i) => assert.ok(plain(l.text).startsWith(`FAKE? ${reviews[i].payload.fakematch_p.toFixed(2)}`)));
  // doom_r01's library was local JSON (metrics library_backend), so nothing is credited to MongoDB
  assert.equal(lines.filter((l) => l.sponsor === 'mongodb').length, 0);
  // the Muse counter equals a recount of attempt.submitted payload.model
  const want = {};
  for (const e of events) if (e.type === 'attempt.submitted' && e.payload.model) want[e.payload.model] = (want[e.payload.model] ?? 0) + 1;
  assert.deepEqual(Object.fromEntries(museCounts(s).map((c) => [c.model, c.n])), want);
  assert.deepEqual(museCounts(s).map((c) => c.short), ['SPARK', 'WONDER']);
});

test('fixture: idiom.judged gives HABIT KEPT and HABIT RETIRED with the title', () => {
  const events = read(FIXTURE);
  const { lines } = run(events);
  const judged = events.filter((e) => e.type === 'idiom.judged');
  const got = lines.filter((l) => l.op === 'judged');
  assert.equal(got.length, judged.length);
  for (const [i, e] of judged.entries()) {
    const word = e.payload.status === 'adopted' ? 'HABIT KEPT' : 'HABIT RETIRED';
    assert.ok(plain(got[i].text).startsWith(`${word}: ${e.payload.title.toUpperCase().slice(0, 10)}`), got[i].text);
    assert.equal(got[i].sponsor, 'library'); // the fixture run doesn't say its library is on Atlas
  }
});

test('MongoDB is named only when run.started says the library is on Atlas', () => {
  const learned = { ...base, type: 'idiom.learned', payload: { idiom_id: 'idm_1', title: 'zero return stub', applies_when: 'x' } };
  const judged = { ...base, type: 'idiom.judged', payload: { idiom_id: 'idm_1', status: 'adopted', tries: 3, wins: 3, rate: 1, baseline: 0.6, title: 'zero return stub' } };
  const local = run([started({ library_backend: 'local-json' }), learned, judged]).lines;
  assert.deepEqual(local.map((l) => l.sponsor), ['library']); // learned is left to the ticker
  const atlas = run([started({ library_backend: 'mongodb' }), learned, judged]).lines;
  assert.deepEqual(atlas.map((l) => [l.sponsor, plain(l.text)]), [['mongodb', 'LEARNED: ZERO RETURN STUB'], ['mongodb', 'HABIT KEPT: ZERO RETURN STUB']]);
});

test('Gemini reviews are the second opinion; route, eyes and director read their own fields', () => {
  const { s, lines } = run([
    started({ label: 'asi:one job j_1' }),
    snap({ op: 'route', query: "bring back Doomguy's face", fns: ['fn_0801B298', 'fn_08000A1C'], p: { fn_0801B298: 0.88, fn_08000A1C: 0.2 } }),
    snap({ op: 'review', reviewer: 'gemini', fakematch_p: 0.02, recital_p: 0.01, latency_ms: 900 }),
    snap({ op: 'review', reviewer: 'snap', fakematch_p: 0.91, recital_p: 0.01, latency_ms: 500 }),
    snap({ op: 'director', fns: ['fn_0801B298'], confidence: 0.83, visible_p: 0.9, latency_ms: 2400 }, 'fn_0801B298'),
    snap({ op: 'director', fns: ['fn_08000A1C'], confidence: 0.0, fallback: 'hottest', latency_ms: 10 }),
    snap({ op: 'eyes', changed_as_claimed_p: 0.999, otherwise_same_p: 0.996, latency_ms: 680 }),
    snap({ op: 'decide_next', action: 'abandon', confidence: 0.71 }, 'fn_08005008'),
  ]);
  assert.deepEqual(lines.map((l) => [l.sponsor, plain(l.text)]), [
    ['snap', 'ROUTED → fn_0801B298 · P 0.88'],
    ['gemini', 'SECOND OPINION · FAKE? 0.02 · CLEAN'],
    ['snap', 'FAKE? 0.91 · FLAGGED'],
    ['snap', 'PLAY → fn_0801B298 NEXT · 0.83'],
    ['snap', 'PLAY → fn_08000A1C NEXT'], // a fallback pick is not Snap's call: no confidence
    ['snap', 'EYES: CHANGE CONFIRMED · 1.00'],
    ['snap', 'ABANDON fn_08005008 · 0.71'],
  ]);
  assert.deepEqual(s.judge.asi, { query: "bring back Doomguy's face", label: 'asi:one job j_1' });
});

test('missing fields mean a shorter line or none, never a made-up value', () => {
  const { s, lines } = run([
    started({ escalation_model: null }),
    snap({ op: 'decide_next', action: 'escalate' }),
    snap({ op: 'review' }),
    snap({ op: 'route', query: 'face', fns: [] }),
    snap({ op: 'triage', latency_ms: 10 }),
    { ...base, type: 'idiom.judged', payload: { idiom_id: 'idm_9', status: 'candidate' } },
  ]);
  assert.deepEqual(lines.map((l) => plain(l.text)), ['ESCALATE']);
  assert.equal(s.judge.asi?.query, 'face'); // the words were asked even if no function came back
  assert.equal(run([started()]).s.judge.asi, null); // not an ASI:One run, no chip
});

test('stage.hello clears the rail with the rest of the state', () => {
  const s = emptyState();
  for (const e of read(REAL)) apply(s, e);
  assert.ok(s.judge.lines.length > 0);
  apply(s, { type: 'stage.hello', mode: 'live', backlog: 0 });
  assert.equal(s.judge.lines.length, 0);
  assert.equal(s.judge.asi, null);
});
