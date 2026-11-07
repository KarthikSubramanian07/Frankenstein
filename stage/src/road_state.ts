// Road to 100%: pure state for the ROAD scene (no DOM, so node tests can run it).
// "Recovered" means one thing here: in crew/exports/union/UNION.json (proven and re-verified) or a fn.matched
// event in the stream. "Being dug" means a fn.claimed in the stream with no fn.matched or fn.abandoned yet.
// Everything else is still original code, not yet recovered.

/** What GET :7201/road returns (stage/server/road.mjs). */
export type RoadBase = {
  day_start: string;
  tz: string;
  union: { functions: number; of: number; bytes: number; of_bytes: number; pct_bytes: number; reverified_by_referee: boolean; target_rom_sha1: string | null; fns: string[] } | null;
  cells: [string, number][];
  close?: { fns: string[]; threshold_pct: number; label: string };
  climb: { fn: string; ts: string; run: string | null }[];
  runs: { id: string; start: string | null; end: string | null; matched: number; cost_usd: number }[];
  totals: { runs: number; cost_usd: number; lies_caught: number; fakes_rejected: number; fakes_accepted: number; first_run_start: string | null };
};

export type RoadLive = {
  matched: Map<string, number>; // fn -> ts (ms) of fn.matched in this stream
  digging: Map<string, number>; // fn -> ts (ms) of fn.claimed, still open
};

export type RoadFx = { kind: 'claimed' | 'matched' | 'released'; fn: string };

export const emptyLive = (): RoadLive => ({ matched: new Map(), digging: new Map() });

const ms = (ts: unknown): number => { const t = Date.parse(String(ts ?? '')); return Number.isFinite(t) ? t : 0; };

/** Apply one stream event. Mutates `r`, returns what changed (for animation). */
export function roadApply(r: RoadLive, e: { type: string; fn?: string | null; ts?: string; payload?: any }): RoadFx[] {
  if (!e || typeof e.type !== 'string') return [];
  const fn = e.fn ?? '';
  switch (e.type) {
    case 'stage.hello': r.matched.clear(); r.digging.clear(); return [];
    case 'fn.claimed':
      if (!fn || r.matched.has(fn)) return [];
      r.digging.set(fn, ms(e.ts));
      return [{ kind: 'claimed', fn }];
    case 'fn.matched': {
      if (!fn) return [];
      r.digging.delete(fn);
      if (r.matched.has(fn)) return [];
      r.matched.set(fn, ms(e.ts));
      return [{ kind: 'matched', fn }];
    }
    case 'fn.abandoned':
      if (!fn || !r.digging.delete(fn)) return [];
      return [{ kind: 'released', fn }];
  }
  return [];
}

export const BANDS: { label: string; lo: number; hi: number }[] = [
  { label: 'up to 120 B', lo: 0, hi: 120 },
  { label: '121 to 300 B', lo: 121, hi: 300 },
  { label: '301 to 1,000 B', lo: 301, hi: 1000 },
  { label: 'over 1,000 B', lo: 1001, hi: Infinity },
];
export const bandOf = (size: number) => BANDS.findIndex((b) => size >= b.lo && size <= b.hi);

/** ok = recovered and proven; dig = being dug now; close = best attempt >= 90%, NOT recovered; orig = still original */
export type CellState = 'ok' | 'dig' | 'close' | 'orig';
export type RoadView = {
  n: number; close: number; of: number; bytes: number; ofBytes: number; pctFns: number; pctBytes: number;
  cells: { id: string; size: number; st: CellState }[];
  bands: { label: string; got: number; total: number }[];
  climb: number[]; // ms timestamps, one per recovered function, ascending
  perHour: number | null; // recovered functions per hour, first run start -> latest proof
  costPer: number | null; // Muse spend across runs / recovered functions
  lies: number; fakesRejected: number; fakesAccepted: number; runs: number; costUsd: number;
  digging: number;
};

/** Everything the scene draws, from the files plus this stream. */
export function roadView(base: RoadBase | null, live: RoadLive): RoadView {
  const proven = new Set(base?.union?.fns ?? []);
  const cellsIn = base?.cells ?? [];
  const near = new Set(base?.close?.fns ?? []);
  const inGame = new Set(cellsIn.map((c) => c[0]));
  const climb = (base?.climb ?? []).map((c) => ms(c.ts)).filter(Boolean);
  for (const [fn, t] of live.matched) {
    if (proven.has(fn) || !inGame.has(fn)) continue; // already counted, or not a game function
    proven.add(fn);
    climb.push(t);
  }
  climb.sort((a, b) => a - b);
  const bands = BANDS.map((b) => ({ label: b.label, got: 0, total: 0 }));
  let bytes = 0, ofBytes = 0;
  const cells = cellsIn.map(([id, size]) => {
    const st: CellState = proven.has(id) ? 'ok' : live.digging.has(id) ? 'dig' : near.has(id) ? 'close' : 'orig';
    const k = bandOf(size);
    bands[k].total++;
    ofBytes += size;
    if (st === 'ok') { bands[k].got++; bytes += size; }
    return { id, size, st };
  });
  const n = cells.filter((c) => c.st === 'ok').length;
  const of = cells.length;
  const close = cells.filter((c) => c.st === 'close' || (c.st === 'dig' && near.has(c.id))).length; // never added to n
  const t0 = ms(base?.totals.first_run_start);
  const hours = t0 && climb.length ? (climb[climb.length - 1] - t0) / 3.6e6 : 0;
  const t = base?.totals;
  return {
    n, close, of, bytes, ofBytes,
    pctFns: of ? (100 * n) / of : 0,
    pctBytes: ofBytes ? (100 * bytes) / ofBytes : 0,
    cells, bands, climb,
    perHour: hours > 0.05 ? climb.length / hours : null,
    costPer: t && n ? t.cost_usd / n : null,
    lies: t?.lies_caught ?? 0, // from the run files (the live run's file included), so the stream never double-counts
    fakesRejected: t?.fakes_rejected ?? 0,
    fakesAccepted: t?.fakes_accepted ?? 0,
    runs: t?.runs ?? 0,
    costUsd: t?.cost_usd ?? 0,
    digging: cells.filter((c) => c.st === 'dig').length,
  };
}
