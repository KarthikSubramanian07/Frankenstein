// Side data the scenes need besides the event stream: viz map (subsystem regions), manifest
// (one cartridge cell per function), names.json (inferred names). All fetched from the stage server.

export type Region = { x: number; y: number; w: number; h: number }; // GBA pixels, 240x160
export type Subsystem = { id: string; label: string; region: Region; functions: string[] };
export type Cell = { id: string; game: boolean };

export type Side = {
  dir: string | null;
  subsystems: Subsystem[];
  fnToSub: Map<string, Subsystem>;
  cells: Cell[];
  names: Map<string, string>;
  fixture: boolean; // any side file marked fixture
  romSha1: string | null; // manifest game.rom_sha1: the original ROM
};

// Layout only (where on the GBA screen each part lives), used when viz_map has no region.
const DEFAULT_REGIONS: Record<string, Region> = {
  hud: { x: 0, y: 128, w: 240, h: 32 },
  weapons: { x: 60, y: 64, w: 120, h: 64 },
  enemies: { x: 0, y: 16, w: 240, h: 96 },
  world: { x: 0, y: 0, w: 240, h: 128 },
};
const FALLBACK_REGION: Region = { x: 0, y: 0, w: 240, h: 160 };

export function emptySide(): Side {
  return { dir: null, subsystems: [], fnToSub: new Map(), cells: [], names: new Map(), fixture: false, romSha1: null };
}

async function getJson(url: string): Promise<any | null> {
  try {
    const r = await fetch(url, { cache: 'no-store' });
    if (!r.ok) return null;
    return await r.json();
  } catch {
    return null;
  }
}

export async function loadSide(base: string, dir: string | null): Promise<Side> {
  const side = emptySide();
  side.dir = dir;
  const q = dir ? `?run=${encodeURIComponent(dir)}` : '';
  const [viz, man] = await Promise.all([getJson(`${base}/lab/viz_map${q}`), getJson(`${base}/lab/manifest${q}`)]);
  if (viz?.fixture || man?.fixture) side.fixture = true;
  for (const s of viz?.subsystems ?? []) {
    const sub: Subsystem = {
      id: String(s.id),
      label: String(s.label ?? s.id),
      region: s.region ?? DEFAULT_REGIONS[s.id] ?? FALLBACK_REGION,
      functions: Array.isArray(s.functions) ? s.functions : [],
    };
    side.subsystems.push(sub);
    for (const f of sub.functions) side.fnToSub.set(f, sub);
  }
  side.romSha1 = typeof man?.game?.rom_sha1 === 'string' ? man.game.rom_sha1 : null;
  const fns = Array.isArray(man?.functions) ? [...man.functions] : [];
  fns.sort((a: any, b: any) => parseInt(a.addr, 16) - parseInt(b.addr, 16));
  side.cells = fns.map((f: any) => ({ id: String(f.id), game: f.scope === 'game' }));
  if (dir) await refreshNames(base, side);
  return side;
}

export async function refreshNames(base: string, side: Side): Promise<void> {
  if (!side.dir) return;
  const n = await getJson(`${base}/runs/${encodeURIComponent(side.dir)}/names.json`);
  if (!n) return;
  if (n.fixture) side.fixture = true;
  const m = new Map<string, string>();
  for (const e of n.names ?? []) if (e?.fn && e?.name) m.set(String(e.fn), String(e.name));
  side.names = m;
}

/** Display name: inferred names are guesses (violet, "?"); otherwise the fn id. */
export function displayName(side: Side, fn: string): { text: string; guess: boolean } {
  const n = side.names.get(fn);
  if (n) return { text: n.replace(/_/g, ' ').toUpperCase() + '?', guess: true };
  return { text: fn, guess: false };
}
