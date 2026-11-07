// Scene 1: Split. Left 1000 px is the game (OBS puts mGBA under it), right 920 px is the rebuild panel.
import type { Ctx, Scene } from '../types.ts';
import { h, esc, diffIns } from '../types.ts';
import type { Effect, FalseClaim, State } from '../state.ts';
import { pctRecovered, elapsedS, fmtClock, fmtPct } from '../state.ts';
import { displayName } from '../data.ts';
import type { Region } from '../data.ts';
import { coin, reject } from '../audio.ts';

const FRAME = { x: 20, y: 84, scale: 4 }; // 240x160 GBA at 4x = 960x640
const ROW0 = { x: 1028, y: 140 }; // left edge of the top hi-score row (stage coords), row centre
const ORD = (n: number) => `${n}${['TH', 'ST', 'ND', 'RD'][n % 100 > 10 && n % 100 < 14 ? 0 : n % 10 < 4 ? n % 10 : 0]}`;
const STATUS_TEXT: Record<string, string> = { MATCH: 'MATCH', PARTIAL: 'PARTIAL', LINT_FAIL: 'LINT FAIL', NO_COMPILE: 'NO COMPILE' };

export function regionRect(r: Region) {
  return { x: FRAME.x + r.x * FRAME.scale, y: FRAME.y + r.y * FRAME.scale, w: r.w * FRAME.scale, h: r.h * FRAME.scale };
}

export function hudHtml() {
  return `<div class="rec"><span class="k">RECOVERED</span><span class="v" data-k="rec">--</span></div>
    <div class="lies"><span class="k">LIES</span><span class="v" data-k="lies">0</span></div>
    <div><span class="k">TIME</span><span class="v" data-k="time">--:--</span></div>
    <div class="runlabel" data-k="label"></div>`;
}

export function renderHud(root: HTMLElement, s: State) {
  const set = (k: string, v: string) => { const el = root.querySelector(`[data-k="${k}"]`); if (el && el.textContent !== v) el.textContent = v; };
  set('rec', s.fnTotal ? `${s.matched.length}/${s.fnTotal}` : `${s.matched.length}`);
  set('lies', String(s.falseClaims.length));
  set('time', fmtClock(elapsedS(s)));
  set('label', s.label ? s.label.toUpperCase() : '');
}

export class SplitScene implements Scene {
  id = 'split' as const;
  el = h('section', 'scene split');
  private rowsEl!: HTMLElement;
  private pre!: HTMLElement;
  private stampEl!: HTMLElement;
  private pipEl!: HTMLElement;
  private badgeEl!: HTMLElement;
  private meter!: HTMLCanvasElement;
  private rowsKey = '';
  private rowsTop = '';
  private typing: { text: string; shown: number; t0: number; cps: number } | null = null;
  private codeKey = '';
  private pipTimer = 0;
  private regionsKey = '';
  private healKey = '';

  constructor() {
    this.el.innerHTML = `
      <div class="hud">${hudHtml()}</div>
      <div class="game-frame"><div class="ph">GAME CAPTURE<br>mGBA · 240×160 at 4×</div></div>
      <div class="badge orig" data-k="badge">NOW RUNNING ON ORIGINAL CODE</div>
      <div class="badge-proof" data-k="badgeproof"></div>
      <div class="heal" data-k="heal"></div>
      <div class="panel">
        <h2><span>HI-SCORE</span><small>MATCH = BYTE-IDENTICAL</small></h2>
        <div class="rows"></div>
        <div class="codewin">
          <div class="bar"><span class="who" data-k="who">WAITING FOR A DIGGER</span><span class="fn" data-k="fn"></span><span class="try" data-k="try"></span></div>
          <pre></pre>
          <div class="stamp"></div>
        </div>
        <div class="meter"><div class="lbl"><span>CARTRIDGE</span><span data-k="meter">--</span></div><canvas width="868" height="56"></canvas></div>
        <div class="keyline"><em>? = our guess.</em> Everything else is proved.</div>
      </div>
      <div class="pip"></div>
      <div class="ticker"><span class="who">ARCHIVIST</span><span class="line" data-k="tick"></span></div>`;
    this.rowsEl = this.el.querySelector('.rows')!;
    this.pre = this.el.querySelector('pre')!;
    this.stampEl = this.el.querySelector('.stamp')!;
    this.pipEl = this.el.querySelector('.pip')!;
    this.badgeEl = this.el.querySelector('[data-k="badge"]')!;
    this.meter = this.el.querySelector('canvas')!;
    // pip sits over the code window inside the panel coordinate space
    this.el.querySelector('.panel')!.appendChild(this.pipEl);
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    renderHud(this.el, s);
    this.renderRegions(ctx);
    this.renderRows(ctx);
    this.renderCode(ctx);
    this.renderBadge(s);
    this.renderHeal(ctx);
    this.renderMeter(ctx);
    const last = s.narration[s.narration.length - 1];
    const tick = this.el.querySelector('[data-k="tick"]') as HTMLElement;
    const txt = last ? last.text : 'Waiting for the run to start.';
    if (tick.textContent !== txt) { tick.textContent = txt; tick.className = `line ${last?.mood ?? ''}`; }
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'matched') {
      const sub = ctx.side.fnToSub.get(e.m.fn);
      const land = sub ? regionRect(sub.region) : regionRect({ x: 0, y: 0, w: 240, h: 160 });
      const to = { x: land.x + land.w / 2, y: land.y + land.h / 2 };
      ctx.fx.beam(ROW0, to, land, '#7CF2C8', () => coin());
    } else if (e.kind === 'verdict') {
      this.showStamp(e.v.status, e.v.claim_was_true === false, e.v.match_pct);
    } else if (e.kind === 'falseClaim') {
      this.showPip(ctx, e.c);
      reject();
    } else if (e.kind === 'swap') {
      this.badgeEl.classList.remove('bump');
      void this.badgeEl.offsetWidth;
      this.badgeEl.classList.add('bump');
    } else if (e.kind === 'reset') {
      this.rowsKey = '';
      this.rowsTop = '';
      this.rowsEl.innerHTML = '';
      this.codeKey = '';
      this.typing = null;
      this.pre.textContent = '';
      this.stampEl.className = 'stamp';
      this.pipEl.classList.remove('on');
    }
  }

  private renderRegions(ctx: Ctx) {
    const key = ctx.side.subsystems.map((s) => s.id).join(',');
    if (key === this.regionsKey) return;
    this.regionsKey = key;
    const frame = this.el.querySelector('.game-frame')!;
    frame.querySelectorAll('.region').forEach((r) => r.remove());
    ctx.side.subsystems.forEach((sub, i) => {
      const r = sub.region;
      const el = h('div', 'region', `<span style="top:${6 + 22 * i}px">${esc(sub.label)}</span>`);
      Object.assign(el.style, { left: `${r.x * 4}px`, top: `${r.y * 4}px`, width: `${r.w * 4}px`, height: `${r.h * 4}px` });
      frame.appendChild(el);
    });
  }

  private renderRows(ctx: Ctx) {
    const s = ctx.state;
    const newest = s.matched.slice(-6).reverse();
    const ids = newest.map((m) => m.fn);
    const namesKey = ids.map((f) => ctx.side.names.get(f) ?? '').join('|');
    const key = ids.join(',') + '#' + namesKey;
    if (key === this.rowsKey) return;
    const prevTop = this.rowsTop;
    this.rowsKey = key;
    this.rowsTop = ids[0] ?? '';
    const total = s.matched.length;
    let html = '';
    for (let i = 0; i < 6; i++) {
      const m = newest[i];
      if (!m) { html += `<div class="row empty"><span class="rk">---</span><span class="nm">· · ·</span><span class="pc"></span></div>`; continue; }
      const rank = total - i;
      const nm = displayName(ctx.side, m.fn);
      const isNew = i === 0 && prevTop !== m.fn && !ctx.reduced;
      html += `<div class="row c${(rank - 1) % 3}${isNew ? ' new' : ''}"><span class="rk">${ORD(rank)}</span><span class="nm${nm.guess ? ' guess' : ''}">${esc(nm.text)}</span><span class="pc">100%</span></div>`;
    }
    this.rowsEl.innerHTML = html;
  }

  private renderCode(ctx: Ctx) {
    const a = ctx.state.lastAttempt;
    const set = (k: string, v: string) => { const el = this.el.querySelector(`[data-k="${k}"]`)!; if (el.textContent !== v) el.textContent = v; };
    if (!a) return;
    const key = `${a.fn}|${a.actor}|${a.attempt}`;
    if (key !== this.codeKey) {
      this.codeKey = key;
      set('who', a.actor.toUpperCase());
      set('fn', a.fn);
      set('try', `TRY ${a.attempt}`);
      const instant = ctx.reduced || ctx.state.speed >= 12;
      this.typing = { text: a.src, shown: instant ? a.src.length : 0, t0: performance.now(), cps: 260 * Math.max(1, ctx.state.speed) };
      this.stampEl.className = 'stamp';
    }
    const t = this.typing;
    if (!t) return;
    const target = Math.min(t.text.length, Math.floor(((performance.now() - t.t0) / 1000) * t.cps));
    if (target !== t.shown || !this.pre.childNodes.length) {
      t.shown = Math.max(t.shown, target);
      const lines = t.text.slice(0, t.shown).split('\n').slice(-11).join('\n');
      this.pre.innerHTML = `<span>${esc(lines)}${t.shown < t.text.length ? '<i class="caret"></i>' : ''}</span>`;
    }
  }

  /** the code window is still typing (main loop keeps rendering while true) */
  busy() { return !!this.typing && this.typing.shown < this.typing.text.length; }

  private showStamp(status: string, lie: boolean, pct: number) {
    const el = this.stampEl;
    const label = lie ? 'LIE' : STATUS_TEXT[status] ?? status;
    const cls = lie ? 'LIE' : status;
    el.innerHTML = `${esc(label)}${status === 'PARTIAL' || lie ? `<small>${pct.toFixed(1)}% · NOT ACCEPTED</small>` : ''}`;
    el.className = `stamp ${cls}`;
    void el.offsetWidth;
    el.classList.add('on');
  }

  private showPip(ctx: Ctx, c: FalseClaim) {
    const d = c.first_diff;
    const ins = d ? diffIns(d.expected_ins, d.got_ins) : null;
    this.pipEl.innerHTML = `
      <div class="vs-row"><span>${esc(c.actor.toUpperCase())}</span><span class="vs">VS</span><span>REFEREE</span></div>
      <div class="bars"><div><div class="hbar"><i style="width:${c.match_pct}%"></i></div><span>CLAIM ${c.match_pct.toFixed(1)}%</span></div>
        <div><div class="hbar r"><i style="width:100%"></i></div><span style="text-align:right">PROOF 100%</span></div></div>
      <div class="ev">${d && ins
        ? `<div><span class="lbl">EXPECTED</span>${esc(d.expected_ins)}</div><div><span class="lbl">GOT</span>${ins.got}</div>`
        : `<div>${esc(c.fn)} · ${esc(c.status)}</div>`}</div>
      <div class="ko">K.O. CLAIM REJECTED</div>`;
    this.pipEl.classList.add('on');
    clearTimeout(this.pipTimer);
    this.pipTimer = window.setTimeout(() => this.pipEl.classList.remove('on'), 5000 / Math.min(4, Math.max(1, ctx.state.speed / 4)));
    ctx.fx.flash();
  }

  private renderBadge(s: State) {
    const el = this.badgeEl;
    const proof = this.el.querySelector('[data-k="badgeproof"]')!;
    if (s.pctAgentCode == null) {
      if (!el.classList.contains('orig')) { el.className = 'badge orig'; el.textContent = 'NOW RUNNING ON ORIGINAL CODE'; }
      proof.textContent = 'NO HOT-SWAP YET';
      return;
    }
    const html = `<small>NOW RUNNING ON</small><span><b>${s.pctAgentCode.toFixed(1)}%</b>AGENT-WRITTEN CODE</span>`;
    if (el.innerHTML !== html) { el.classList.remove('orig'); el.innerHTML = html; }
    const sha = s.build?.rom_sha1 ?? '';
    const p = `HOT-SWAP ${s.swaps}${sha ? ` · REBUILT ROM ${sha.slice(0, 8)}${s.build?.identical ? ' · IDENTICAL' : ''}` : ''}`;
    if (proof.textContent !== p) proof.textContent = p;
  }

  private renderHeal(ctx: Ctx) {
    const subs = ctx.side.subsystems.slice(0, 4);
    const counts = subs.map((sub) => sub.functions.filter((f) => ctx.state.matchedSet.has(f)).length);
    const key = subs.map((s, i) => `${s.id}:${counts[i]}`).join(',');
    if (key === this.healKey) return;
    this.healKey = key;
    this.el.querySelector('[data-k="heal"]')!.innerHTML = subs
      .map((sub, i) => {
        const n = sub.functions.length;
        return `<div class="h"><div class="n">${esc(sub.label.toUpperCase())}</div><div class="c">${counts[i]}/${n}</div><div class="bar"><i style="width:${n ? (100 * counts[i]) / n : 0}%"></i></div></div>`;
      })
      .join('');
  }

  private renderMeter(ctx: Ctx) {
    const s = ctx.state;
    const pct = pctRecovered(s);
    const lbl = this.el.querySelector('[data-k="meter"]')!;
    const t = s.fnTotal ? `<b>${s.matched.length}</b>/${s.fnTotal} GAME FUNCTIONS · ${fmtPct(pct, 1)}%` : '--';
    if (lbl.innerHTML !== t) lbl.innerHTML = t;
    drawMeter(this.meter, ctx);
  }
}

/** One cell per function from the manifest: mint = recovered, grey = library, dark = not yet. */
export function drawMeter(cv: HTMLCanvasElement, ctx: Ctx) {
  const g = cv.getContext('2d')!;
  const W = cv.width, H = cv.height;
  g.clearRect(0, 0, W, H);
  let cells = ctx.side.cells;
  const s = ctx.state;
  // manifest from a different target than this run: fall back to fn_total cells filled in order
  const overlap = cells.some((c) => s.matchedSet.has(c.id));
  if (!cells.length || (s.matched.length && !overlap)) {
    cells = Array.from({ length: s.fnTotal }, (_, i) => ({ id: `#${i}`, game: true }));
  }
  const n = cells.length;
  if (!n) return;
  let rows = 1;
  while (Math.floor(W / Math.ceil(n / rows)) < Math.floor(H / rows) - 2 && rows < 12) rows++;
  const perRow = Math.ceil(n / rows);
  const cw = W / perRow, chh = H / rows;
  const usedFallback = cells[0]?.id.startsWith('#');
  cells.forEach((c, i) => {
    const r = Math.floor(i / perRow), k = i % perRow;
    const on = usedFallback ? i < s.matched.length : s.matchedSet.has(c.id);
    g.fillStyle = !c.game ? '#4A4767' : on ? '#7CF2C8' : '#1b1846';
    g.fillRect(Math.floor(k * cw), Math.floor(r * chh), Math.max(1, Math.floor(cw) - 2), Math.max(1, Math.floor(chh) - 2));
  });
}
