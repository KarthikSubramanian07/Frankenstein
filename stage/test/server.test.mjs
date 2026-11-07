// The server forwards every line unchanged: backlog, live tail, and replay.
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import WebSocket from 'ws';
import { startServer } from '../server/index.mjs';

const line = (seq, ms) => JSON.stringify({ v: 1, ts: new Date(Date.UTC(2026, 10, 7, 19, 0, 0, ms)).toISOString(), run_id: 't', seq, type: 'narration', actor: 'archivist', fn: null, payload: { text: `line ${seq}` } });

function collect(url, until) {
  return new Promise((resolve, reject) => {
    const got = [];
    const ws = new WebSocket(url);
    const t = setTimeout(() => { ws.close(); reject(new Error(`timeout, got ${got.length}`)); }, 8000);
    ws.on('message', (m) => {
      got.push(String(m));
      if (until(got, ws)) { clearTimeout(t); ws.close(); resolve(got); }
    });
    ws.on('error', reject);
  });
}

test('live tail and replay forward lines unchanged', async () => {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'stage-'));
  fs.mkdirSync(path.join(dir, 'r1'));
  const lines = Array.from({ length: 40 }, (_, i) => line(i + 1, i * 100));
  const file = path.join(dir, 'r1', 'events.jsonl');
  fs.writeFileSync(file, lines.slice(0, 30).join('\n') + '\n');
  fs.symlinkSync('r1', path.join(dir, 'live'));
  const srv = startServer({ httpPort: 17201, wsPort: 17202, runsDir: dir, quiet: true, pollMs: 50 });
  try {
    // live: hello + 30 backlog lines, then 10 appended lines
    const live = collect('ws://127.0.0.1:17202/', (got) => {
      if (got.length === 31) fs.appendFileSync(file, lines.slice(30).join('\n') + '\n');
      return got.length === 41;
    });
    const got = await live;
    const hello = JSON.parse(got[0]);
    assert.equal(hello.type, 'stage.hello');
    assert.equal(hello.backlog, 30);
    assert.deepEqual(got.slice(1), lines);

    // replay at 20x: 3.9 s of run in about 0.2 s, every line in order, then stage.end
    const rep = await collect('ws://127.0.0.1:17202/?replay=r1&speed=20', (g) => JSON.parse(g[g.length - 1]).type === 'stage.end');
    assert.equal(JSON.parse(rep[0]).mode, 'replay');
    assert.deepEqual(rep.slice(1, -1), lines);
  } finally {
    await srv.close();
    fs.rmSync(dir, { recursive: true, force: true });
  }
});
