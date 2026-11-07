import test from 'node:test';
import assert from 'node:assert/strict';
import http from 'node:http';
import { mkdtemp, mkdir, writeFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { once } from 'node:events';
import { createPlayerServer } from './serve.mjs';

test('one origin serves Stage, controller UI and player without exposing source files', async t => {
  const root = await mkdtemp(join(tmpdir(), 'creature-host-'));
  const stage = join(root, 'dist');
  await mkdir(join(stage, 'assets'), { recursive: true });
  await mkdir(join(stage, 'fonts'));
  for (const [path, body] of Object.entries({
    'index.html': '<h1>Player fixture</h1>', 'controls.js': '/* controller fixture */',
    'DISTRIBUTION.md': 'Status: unapproved', 'fixture.gba': 'fixture, not a game',
    'dist/index.html': '<script src="/assets/main.js"></script>',
    'dist/assets/main.js': '/* Stage fixture */', 'dist/fonts/demo.woff2': 'font fixture',
    'dist/assets/main.js.map': 'private source map', 'dist/private.json': 'private fixture',
  })) await writeFile(join(root, path), body);
  const server = createPlayerServer({ root, stage, rom: join(root, 'fixture.gba') });
  t.after(async () => {
    await new Promise(resolve => server.close(resolve));
    await rm(root, { recursive: true, force: true });
  });
  server.listen(0, '127.0.0.1');
  await once(server, 'listening');
  const request = (path, method = 'GET', headers = {}) => new Promise((resolve, reject) => {
    const req = http.request({ hostname: '127.0.0.1', port: server.address().port, path, method, headers }, res => {
      const chunks = [];
      res.on('data', chunk => chunks.push(chunk));
      res.on('end', () => resolve({ status: res.statusCode, headers: res.headers, body: Buffer.concat(chunks).toString() }));
    });
    req.on('error', reject); req.end();
  });
  for (const path of ['/', '/controls.js', '/stage/', '/assets/main.js', '/fonts/demo.woff2', '/game.gba']) {
    const res = await request(path);
    assert.equal(res.status, 200, path);
    assert.equal(res.headers['cross-origin-opener-policy'], 'same-origin');
    assert.equal(res.headers['cross-origin-embedder-policy'], 'require-corp');
  }
  const redirect = await request('/stage?replay=fixture');
  assert.equal(redirect.status, 308);
  assert.equal(redirect.headers.location, '/stage/?replay=fixture');
  assert.equal((await request('/controls.js', 'HEAD')).body, '');
  const asset = await request('/assets/main.js');
  assert.equal((await request('/assets/main.js', 'GET', { 'If-None-Match': asset.headers.etag })).status, 304);
  for (const path of ['/assets/main.js.map', '/private.json', '/stage/src/main.ts']) assert.equal((await request(path)).status, 404, path);
  for (const path of ['/assets/../private.json', '/assets/%2e%2e/private.json', '/assets/%5cprivate.js', '/%00', '/%zz']) assert.equal((await request(path)).status, 400, path);
  assert.equal((await request('/stage/', 'POST')).status, 405);
  const status = JSON.parse((await request('/status.json')).body);
  assert.equal(status.rom, true);
  assert.equal(status.build, null);
  assert.equal(status.distribution_approved, false);
});
