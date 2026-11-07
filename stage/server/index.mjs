// Stage event server (Lane C).
// http :7201  serves run files (metrics, names, viz map, manifest, memory probe)
// ws   :7202  tails runs/live/events.jsonl (follows symlink changes) or replays a finished run at 1-20x.
//
// Every event line goes to the browser unchanged (contracts section 8). The only messages the server
// writes itself are stage.hello (on connect / reset) and stage.end (replay finished).

import fs from 'node:fs';
import path from 'node:path';
import http from 'node:http';
import { fileURLToPath } from 'node:url';
import { WebSocketServer } from 'ws';
import { roadData } from './road.mjs';

const HERE = path.dirname(fileURLToPath(import.meta.url));
const REPO = path.resolve(HERE, '..', '..');

export function startServer(opts = {}) {
  const httpPort = Number(opts.httpPort ?? process.env.STAGE_HTTP_PORT ?? 7201);
  const wsPort = Number(opts.wsPort ?? process.env.STAGE_WS_PORT ?? 7202);
  const host = opts.host ?? '127.0.0.1';
  const runsDir = path.resolve(opts.runsDir ?? process.env.STAGE_RUNS_DIR ?? path.join(REPO, 'runs'));
  const repoDir = path.resolve(opts.repoDir ?? REPO);
  // Finished real runs published by the crew (contracts 7d) are listed next to runs/. runs/ wins on a name clash.
  const exportsDir = path.resolve(opts.exportsDir ?? process.env.STAGE_EXPORTS_DIR ?? path.join(REPO, 'crew', 'exports'));
  const roots = [runsDir, exportsDir];
  const pollMs = Number(opts.pollMs ?? 150);
  const log = opts.quiet ? () => {} : (...a) => console.log('[stage]', ...a);

  // a run id is one plain folder name: no "." or ".." (SECURITY.md, Lane C 1)
  const safeRun = (id) => (typeof id === 'string' && /^[A-Za-z0-9][\w.-]*$/.test(id) && !id.includes('..') ? id : null);
  // only the Stage page itself may read this server from a browser (SECURITY.md, Lane C 2)
  const origins = (process.env.STAGE_ORIGINS ?? 'http://127.0.0.1:5173,http://localhost:5173').split(',').map((o) => o.trim()).filter(Boolean);
  const runDir = (id) => {
    for (const r of roots) { const d = path.join(r, id); try { if (fs.statSync(d).isDirectory()) return d; } catch { /* next root */ } }
    return path.join(runsDir, id);
  };
  const runPath = (id, file) => path.join(runDir(id), file);
  const readJson = (p) => {
    try { return JSON.parse(fs.readFileSync(p, 'utf8')); } catch { return null; }
  };
  const isFixtureRun = (id) => {
    const m = readJson(runPath(id, 'metrics.json'));
    if (m && m.fixture) return true;
    try {
      const fd = fs.openSync(runPath(id, 'events.jsonl'), 'r');
      const buf = Buffer.alloc(64);
      fs.readSync(fd, buf, 0, 64, 0);
      fs.closeSync(fd);
      return /"type"\s*:\s*"fixture"/.test(buf.toString('utf8').split('\n')[0]);
    } catch { return false; }
  };
  const liveRunId = () => {
    try { return path.basename(fs.realpathSync(path.join(runsDir, 'live'))); } catch { return null; }
  };

  // lab files: real ones in lab/out, sample ones in contracts/fixtures. A fixture run always gets
  // the sample map (its fn ids come from the sample manifest); a real run gets the real one.
  const labFile = (name, runId) => {
    const real = path.join(repoDir, 'lab', 'out', `${name}.json`);
    const sample = path.join(repoDir, 'contracts', 'fixtures', `${name}.sample.json`);
    const wantSample = runId && isFixtureRun(runId);
    if (!wantSample && fs.existsSync(real)) return real;
    if (runId && !wantSample) return null; // a real run never gets sample data
    if (fs.existsSync(sample)) return sample;
    return fs.existsSync(real) ? real : null;
  };

  const isBench = (id) => {
    const m = readJson(runPath(id, 'metrics.json'));
    return /^bench/i.test(id) || /\bbench\b/i.test(m?.label ?? '') || m?.game_id === 'bench';
  };
  const listRuns = () => {
    const seen = new Set();
    const out = [];
    for (const root of roots) {
      let names = [];
      try { names = fs.readdirSync(root); } catch { continue; }
      for (const id of names.sort()) {
        if (id === 'live' || id.startsWith('.') || seen.has(id)) continue;
        try { if (!fs.statSync(path.join(root, id)).isDirectory()) continue; } catch { continue; }
        seen.add(id);
        out.push({
          id,
          source: root === runsDir ? 'runs' : 'exports',
          has_events: fs.existsSync(runPath(id, 'events.jsonl')),
          has_metrics: fs.existsSync(runPath(id, 'metrics.json')),
          has_names: fs.existsSync(runPath(id, 'names.json')),
          fixture: isFixtureRun(id),
          bench: isBench(id),
          live: liveRunId() === id,
        });
      }
    }
    return out;
  };

  // ---------- HTTP ----------
  const send = (res, code, body, type = 'application/json') => {
    res.writeHead(code, {
      'content-type': type,
      'access-control-allow-origin': res.allowOrigin ?? origins[0],
      vary: 'Origin',
      'cross-origin-resource-policy': 'cross-origin',
      'cache-control': 'no-store',
    });
    res.end(typeof body === 'string' ? body : JSON.stringify(body));
  };
  const sendFile = (res, p) => {
    if (!p || !fs.existsSync(p)) return send(res, 404, { error: 'not found' });
    send(res, 200, fs.readFileSync(p, 'utf8'), p.endsWith('.jsonl') ? 'application/x-ndjson' : 'application/json');
  };

  let roadCache = null;
  const httpServer = http.createServer((req, res) => {
    const url = new URL(req.url, `http://${host}`);
    res.allowOrigin = origins.includes(req.headers.origin) ? req.headers.origin : origins[0];
    const parts = url.pathname.split('/').filter(Boolean);
    const runParam = safeRun(url.searchParams.get('run') || '') || liveRunId();
    if (url.pathname === '/health') return send(res, 200, { ok: true, live: liveRunId(), runs_dir: runsDir });
    if (url.pathname === '/runs') return send(res, 200, { live: liveRunId(), runs: listRuns() });
    if (url.pathname === '/metrics') {
      // every runs/*/metrics.json, for the Time trial
      const all = listRuns().filter((r) => r.has_metrics)
        .map((r) => ({ dir: r.id, source: r.source, bench: r.bench, ...readJson(runPath(r.id, 'metrics.json')) }));
      return send(res, 200, { runs: all });
    }
    // ROAD scene (additive): the union of every recovered function, and the road summary built from it
    if (url.pathname === '/union') return sendFile(res, path.join(repoDir, 'crew', 'exports', 'union', 'UNION.json'));
    if (url.pathname === '/road') {
      if (!roadCache || Date.now() - roadCache.at > 5000) roadCache = { at: Date.now(), body: roadData({ repoDir, runsDir, exportsDir }) };
      return send(res, 200, roadCache.body);
    }
    if (parts[0] === 'runs' && parts.length === 3) {
      const id = parts[1] === 'live' ? liveRunId() : safeRun(parts[1]);
      const file = parts[2];
      if (!id || !['metrics.json', 'names.json', 'events.jsonl'].includes(file)) return send(res, 404, { error: 'not found' });
      return sendFile(res, runPath(id, file));
    }
    if (url.pathname === '/file') {
      // Lane D's QR image (phone.published.qr_png): only PNGs under creature/
      const rel = url.searchParams.get('path') || '';
      const abs = path.resolve(repoDir, rel);
      if (!abs.startsWith(path.join(repoDir, 'creature') + path.sep) || !abs.endsWith('.png') || !fs.existsSync(abs)) return send(res, 404, { error: 'not found' });
      res.writeHead(200, { 'content-type': 'image/png', 'access-control-allow-origin': res.allowOrigin, vary: 'Origin', 'cross-origin-resource-policy': 'cross-origin', 'cache-control': 'no-store' });
      return res.end(fs.readFileSync(abs));
    }
    if (parts[0] === 'lab' && parts.length === 2) {
      const name = parts[1].replace(/\.json$/, '');
      if (!['viz_map', 'manifest', 'memory_probe'].includes(name)) return send(res, 404, { error: 'not found' });
      return sendFile(res, labFile(name, runParam));
    }
    send(res, 404, { error: 'not found' });
  });
  httpServer.listen(httpPort, host);

  // ---------- WebSocket ----------
  const wss = new WebSocketServer({ port: wsPort, host });

  wss.on('connection', (ws, req) => {
    const url = new URL(req.url || '/', `ws://${host}`);
    const replayId = safeRun(url.searchParams.get('replay') || '');
    const speed = Math.min(20, Math.max(1, Number(url.searchParams.get('speed') || 1) || 1));
    const fromS = Math.max(0, Number(url.searchParams.get('t') || 0) || 0);
    const out = (s) => { if (ws.readyState === ws.OPEN) ws.send(s); };
    const timers = [];
    ws.on('close', () => timers.forEach((t) => clearInterval(t) || clearTimeout(t)));

    if (replayId) {
      const file = runPath(replayId, 'events.jsonl');
      if (!fs.existsSync(file)) {
        out(JSON.stringify({ type: 'stage.hello', mode: 'replay', run_id: replayId, backlog: 0, error: 'no events.jsonl' }));
        return;
      }
      const lines = fs.readFileSync(file, 'utf8').split('\n').filter((l) => l.trim());
      const tsOf = (l) => { try { const t = Date.parse(JSON.parse(l).ts); return Number.isFinite(t) ? t : null; } catch { return null; } };
      const t0 = lines.map(tsOf).find((t) => t != null) ?? 0;
      // events before t= seconds go out at once as backlog
      let i = 0;
      while (i < lines.length && ((tsOf(lines[i]) ?? t0) - t0) / 1000 < fromS) i++;
      out(JSON.stringify({ type: 'stage.hello', mode: 'replay', run_id: replayId, speed, from_s: fromS, backlog: i, total: lines.length }));
      for (let k = 0; k < i; k++) out(lines[k]);
      const startWall = Date.now();
      const startRun = t0 + fromS * 1000;
      log(`replay ${replayId} at ${speed}x from ${fromS}s (${lines.length} lines)`);
      const tick = setInterval(() => {
        const runNow = startRun + (Date.now() - startWall) * speed;
        while (i < lines.length && (tsOf(lines[i]) ?? runNow) <= runNow) out(lines[i++]);
        if (i >= lines.length) {
          clearInterval(tick);
          out(JSON.stringify({ type: 'stage.end', mode: 'replay', run_id: replayId }));
        }
      }, 40);
      timers.push(tick);
      return;
    }

    // live: tail runs/live/events.jsonl, follow the symlink, survive truncation
    let target = null;
    let offset = 0;
    let partial = '';
    const attach = () => {
      const live = path.join(runsDir, 'live');
      let real = null;
      try { real = fs.realpathSync(live); } catch { real = null; }
      const file = real ? path.join(real, 'events.jsonl') : null;
      target = file;
      offset = 0;
      partial = '';
      let text = '';
      try { text = file ? fs.readFileSync(file, 'utf8') : ''; } catch { text = ''; }
      const lastNl = text.lastIndexOf('\n');
      const complete = lastNl >= 0 ? text.slice(0, lastNl) : '';
      partial = lastNl >= 0 ? text.slice(lastNl + 1) : text;
      offset = Buffer.byteLength(text);
      const lines = complete.split('\n').filter((l) => l.trim());
      out(JSON.stringify({ type: 'stage.hello', mode: 'live', run_id: real ? path.basename(real) : null, backlog: lines.length }));
      lines.forEach(out);
      log(`live -> ${real ? path.basename(real) : '(none)'} backlog ${lines.length}`);
    };
    attach();
    let lastReal = target;
    const poll = setInterval(() => {
      let real = null;
      try { real = path.join(fs.realpathSync(path.join(runsDir, 'live')), 'events.jsonl'); } catch { real = null; }
      if (real !== lastReal) { lastReal = real; attach(); return; }
      if (!target) return;
      let size;
      try { size = fs.statSync(target).size; } catch { return; }
      if (size < offset) { attach(); return; } // truncated or replaced: rebuild from the full file
      if (size === offset) return;
      const fd = fs.openSync(target, 'r');
      const buf = Buffer.alloc(size - offset);
      fs.readSync(fd, buf, 0, buf.length, offset);
      fs.closeSync(fd);
      offset = size;
      const text = partial + buf.toString('utf8');
      const segs = text.split('\n');
      partial = segs.pop() ?? '';
      segs.filter((l) => l.trim()).forEach(out);
    }, pollMs);
    timers.push(poll);
  });

  log(`http http://${host}:${httpPort}  ws ws://${host}:${wsPort}  runs ${runsDir} + ${exportsDir}`);
  return {
    httpPort, wsPort,
    close: () => new Promise((r) => { wss.clients.forEach((c) => c.terminate()); wss.close(() => httpServer.close(() => r())); }),
  };
}

if (process.argv[1] && fileURLToPath(import.meta.url) === path.resolve(process.argv[1])) {
  startServer();
}
