// Scene 3: Time trial. Reads every run's metrics.json (runs/ and crew/exports/) and the lab memory probe.
// Nothing typed by hand: every number is a field of one of those files, labelled with its run.
// Real runs hide the samples; bench runs are labelled bench and never raced against Doom.
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';

type Run = {
  dir: string; run_id?: string; label?: string; split?: string; library?: string; model?: string; bench?: boolean;
  fn_total?: number; matched?: number; match_rate?: number; minutes_per_match?: number; cost_per_match_usd?: number;
  false_claims_caught?: number; fakematches_rejected?: number; cost_usd?: number; fixture?: boolean;
  muse?: { calls?: number; tool_calls?: number; image_calls?: number; cost_usd?: number; by_model?: Record<string, { calls?: number; cost_usd?: number }> };
  snap?: { on?: boolean; model?: string; snap_calls?: number; latency_ms_mean?: number; cost_usd?: number };
};
type Car = { run: Run; role: 'you' | 'ghost' | 'subq'; tag: string };

const n0 = (x: number | undefined) => (x == null ? '--' : Math.round(x).toLocaleString('en-US'));
const pct = (x: number | undefined) => (x == null ? '--' : `${Math.round(x * 100)}%`);
const money = (x: number | undefined) => (x == null ? '--' : `$${x < 1 ? x.toFixed(3) : x.toFixed(2)}`);
const modelName = (m?: string) => (m ?? 'model').replace(/-/g, ' ').toUpperCase();
const runName = (r: Run) => r.dir.toUpperCase();

export class TimeTrialScene implements Scene {
  id = 'timetrial' as const;
  el = h('section', 'scene timetrial');
  private runs: Run[] = []; // real runs when any exist, else the samples
  private isSample = false;
  private probe: any = null;
  private gameTotal = 0;
  private loaded = false;
  private cv: HTMLCanvasElement;
  private raf = 0;
  private cars: Car[] = [];
  private base: string;
  private reduced = false;

  constructor(base: string) {
    this.base = base;
    this.el.innerHTML = `
      <div class="sky"><div class="sun"></div></div>
      <canvas class="road" width="1920" height="580"></canvas>
      <div class="tt-title">TIME TRIAL</div>
      <div class="laps"><div class="lh"><span>LAP BOARD</span><span>MATCH</span><span>MIN</span><span>COST</span></div><div data-k="laps"></div><div class="unit">PER RECOVERED FUNCTION</div></div>
      <div class="gauge" data-k="gauge"></div>
      <div class="plates" data-k="plates"></div>`;
    this.cv = this.el.querySelector('canvas')!;
    void this.load();
    setInterval(() => void this.load(), 10000);
  }

  sample() { return this.loaded ? this.isSample : null; }

  private async json(path: string) {
    try { const r = await fetch(`${this.base}${path}`, { cache: 'no-store' }); return r.ok ? await r.json() : null; } catch { return null; }
  }

  async load() {
    const m = await this.json('/metrics');
    if (!m) return; // server down: keep the last numbers
    const all: Run[] = Array.isArray(m.runs) ? m.runs : [];
    const real = all.filter((r) => !r.fixture);
    this.isSample = !real.length;
    this.runs = real.length ? real : all;
    // the memory probe and the game size come from the real lab files for a real run, samples otherwise
    const anchor = this.runs.find((r) => !r.bench) ?? this.runs[0];
    const q = anchor ? `?run=${encodeURIComponent(anchor.dir)}` : '';
    const [probe, man] = await Promise.all([this.json(`/lab/memory_probe${q}`), this.json(`/lab/manifest${q}`)]);
    this.probe = probe;
    this.gameTotal = Array.isArray(man?.functions) ? man.functions.filter((f: any) => f.scope === 'game').length : 0;
    this.loaded = true;
    this.draw();
  }

  enter(ctx: Ctx) {
    this.reduced = ctx.reduced;
    this.draw();
    cancelAnimationFrame(this.raf);
    const loop = (t: number) => { this.drawRoad(t); if (!this.reduced) this.raf = requestAnimationFrame(loop); };
    this.raf = requestAnimationFrame(loop);
  }
  leave() { cancelAnimationFrame(this.raf); }
  render() { /* data comes from files, drawn on load */ }

  /** Doom runs only (bench is never raced against Doom). Held-out: library on = you, off = ghost. */
  private pickCars(): Car[] {
    const doom = this.runs.filter((r) => !r.bench);
    const held = doom.filter((r) => r.split === 'heldout');
    const pool = held.length ? held : doom;
    const last = (f: (r: Run) => boolean) => [...pool].reverse().find(f);
    const subq = held.length ? last((r) => /subq|cartographer/i.test(r.label ?? '')) : undefined;
    const on = held.length ? last((r) => r.library === 'on' && r !== subq) : undefined;
    const off = held.length ? last((r) => r.library === 'off') : undefined;
    const cars: Car[] = [];
    if (on) cars.push({ run: on, role: 'you', tag: 'LIBRARY ON' });
    if (off) cars.push({ run: off, role: 'ghost', tag: 'GHOST: LIBRARY OFF' });
    if (subq) cars.push({ run: subq, role: 'subq', tag: 'SUBQ CARTOGRAPHER' });
    const latest = [...pool].reverse()[0];
    if (!cars.length && latest) cars.push({ run: latest, role: 'you', tag: runName(latest) });
    return cars;
  }

  private draw() {
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    this.cars = this.pickCars();
    const you = this.cars.find((c) => c.role === 'you');
    const ghost = this.cars.find((c) => c.role === 'ghost');
    // lap board: every run is a lap; the lap record only compares Doom runs on the same split
    const timed = this.runs.filter((r) => !r.bench && r.split === you?.run.split && (r.matched ?? 0) > 0 && r.minutes_per_match != null);
    const best = timed.reduce<Run | null>((b, r) => (!b || r.minutes_per_match! < b.minutes_per_match! ? r : b), null);
    q('laps').innerHTML = this.runs.length
      ? this.runs.slice(-5).map((r) => {
          const isBest = r === best && timed.length > 1;
          const tag = r.bench ? '<em>NOT DOOM</em>' : esc((r.split ?? '').toUpperCase());
          return `<div class="lap${isBest ? ' best' : ''}${r.bench ? ' bench' : ''}"><span>${esc(runName(r))} <small>${tag}</small></span><span>${n0(r.matched)}/${n0(r.fn_total)}</span><span>${r.minutes_per_match?.toFixed(2) ?? '--'}</span><span>${money(r.cost_per_match_usd)}</span></div>${isBest ? '<div class="rec">NEW LAP RECORD</div>' : ''}`;
        }).join('')
      : '<div class="lap"><span>NO FINISHED RUNS YET</span></div>';

    // gauge: the held-out race when there is one; otherwise this run's rate, with its scope stated
    const scope = you && this.gameTotal && !you.run.bench ? `<div class="gg">${n0(you.run.matched)} OF ${n0(this.gameTotal)} DOOM FUNCTIONS</div>` : '';
    q('gauge').innerHTML = you
      ? `<div class="gl">${ghost ? 'HELD-OUT RECOVERED' : `MATCHED IN ${esc(runName(you.run))}`}</div>
         <div class="gv">${pct(you.run.match_rate)}</div>
         <div class="gs">${n0(you.run.matched)}/${n0(you.run.fn_total)} TRIED${ghost ? ` · ${esc(you.tag)}` : ''}</div>
         ${ghost ? `<div class="gg">GHOST ${pct(ghost.run.match_rate)} · ${n0(ghost.run.matched)}/${n0(ghost.run.fn_total)} · ${esc(runName(ghost.run))}</div>` : scope}`
      : '<div class="gl">NO RUNS YET</div>';

    // plates: Muse writes it, Snap judges it, the compiler proves it (+ the memory test once the lab runs it)
    const r = you?.run;
    const plates: string[] = [];
    const by = r?.muse?.by_model;
    if (r && by && Object.keys(by).length) {
      const parts = Object.entries(by).map(([m, v]) => `${esc(modelName(m))} ${n0(v.calls)} CALLS ${money(v.cost_usd)}`);
      plates.push(`<div class="plate muse"><b>MUSE WRITES IT</b> ${parts.join(' · ')}</div>`);
    } else if (r?.muse) {
      plates.push(`<div class="plate muse"><b>MUSE WRITES IT</b> ${esc(modelName(r.model))}: ${n0(r.muse.calls)} CALLS, ${money(r.muse.cost_usd)}</div>`);
    }
    if (r?.snap?.on) {
      plates.push(`<div class="plate snap"><b>SNAP JUDGES IT</b> SUBQ SNAP ${n0(r.snap.snap_calls)} DECISIONS · ${n0(r.snap.latency_ms_mean)} MS EACH · ${money(r.snap.cost_usd)}</div>`);
    }
    if (r) {
      plates.push(`<div class="plate proof"><b>COMPILER PROVES IT</b> ${n0(r.matched)} BYTE-IDENTICAL · ${n0(r.false_claims_caught)} LIES CAUGHT · ${n0(r.fakematches_rejected)} FAKES REJECTED</div>`);
    }
    const p = this.probe;
    if (p?.unmodified && p?.variant && (this.isSample || !p.fixture)) {
      plates.push(`<div class="plate"><b>MEMORY TEST</b> ${n0(p.fn_count)} FUNCTIONS FROM MEMORY: <em>${n0(p.unmodified.matched)}</em> MATCH REAL DOOM, <em>${n0(p.variant.matched)}</em> MATCH OUR VARIANT</div>`);
    }
    q('plates').innerHTML = plates.join('');
    this.drawRoad(performance.now());
  }

  // ---------- road + cars (canvas) ----------
  private drawRoad(t: number) {
    const g = this.cv.getContext('2d')!;
    const W = 1920, H = 580, cx = 960;
    g.clearRect(0, 0, W, H);
    g.fillStyle = '#1a1040';
    g.fillRect(0, 0, W, H);
    const scroll = this.reduced ? 0 : (t / 1000) * 1.4;
    // perspective rows: z from 1 (horizon) to 0 (bottom)
    for (let y = 0; y < H; y += 4) {
      const d = y / H; // 0 at horizon
      const half = 40 + d * 880;
      const z = 1 / (d + 0.08);
      const band = Math.floor(z * 1.2 + scroll * 6) % 2 === 0;
      g.fillStyle = band ? '#24154f' : '#1d1145';
      g.fillRect(0, y, W, 4);
      g.fillStyle = band ? '#3a3360' : '#332c57';
      g.fillRect(cx - half, y, half * 2, 4);
      const edge = Math.max(4, half * 0.06);
      g.fillStyle = band ? '#FF3B3B' : '#F4F1FF';
      g.fillRect(cx - half - edge, y, edge, 4);
      g.fillRect(cx + half, y, edge, 4);
      if (band) { g.fillStyle = '#FFD23F'; g.fillRect(cx - Math.max(2, half * 0.012), y, Math.max(4, half * 0.024), 4); }
    }
    // cars: further up the road = further ahead (match rate on the same split)
    const lanes: Record<string, number> = { you: -0.42, ghost: 0.42, subq: 0 };
    for (const c of this.cars) {
      const rate = Math.max(0, Math.min(1, c.run.match_rate ?? 0));
      const d = 0.74 - rate * 0.56; // depth on screen
      const y = d * H;
      const half = 40 + d * 880;
      const x = cx + lanes[c.role] * half;
      const s = 0.35 + d * 1.0;
      this.car(g, x, y, s, c.role);
      g.globalAlpha = 1;
      g.font = '28px "Press Start 2P"';
      g.textAlign = 'center';
      g.fillStyle = '#000';
      const label = c.role === 'you' && this.cars.length > 1 ? `YOU · ${c.tag}` : c.tag;
      g.fillText(label, x + 3, y - 96 * s - 14 + 3);
      g.fillStyle = c.role === 'ghost' ? '#F4F1FF' : c.role === 'subq' ? '#FF6BD6' : '#7CF2C8';
      g.fillText(label, x, y - 96 * s - 14);
    }
  }

  /** an original pixel car, seen from behind */
  private car(g: CanvasRenderingContext2D, x: number, y: number, s: number, role: Car['role']) {
    const P = Math.max(2, Math.round(8 * s));
    const body = role === 'ghost' ? '#F4F1FF' : role === 'subq' ? '#FF6BD6' : '#3BC7FF';
    g.globalAlpha = role === 'ghost' ? 0.45 : 1;
    const art = [
      '....RRRRRRRR....',
      '...RWWWWWWWWR...',
      '..RWWWWWWWWWWR..',
      '.BBBBBBBBBBBBBB.',
      'BBYYBBBBBBBBYYBB',
      'BBBBBBDDDDBBBBBB',
      'KKKBBBBBBBBBBKKK',
      'KKK..........KKK',
    ];
    const col: Record<string, string> = { R: body, W: '#0B0B2E', B: body, Y: '#FFD23F', D: '#0B0B2E', K: '#05051a' };
    const w = art[0].length * P, hh = art.length * P;
    art.forEach((row, r) => [...row].forEach((ch, k) => {
      if (ch === '.') return;
      g.fillStyle = col[ch];
      g.fillRect(Math.round(x - w / 2 + k * P), Math.round(y - hh + r * P), P, P);
    }));
  }
}
