// ROAD (key 6, ?scene=road): how much of Doom is back, run by run, and what is left.
// Hero: the climb of unique functions proven over the afternoon. Then rate, cost and proof numbers, the proof
// line, and the road itself: 568 cells in ROM address order, wider = bigger function. Mint = recovered and
// proven (UNION.json or a fn.matched in the stream), pulsing = being dug now (fn.claimed, no result yet),
// grey = still original, next on the road. Numbers come only from GET /road (stage/server/road.mjs) and the stream.
import './road.css';
import type { Ctx, Scene } from './types.ts';
import { h, esc } from './types.ts';
import { emptyLive, roadApply, roadView } from './road_state.ts';
import type { RoadBase, RoadLive, RoadView } from './road_state.ts';

const CW = 1220, CH = 358; // chart drawing area inside its frame (px)
const PAD = { l: 64, r: 40, t: 34, b: 50 };
const fmtInt = (n: number) => n.toLocaleString('en-US');

export class RoadScene implements Scene {
  id = 'road' as const;
  el = h('section', 'scene roadscene');
  private base: RoadBase | null = null;
  private live: RoadLive = emptyLive();
  private memo = '';
  private shown = 0; // the number the counter shows (ticks toward view.n)
  private target = 0;
  private flips = new Set<string>();
  private cellEls = new Map<string, HTMLElement>();
  private clock: Intl.DateTimeFormat = new Intl.DateTimeFormat('en-US', { hour: '2-digit', minute: '2-digit', hourCycle: 'h23' });

  private http: string;

  constructor(http: string) {
    this.http = http;
    this.el.innerHTML = `
      <header class="rd-head">
        <h1><i class="star">✻</i> The first afternoon.</h1>
        <p>Unique Doom functions recovered and proven, run by run. <span data-k="span"></span></p>
      </header>
      <div class="rd-chart"><b class="ttl">the climb</b><svg data-k="svg" viewBox="0 0 ${CW} ${CH}" width="${CW}" height="${CH}" aria-label="Cumulative unique functions proven over the day"></svg></div>
      <aside class="rd-stats">
        <div class="st"><b data-k="rate">--</b><span>functions an hour</span><small data-k="rate-why"></small></div>
        <div class="st"><b data-k="cost">--</b><span>per function</span><small data-k="cost-why"></small></div>
        <div class="q">
          <div><b class="ok" data-k="fa">0</b><span>fakes accepted</span></div>
          <div><b data-k="fr">0</b><span>fakes rejected</span></div>
          <div><b class="no" data-k="lies">0</b><span>lies caught</span></div>
        </div>
        <p class="ver"><i>✓</i> every function byte-identical, <span data-k="ver">verified on a second machine</span></p>
        <div class="rd-proof">
          <svg class="cart" viewBox="0 0 28 34" width="28" height="34" aria-hidden="true"><path d="M2 1h18l6 6v26H2z" fill="none" stroke="currentColor" stroke-width="2"/><path d="M7 7h12v10H7z" fill="currentColor" opacity=".35"/><path d="M6 25h3M11 25h3M16 25h3M21 25h2" stroke="currentColor" stroke-width="3"/></svg>
          <span>Doom already runs on agent-written code. <b>SHA-1 identical.</b></span><code data-k="sha"></code>
        </div>
      </aside>
      <div class="rd-tier">
        <div class="bar" aria-hidden="true"><i class="ok" data-k="tb-ok"></i><i class="close" data-k="tb-close"></i></div>
        <div class="row"><span class="ok"><i class="k ok"></i>proven exact: <b data-k="n">0</b> / <span data-k="of">568</span> functions</span><i class="sep">·</i><span><b data-k="pb">0</b>% of the code bytes</span><em data-k="bytes"></em></div>
        <div class="row2"><span class="close"><i class="k close"></i>close, not proven: <b data-k="nc">0</b> at ≥90% best match</span></div>
        <p class="why">close = best attempt ≥90% byte-match, not accepted, not counted</p>
      </div>
      <div class="rd-road">
        <div class="rd-legend"><b class="ttl">the road</b><span class="what" data-k="what">568 functions in ROM address order, wider = bigger</span>
          <span class="key"><i class="k ok"></i>recovered and proven<i class="k dig"></i>being dug now<i class="k close"></i>close, not proven<i class="k orig"></i>still original, next on the road</span></div>
        <div class="rd-cells" data-k="cells"></div>
      </div>
      <div class="rd-bands" data-k="bands"></div>
      <p class="rd-tag">Every function proven. SHA-1 identical. The road to 100% is run by run.</p>`;
    void this.load();
    setInterval(() => void this.load(), 30_000);
  }

  private async load() {
    try {
      const r = await fetch(`${this.http}/road`, { cache: 'no-store' });
      if (!r.ok) return;
      this.base = await r.json();
      if (this.base?.tz) this.clock = new Intl.DateTimeFormat('en-US', { hour: '2-digit', minute: '2-digit', hourCycle: 'h23', timeZone: this.base.tz });
      this.memo = '';
    } catch { /* the server is down: keep what we had */ }
  }

  /** Every stream event (backlog too). `animate` is false while the backlog rebuilds state. */
  ingest(e: any, animate: boolean) {
    for (const fx of roadApply(this.live, e)) {
      if (fx.kind === 'matched' && animate) this.flips.add(fx.fn);
    }
    if (e?.type === 'stage.hello') this.flips.clear();
  }

  /** the files say how real the numbers are; the stream only adds pulses and new matches */
  sample() { return null; }

  animating() { return this.shown !== this.target; }

  render(ctx: Ctx) {
    const v = roadView(this.base, this.live);
    this.target = v.n;
    if (!this.base) { this.shown = v.n; }
    this.tick(ctx);
    const key = `${!!this.base}|${v.n}|${v.cells.map((c) => c.st[0]).join('')}|${v.climb.length}|${this.flips.size}`;
    if (key === this.memo) return;
    const first = this.memo === '';
    this.memo = key;
    if (first || !this.cellEls.size) this.shown = v.n;
    this.drawCells(v, ctx.reduced);
    this.drawChart(v);
    this.drawNumbers(v);
    this.drawBands(v);
  }

  private tick(ctx: Ctx) {
    if (this.shown === this.target || ctx.reduced) { this.shown = this.target; }
    else this.shown += Math.sign(this.target - this.shown);
    const n = this.el.querySelector('[data-k="n"]') as HTMLElement;
    if (n && n.textContent !== String(this.shown)) n.textContent = String(this.shown);
  }

  private set(k: string, text: string) {
    const el = this.el.querySelector(`[data-k="${k}"]`) as HTMLElement | null;
    if (el && el.textContent !== text) el.textContent = text;
  }

  private t(ms: number) { return this.clock.format(new Date(ms)); }

  private drawNumbers(v: RoadView) {
    const b = this.base;
    const t0 = b?.totals.first_run_start ? Date.parse(b.totals.first_run_start) : 0;
    const last = v.climb[v.climb.length - 1];
    this.set('span', b ? `From ${this.t(Date.parse(b.day_start))} to ${last ? this.t(last) : 'now'}.` : 'Waiting for the run files.');
    this.set('rate', v.perHour == null ? '--' : v.perHour.toFixed(0));
    this.set('rate-why', v.perHour == null ? '' : `first run ${this.t(t0)} to latest proof ${this.t(last)}`);
    this.set('cost', v.costPer == null ? '--' : `$${v.costPer.toFixed(2)}`);
    this.set('cost-why', v.costPer == null ? '' : `$${v.costUsd.toFixed(2)} of Muse across ${v.runs} runs ÷ ${v.n}`);
    this.set('fa', String(v.fakesAccepted));
    this.set('fr', String(v.fakesRejected));
    this.set('lies', String(v.lies));
    this.set('ver', b?.union?.reverified_by_referee ? 'verified on a second machine' : 'not re-verified yet');
    this.set('of', fmtInt(v.of || 568));
    this.set('pb', v.pctBytes.toFixed(2));
    this.set('bytes', `${fmtInt(v.bytes)} of ${fmtInt(v.ofBytes)} bytes`);
    this.set('nc', String(v.close));
    const of = v.of || 568;
    (this.el.querySelector('[data-k="tb-ok"]') as HTMLElement).style.width = `${((100 * v.n) / of).toFixed(3)}%`;
    (this.el.querySelector('[data-k="tb-close"]') as HTMLElement).style.width = `${((100 * v.close) / of).toFixed(3)}%`;
    const sha = b?.union?.target_rom_sha1 ?? '';
    this.set('sha', sha ? `sha1 ${sha.slice(0, 12)}…` : '');
    this.set('what', `${fmtInt(v.of || 568)} functions in ROM address order, wider = bigger`);
  }

  private drawCells(v: RoadView, reduced: boolean) {
    const box = this.el.querySelector('[data-k="cells"]') as HTMLElement;
    if (this.cellEls.size !== v.cells.length) {
      // width grows with the square root of the size, so a 7 KB function reads bigger than a 12 B one without
      // hiding the small ones; the bytes % above stays the honest measure
      const W = 1840, gap = 2, rows = 5;
      const sq = v.cells.reduce((a, c) => a + Math.sqrt(Math.max(1, c.size)), 0);
      const k = (W * rows - gap * v.cells.length) / sq;
      box.innerHTML = '';
      this.cellEls.clear();
      for (const c of v.cells) {
        const d = h('i', 'cell');
        d.style.width = `${Math.max(2, Math.sqrt(Math.max(1, c.size)) * k * 0.985).toFixed(2)}px`;
        box.appendChild(d);
        this.cellEls.set(c.id, d);
      }
    }
    for (const c of v.cells) {
      const d = this.cellEls.get(c.id)!;
      const cls = `cell ${c.st}${this.flips.has(c.id) && !reduced ? ' flip' : ''}`;
      if (d.className !== cls) d.className = cls;
    }
    if (this.flips.size) {
      const done = [...this.flips];
      setTimeout(() => { for (const f of done) { this.flips.delete(f); this.cellEls.get(f)?.classList.remove('flip'); } }, 1600);
    }
  }

  private drawBands(v: RoadView) {
    const el = this.el.querySelector('[data-k="bands"]') as HTMLElement;
    const html = `<span class="lbl">by size</span>` + v.bands.map((b) => {
      const pct = b.total ? (100 * b.got) / b.total : 0;
      return `<div class="band"><span class="nm">${esc(b.label)}</span><span class="bar"><i style="width:${pct.toFixed(2)}%"></i></span><span class="ct"><b>${b.got}</b> / ${b.total}</span></div>`;
    }).join('');
    if (!el.firstChild) { el.innerHTML = html; return; }
    // keep the elements so the width transition plays when a band grows
    const bars = el.querySelectorAll<HTMLElement>('.bar i');
    const cts = el.querySelectorAll<HTMLElement>('.ct');
    v.bands.forEach((b, i) => {
      const pct = b.total ? (100 * b.got) / b.total : 0;
      if (bars[i]) bars[i].style.width = `${pct.toFixed(2)}%`;
      if (cts[i]) cts[i].innerHTML = `<b>${b.got}</b> / ${b.total}`;
    });
  }

  private drawChart(v: RoadView) {
    const svg = this.el.querySelector('[data-k="svg"]') as SVGSVGElement;
    const b = this.base;
    if (!b) { svg.innerHTML = ''; return; }
    const x0 = Date.parse(b.day_start);
    const ends = b.runs.map((r) => (r.end ? Date.parse(r.end) : 0));
    const lastPt = v.climb[v.climb.length - 1] ?? x0;
    const lastRun = Math.max(lastPt, ...ends);
    const x1 = lastRun + (lastRun - x0) * 0.04;
    const n = v.climb.length;
    const step = n > 200 ? 100 : n > 80 ? 25 : n > 30 ? 10 : 5;
    const yMax = Math.max(step * 2, Math.ceil((n * 1.18) / step) * step);
    const X = (t: number) => PAD.l + ((t - x0) / (x1 - x0)) * (CW - PAD.l - PAD.r);
    const Y = (c: number) => CH - PAD.b - (c / yMax) * (CH - PAD.t - PAD.b);
    let g = '';
    for (let y = 0; y <= yMax; y += step) {
      g += `<line class="grid" x1="${PAD.l}" x2="${CW - PAD.r}" y1="${Y(y)}" y2="${Y(y)}"/><text class="ax" x="${PAD.l - 14}" y="${Y(y) + 6}" text-anchor="end">${y}</text>`;
    }
    // hour labels in the event's timezone, plus kickoff
    const hr = 3.6e6;
    for (let t = Math.ceil(x0 / hr) * hr; t <= x1; t += hr) {
      if (X(t) - X(x0) < 90) continue;
      g += `<text class="ax" x="${X(t)}" y="${CH - PAD.b + 30}" text-anchor="middle">${this.t(t)}</text>`;
    }
    g += `<text class="ax" x="${X(x0)}" y="${CH - PAD.b + 30}" text-anchor="start">${this.t(x0)} kickoff</text>`;
    // one tick per run start: the climb is run by run
    for (const r of b.runs) if (r.start) g += `<line class="run" x1="${X(Date.parse(r.start))}" x2="${X(Date.parse(r.start))}" y1="${CH - PAD.b}" y2="${CH - PAD.b + 10}"/>`;
    let d = `M${X(x0)},${Y(0)}`;
    v.climb.forEach((t, i) => { d += `H${X(t).toFixed(1)}V${Y(i + 1).toFixed(1)}`; });
    d += `H${X(lastRun).toFixed(1)}`;
    const area = `${d}V${Y(0)}H${X(x0)}Z`;
    const lx = X(lastPt), ly = Y(n);
    const label = `<text class="now" x="${lx - 18}" y="${ly - 22}" text-anchor="end"><tspan class="big">${n}</tspan> still climbing</text>`;
    svg.innerHTML = `${g}<path class="area" d="${area}"/><path class="line" d="${d}"/>
      <circle class="ring" cx="${lx}" cy="${ly}" r="8"/><circle class="dot" cx="${lx}" cy="${ly}" r="7"/>${n ? label : ''}
      <text class="ax runs" x="${CW - PAD.r}" y="${CH - PAD.b + 30}" text-anchor="end">${b.runs.length} runs ▏</text>`;
  }
}
