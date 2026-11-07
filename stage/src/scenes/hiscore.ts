// Scene 1b: Hi-score, the arcade attract screen. One hero number: % of the game recovered.
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import type { Effect, FalseClaim } from '../state.ts';
import { coin } from '../audio.ts';
import { announce } from '../voice.ts';
import { tickerHtml, renderTicker, renderRows, drawMeter, setText, gameName, gameTotal, gamePct } from './common.ts';
import type { RowsMemo } from './common.ts';

const MILESTONES: [number, string][] = [
  [25, 'QUARTER RECOVERED!'],
  [50, 'HALFWAY THERE!'],
  [75, 'THREE QUARTERS!'],
  [100, 'FULLY RECOVERED!'],
];

export class HiscoreScene implements Scene {
  id = 'hiscore' as const;
  el = h('section', 'scene hiscore');
  private rowsEl: HTMLElement;
  private meter: HTMLCanvasElement;
  private memo: RowsMemo = { key: '', top: '' };
  private liar: string | null = null;
  private liarTimer = 0;
  private bannerTimer = 0;

  constructor() {
    this.el.innerHTML = `
      <div class="arcade">
        <div><span class="k one">1UP</span><span class="v" data-k="up">0</span></div>
        <div><span class="k hi">HI-SCORE</span><span class="v" data-k="hi">--</span></div>
        <div><span class="k lies">LIES</span><span class="v" data-k="lies">0</span></div>
      </div>
      <div class="hs-logo">FRANKENSTEIN</div>
      <div class="table">
        <div class="thead"><span>RANK</span><span>NAME</span><span>MATCH</span></div>
        <div class="rows"></div>
      </div>
      <div class="hero">
        <div class="num" data-k="pct">--</div>
        <div class="cap" data-k="cap">OF THE GAME<br>RECOVERED</div>
        <div class="run" data-k="run"></div>
      </div>
      <div class="cart"><div class="lbl">CARTRIDGE <span>· GREY = LIBRARY</span></div><canvas width="1680" height="56"></canvas></div>
      <div class="key"><em>? = OUR GUESS.</em> EVERYTHING ELSE IS PROVED.</div>
      <div class="banner" data-k="banner"></div>
      <div class="ticker">${tickerHtml()}</div>`;
    this.rowsEl = this.el.querySelector('.rows')!;
    this.meter = this.el.querySelector('canvas')!;
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    setText(this.el, 'up', String(s.matched.length));
    // arcade metaphor: HI-SCORE is every function in the game; the hero % is of the whole game
    const total = gameTotal(ctx);
    setText(this.el, 'hi', total ? String(total) : '--');
    setText(this.el, 'lies', String(s.falseClaims.length));
    setText(this.el, 'pct', total ? `${gamePct(ctx)}%` : '--');
    const capEl = this.el.querySelector('[data-k="cap"]') as HTMLElement;
    const cap = `OF ${gameName(s)}<br>RECOVERED`;
    if (capEl.innerHTML !== cap) capEl.innerHTML = cap;
    setText(this.el, 'run', s.fnTotal && s.fnTotal !== total ? `${s.matched.length}/${s.fnTotal} THIS RUN` : '');
    renderRows(this.rowsEl, ctx, 6, this.memo, this.liar);
    this.fitNames();
    drawMeter(this.meter, ctx);
    renderTicker(this.el, s, ctx.reduced);
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'matched') {
      coin();
      const s = ctx.state;
      const total = gameTotal(ctx);
      if (!total) return;
      const now = (100 * s.matched.length) / total;
      const before = (100 * (s.matched.length - 1)) / total;
      for (const [m, line] of MILESTONES) if (before < m && now >= m) this.banner(ctx, line);
    } else if (e.kind === 'reset') {
      this.memo = { key: '', top: '' };
      this.liar = null;
    }
  }

  /** A liar row in alarm red at the top of the table (main cuts to Versus a second later). */
  showLiar(ctx: Ctx, c: FalseClaim) {
    this.liar = `<div class="row liar"><span class="rk">LIAR</span><span class="nm">${esc(c.actor.toUpperCase())} · ${esc(c.fn)}</span><span class="pc">${c.match_pct.toFixed(0)}%</span></div>`;
    clearTimeout(this.liarTimer);
    this.liarTimer = window.setTimeout(() => { this.liar = null; this.memo.key = ''; ctx.invalidate(); }, 1600);
    this.memo.key = '';
    ctx.invalidate();
  }

  private banner(ctx: Ctx, text: string) {
    const el = this.el.querySelector('[data-k="banner"]') as HTMLElement;
    el.textContent = text;
    el.classList.add('on');
    announce(text);
    clearTimeout(this.bannerTimer);
    this.bannerTimer = window.setTimeout(() => el.classList.remove('on'), ctx.reduced ? 1500 : 2200);
  }

  /** Long guessed names shrink (never below 28 px) instead of being cut off. */
  private fitNames() {
    this.rowsEl.querySelectorAll<HTMLElement>('.nm').forEach((el) => {
      if (el.dataset.fit === el.textContent) return;
      el.dataset.fit = el.textContent ?? '';
      el.style.fontSize = '';
      const len = (el.textContent ?? '').length;
      const px = Math.max(28, Math.min(40, Math.floor(el.clientWidth / Math.max(1, len))));
      el.style.fontSize = `${px}px`;
    });
  }
}
