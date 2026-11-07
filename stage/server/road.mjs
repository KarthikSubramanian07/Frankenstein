// Road to 100%: one read-only summary of how much of Doom is back, built only from files the crew wrote.
//
//   node stage/server/road.mjs            # prints the JSON (site/tools/sync_union.sh writes it to site/data/road.json)
//   GET http://127.0.0.1:7201/road        # the same, from the stage server (cached a few seconds)
//
// Sources, all read-only:
//   crew/exports/union/UNION.json        what is recovered and proven (the only source of "recovered" here)
//   lab/out/manifest.json                every game function: id, address, size (the 568 cells, in address order)
//   runs/*/events.jsonl, crew/exports/*/events.jsonl
//                                        when each union function was first proven (fn.matched ts), real false
//                                        claims caught, fakes rejected, and each run's spend
//   */metrics.json                       a finished run's cost_usd (falls back to the last cost_usd in its events)
//   crew/exports/union/CLOSE.json        the separate "close, not proven" tier (tools/close_tier.py); when it is
//                                        missing or older than UNION.json the same rule is applied here instead
// Runs are the ones crew/union.py counts: bench, smoke, fixture and underscore runs are skipped.
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const HERE = path.dirname(fileURLToPath(import.meta.url));
const REPO = path.resolve(HERE, '..', '..');
const SKIP = /^(bench|smoke|fx|r_fx|_)/; // same rule as crew/union.py
/** The hackathon started at 10:45 local (America/Los_Angeles, PST on Nov 7). The climb starts at 0 there. */
export const DAY_START = '2026-11-07T18:45:00.000Z';
export const TZ = 'America/Los_Angeles';

const readJson = (p) => { try { return JSON.parse(fs.readFileSync(p, 'utf8')); } catch { return null; } };

/** Every run folder the union counts, one per id (runs/ wins over crew/exports/ on a clash, like the server). */
function runDirs(roots) {
  const seen = new Map();
  for (const root of roots) {
    let names = [];
    try { names = fs.readdirSync(root).sort(); } catch { continue; }
    for (const id of names) {
      if (id === 'live' || id === 'union' || SKIP.test(id) || seen.has(id)) continue;
      const d = path.join(root, id);
      try { if (!fs.statSync(d).isDirectory() || fs.lstatSync(d).isSymbolicLink()) continue; } catch { continue; }
      seen.set(id, d);
    }
  }
  return seen;
}

/** Pure: one run's events -> first proof per fn, lies, fakes, spend, first/last ts. */
export function scanEvents(lines) {
  const out = { fixture: false, first: new Map(), best: new Map(), lies: 0, fakes: new Set(), cost: null, t0: null, t1: null, game: null };
  for (const l of lines) {
    if (!l.trim()) continue;
    let e;
    try { e = JSON.parse(l); } catch { continue; }
    if (e.type === 'fixture') { out.fixture = true; continue; }
    const p = e.payload ?? {};
    if (e.ts) { if (!out.t0 || e.ts < out.t0) out.t0 = e.ts; if (!out.t1 || e.ts > out.t1) out.t1 = e.ts; }
    if (e.type === 'run.started') {
      out.game = p.game_id ?? null;
      if (typeof p.label === 'string' && /\(sample\)|fixture/i.test(p.label)) out.fixture = true;
    }
    if (e.type === 'fn.matched' && e.fn && e.ts) { const was = out.first.get(e.fn); if (!was || e.ts < was) out.first.set(e.fn, e.ts); }
    if (e.type === 'verdict' && p.claim_was_true === false) out.lies++;
    if (e.type === 'verdict' && e.fn && typeof p.match_pct === 'number' && !(out.best.get(e.fn) >= p.match_pct)) out.best.set(e.fn, p.match_pct);
    if (e.type === 'verdict' && p.fake_rejected === true) out.fakes.add(`${e.fn}|${p.attempt}`);
    if (e.type === 'fakematch.rejected') out.fakes.add(`${e.fn}|${p.attempt}`);
    if ((e.type === 'metric.tick' || e.type === 'run.finished') && typeof p.cost_usd === 'number') out.cost = p.cost_usd;
  }
  return out;
}

export function roadData(opts = {}) {
  const repo = path.resolve(opts.repoDir ?? REPO);
  const roots = [path.resolve(opts.runsDir ?? path.join(repo, 'runs')), path.resolve(opts.exportsDir ?? path.join(repo, 'crew', 'exports'))];
  const union = readJson(opts.unionPath ?? path.join(repo, 'crew', 'exports', 'union', 'UNION.json'));
  const man = readJson(path.join(repo, 'lab', 'out', 'manifest.json'));
  const game = (man?.functions ?? []).filter((f) => f.scope === 'game').sort((a, b) => parseInt(a.addr, 16) - parseInt(b.addr, 16));
  const gameIds = new Set(game.map((f) => f.id));
  const proven = new Set((union?.rows ?? []).map((r) => r.fn));

  const first = new Map(); // fn -> { ts, run }
  const best = new Map(); // fn -> best match_pct over every verdict
  const runs = [];
  let lies = 0, fakes = 0, cost = 0;
  for (const [id, dir] of runDirs(roots)) {
    let text = '';
    try { text = fs.readFileSync(path.join(dir, 'events.jsonl'), 'utf8'); } catch { continue; }
    const sc = scanEvents(text.split('\n'));
    if (sc.fixture || (sc.game && sc.game !== 'doom')) continue;
    const m = readJson(path.join(dir, 'metrics.json'));
    if (m?.fixture) continue;
    const spend = typeof m?.cost_usd === 'number' ? m.cost_usd : sc.cost ?? 0;
    cost += spend;
    lies += sc.lies;
    fakes += sc.fakes.size;
    for (const [fn, pct] of sc.best) if (!(best.get(fn) >= pct)) best.set(fn, pct);
    let mine = 0;
    for (const [fn, ts] of sc.first) {
      if (!gameIds.has(fn)) continue;
      mine++;
      const was = first.get(fn);
      if (!was || ts < was.ts) first.set(fn, { ts, run: id });
    }
    runs.push({ id, start: sc.t0, end: sc.t1, matched: mine, cost_usd: Math.round(spend * 1e4) / 1e4 });
  }
  runs.sort((a, b) => String(a.start).localeCompare(String(b.start)));
  // the climb: only union functions (proven and re-verified), at the moment each was first proven
  const climb = [...proven].map((fn) => ({ fn, ts: first.get(fn)?.ts ?? null, run: first.get(fn)?.run ?? null }))
    .filter((c) => c.ts).sort((a, b) => a.ts.localeCompare(b.ts));
  // close, not proven: never in the union, never fn.matched, best attempt >= 90% (tools/close_tier.py, same rule)
  const unionPath = opts.unionPath ?? path.join(repo, 'crew', 'exports', 'union', 'UNION.json');
  const closePath = path.join(repo, 'crew', 'exports', 'union', 'CLOSE.json');
  const mtime = (p) => { try { return fs.statSync(p).mtimeMs; } catch { return 0; } };
  const closeFile = mtime(closePath) >= mtime(unionPath) ? readJson(closePath) : null;
  const close = closeFile?.rows
    ? closeFile.rows.map((r) => r.fn).filter((fn) => gameIds.has(fn) && !proven.has(fn))
    : [...best].filter(([fn, pct]) => pct >= 90 && gameIds.has(fn) && !proven.has(fn) && !first.has(fn)).map(([fn]) => fn);
  const firstStart = runs.find((r) => r.start)?.start ?? null;
  return {
    v: 1,
    generated_at: new Date().toISOString(),
    day_start: DAY_START,
    tz: TZ,
    union: union ? {
      functions: union.functions, of: union.of, pct_functions: union.pct_functions,
      bytes: union.bytes, of_bytes: union.of_bytes, pct_bytes: union.pct_bytes,
      reverified_by_referee: union.reverified_by_referee, rejected_on_reverify: (union.rejected_on_reverify ?? []).length,
      target_rom_sha1: union.target_rom_sha1, fns: [...proven],
    } : null,
    // [id, size] for every game function, in address order: the 568 cells
    cells: game.map((f) => [f.id, Number(f.size) || 0]),
    close: { fns: close, threshold_pct: 90, source: closeFile ? 'crew/exports/union/CLOSE.json' : 'computed', label: 'close = best attempt ≥90% byte-match, not accepted, not counted' },
    climb,
    unclocked: [...proven].filter((fn) => !first.has(fn)).length, // proven, but no fn.matched ts found
    runs,
    totals: { runs: runs.length, cost_usd: Math.round(cost * 100) / 100, lies_caught: lies, fakes_rejected: fakes, fakes_accepted: 0, first_run_start: firstStart },
  };
}

if (process.argv[1] && fileURLToPath(import.meta.url) === path.resolve(process.argv[1])) {
  process.stdout.write(JSON.stringify(roadData(), null, 1) + '\n');
}
