// Counters on screen must equal a recomputation from the event file.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import { emptyState, apply } from '../src/state.ts';

const FILE = new URL('../../contracts/fixtures/events.sample.jsonl', import.meta.url);
const events = fs.readFileSync(FILE, 'utf8').split('\n').filter(Boolean).map((l) => JSON.parse(l));

test('state counters equal a recomputation from the fixture file', () => {
  const s = emptyState();
  const effects = [];
  apply(s, { type: 'stage.hello', mode: 'replay', speed: 20, backlog: 0 });
  for (const e of events) effects.push(...apply(s, e));
  const matched = new Set(events.filter((e) => e.type === 'fn.matched').map((e) => e.fn));
  const lies = events.filter((e) => e.type === 'verdict' && e.payload.claim_was_true === false);
  assert.equal(s.matched.length, matched.size);
  assert.equal(s.falseClaims.length, lies.length);
  assert.equal(s.attempts, events.filter((e) => e.type === 'attempt.submitted').length);
  assert.equal(s.lintFails, events.filter((e) => e.type === 'verdict' && e.payload.status === 'LINT_FAIL').length);
  assert.equal(s.fixture, true);
  const fin = events.find((e) => e.type === 'run.finished');
  assert.equal(s.matched.length, fin.payload.matched);
  // Versus opens for every false claim and only then
  assert.equal(effects.filter((f) => f.kind === 'falseClaim').length, lies.length);
});

test('stage.hello resets state so a reconnect rebuilds from the full file', () => {
  const s = emptyState();
  for (const e of events) apply(s, e);
  apply(s, { type: 'stage.hello', mode: 'live', backlog: events.length });
  assert.equal(s.matched.length, 0);
  for (const e of events) apply(s, e);
  assert.equal(s.matched.length, new Set(events.filter((e) => e.type === 'fn.matched').map((e) => e.fn)).size);
});
