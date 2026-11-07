// Scene 3: Time trial. Reads every runs/*/metrics.json and lab memory_probe.json. Nothing typed by hand:
// every number on this screen is a field of one of those files, labelled with its run.
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';

type Run = {
  dir: string; run_id?: string; label?: string; split?: string; library?: string; model?: string;
  fn_total?: number; matched?: number; match_rate?: number; minutes_per_match?: number; cost_per_match_usd?: number;
  false_claims_caught?: number; fakematches_rejected?: number; cost_usd?: number; fixture?: boolean;
  muse?: { calls?: number; tool_calls?: number; image_calls?: number; cost_usd?: number; by_model?: Record<string, any> };
};
type Car = { run: Run; role: 'you' | 'ghost' | 'subq'; tag: string };

const n0 = (x: number | undefined) => (x == null ? '--' : Math.round(x).toLocaleString('en-US'));
const pct = (x: number | undefined) => (x == null ? '--' : `${Math.round(x * 100)}%`);
const money = (x: number | undefined) => (x == null ? '--' : `$${x < 1 ? x.toFixed(3) : x.toFixed(2)}`);
const cleanLabel = (r: Run) => (r.label ?? r.dir).replace(/\s*\((sample|fixture)\)\s*/gi, '').toUpperCase();
const modelName = (m?: string) => (m ?? 'model').replace(/-/g, ' ').toUpperCase();

export class TimeTrialScene implements Scene {
  id = 'timetrial' as const;
  el = h('section', 'scene timetrial');
  private runs: Run[] = [];
  private probe: any = null;
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
      <div class="laps"><div class="lh"><span>LAP BOARD · PER PIECE</span><span>MIN</span><span>COST</span></div><div data-k="laps"></div></div>
      <div class="gauge" data-k="gauge"></div>
      <div class="plates" data-k="plates"></div>`;
    this.cv = this.el.querySelector('canvas')!;
    void this.load();
    setInterval(() => void this.load(), 10000);
  }

  sample() { return this.loaded ? this.runs.some((r) => r.fixture) || !!this.probe?.fixture : null; }

  async load() {
    try {
      const [m, p] = await Promise.all([
        fetch(`${this.base}/metrics`, { cache: 'no-store' }).then((r) => (r.ok ? r.json() : null)),
        fetch(`${this.base}/lab/memory_probe`, { cache: 'no-store' }).then((r) => (r.ok ? r.json() : null)),
      ]);
      this.runs = Array.isArray(m?.runs) ? m.runs : [];
      this.probe = p;
      this.loaded = true;
      this.draw();
    } catch { /* server down: keep the last numbers */ }
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

  /** library on = you, library off = ghost (held-out runs); a SubQ / cartographer run is a third car */
  private pickCars(): Car[] {
    const held = this.runs.filter((r) => r.split === 'heldout');
    const pool = held.length ? held : this.runs;
    const last = (f: (r: Run) => boolean) => [...pool].reverse().find(f);
    const subq = last((r) => /subq|cartographer/i.test(r.label ?? ''));
    const on = last((r) => r.library === 'on' && r !== subq);
    const off = last((r) => r.library === 'off');
    const cars: Car[] = [];
    if (on) cars.push({ run: on, role: 'you', tag: 'LIBRARY ON' });
    if (off) cars.push({ run: off, role: 'ghost', tag: 'GHOST: LIBRARY OFF' });
    if (subq) cars.push({ run: subq, role: 'subq', tag: 'SUBQ CARTOGRAPHER' });
    if (!cars.length && pool[0]) cars.push({ run: pool[0], role: 'you', tag: cleanLabel(pool[0]) });
    return cars;
  }

  private runNo(r: Run) { return this.runs.indexOf(r) + 1; }

  private draw() {
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    this.cars = this.pickCars();
    // lap board: every run is a lap; best min/piece in mint
    // lap records only compare runs on the same split as the player car
    const split = this.cars.find((c) => c.role === 'you')?.run.split;
    const timed = this.runs.filter((r) => r.split === split && (r.matched ?? 0) > 0 && r.minutes_per_match != null);
    const best = timed.reduce<Run | null>((b, r) => (!b || r.minutes_per_match! < b.minutes_per_match! ? r : b), null);
    q('laps').innerHTML = this.runs.length
      ? this.runs.slice(-5).map((r) => {
          const isBest = r === best && timed.length > 1;
          return `<div class="lap${isBest ? ' best' : ''}"><span>RUN ${this.runNo(r)} · ${esc(cleanLabel(r))}</span><span>${r.minutes_per_match?.toFixed(2) ?? '--'}</span><span>${money(r.cost_per_match_usd)}</span></div>${isBest ? '<div class="rec">NEW LAP RECORD</div>' : ''}`;
        }).join('')
      : '<div class="lap"><span>NO FINISHED RUNS YET</span></div>';

    // gauge: % of the held-out set recovered, you vs the ghost
    const you = this.cars.find((c) => c.role === 'you');
    const ghost = this.cars.find((c) => c.role === 'ghost');
    const heldout = you?.run.split === 'heldout';
    q('gauge').innerHTML = you
      ? `<div class="gl">${heldout ? 'HELD-OUT RECOVERED' : 'RECOVERED'}</div>
         <div class="gv">${pct(you.run.match_rate)}</div>
         <div class="gs">${n0(you.run.matched)}/${n0(you.run.fn_total)} · RUN ${this.runNo(you.run)} · ${esc(you.tag)}</div>
         ${ghost ? `<div class="gg">GHOST ${pct(ghost.run.match_rate)} · ${n0(ghost.run.matched)}/${n0(ghost.run.fn_total)} · RUN ${this.runNo(ghost.run)}</div>` : ''}`
      : '<div class="gl">NO RUNS YET</div>';

    // plates: memory test + powered by
    const p = this.probe;
    const muse = you?.run.muse;
    const plates: string[] = [];
    if (p?.unmodified && p?.variant) {
      plates.push(`<div class="plate"><b>MEMORY TEST</b> ${n0(p.fn_count)} FUNCTIONS FROM MEMORY: <em>${n0(p.unmodified.matched)}</em> MATCH REAL DOOM, <em>${n0(p.variant.matched)}</em> MATCH OUR VARIANT</div>`);
    }
    if (muse && you) {
      plates.push(`<div class="plate"><b>POWERED BY</b> ${esc(modelName(you.run.model))}: ${n0(muse.calls)} CALLS, ${n0(muse.tool_calls)} TOOL CALLS, ${n0(muse.image_calls)} IMAGES READ, ${money(muse.cost_usd)} <span>· RUN ${this.runNo(you.run)}</span></div>`);
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
      const label = c.role === 'you' ? `YOU · ${c.tag}` : c.tag;
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
