// Scene 1: Split. Left 1000 px is the game (OBS puts mGBA under it), right is the rebuild:
// hi-score table and the code window. One hero number: NOW RUNNING ON NN% AGENT-WRITTEN CODE.
import type { Ctx, Scene } from '../types.ts';
import { h, esc, diffIns } from '../types.ts';
import type { Effect, FalseClaim, State } from '../state.ts';
import type { Region } from '../data.ts';
import { coin, reject } from '../audio.ts';
import { hudHtml, renderHud, tickerHtml, renderTicker, renderRows, drawMeter, setText } from './common.ts';
import type { RowsMemo } from './common.ts';

const FRAME = { x: 20, y: 92, scale: 4 }; // 240x160 GBA at 4x = 960x640
const ROW0 = { x: 1040, y: 196 }; // the top hi-score row, where beams start
const STATUS_TEXT: Record<string, string> = { MATCH: 'MATCH', PARTIAL: 'PARTIAL', LINT_FAIL: 'LINT FAIL', NO_COMPILE: 'NO COMPILE' };

export function regionRect(r: Region) {
  return { x: FRAME.x + r.x * FRAME.scale, y: FRAME.y + r.y * FRAME.scale, w: r.w * FRAME.scale, h: r.h * FRAME.scale };
}

export class SplitScene implements Scene {
  id = 'split' as const;
  el = h('section', 'scene split');
  private rowsEl: HTMLElement;
  private pre: HTMLElement;
  private stampEl: HTMLElement;
  private pipEl: HTMLElement;
  private badgeEl: HTMLElement;
  private meter: HTMLCanvasElement;
  private memo: RowsMemo = { key: '', top: '' };
  private typing: { text: string; shown: number; t0: number; cps: number } | null = null;
  private codeKey = '';
  private pipTimer = 0;
  private badgeKey = '';

  constructor() {
    this.el.innerHTML = `
      <div class="hud">${hudHtml()}</div>
      <div class="game-frame"><div class="ph">GAME CAPTURE<br>mGBA, 4× SCALE</div></div>
      <div class="badge orig"><div class="l1">NOW RUNNING ON</div><div class="l2" data-k="badge">ORIGINAL CODE</div></div>
      <div class="divider"></div>
      <div class="panel">
        <h2><span>HI-SCORE</span><small>MATCH</small></h2>
        <div class="rows"></div>
        <div class="codewin">
          <div class="bar"><span class="who" data-k="who">WAITING</span><span data-k="fn"></span><span class="try" data-k="try"></span></div>
          <pre></pre>
          <div class="stamp"></div>
        </div>
        <div class="meter"><div class="lbl">CARTRIDGE</div><canvas width="852" height="48"></canvas></div>
        <div class="keyline"><em>? = our guess.</em> Everything else is proved.</div>
        <div class="pip"></div>
      </div>
      <div class="ticker">${tickerHtml()}</div>`;
    this.rowsEl = this.el.querySelector('.rows')!;
    this.pre = this.el.querySelector('pre')!;
    this.stampEl = this.el.querySelector('.stamp')!;
    this.pipEl = this.el.querySelector('.pip')!;
    this.badgeEl = this.el.querySelector('.badge')!;
    this.meter = this.el.querySelector('canvas')!;
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    renderHud(this.el, s);
    renderRows(this.rowsEl, ctx, 6, this.memo, null);
    this.renderCode(ctx);
    this.renderBadge(s);
    drawMeter(this.meter, ctx);
    renderTicker(this.el, s, ctx.reduced);
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'matched') {
      const sub = ctx.side.fnToSub.get(e.m.fn);
      const land = regionRect(sub ? sub.region : { x: 0, y: 0, w: 240, h: 160 });
      ctx.fx.beam(ROW0, { x: land.x + land.w / 2, y: land.y + land.h / 2 }, land, '#7CF2C8', () => coin());
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
      this.memo = { key: '', top: '' };
      this.rowsEl.innerHTML = '';
      this.codeKey = '';
      this.badgeKey = '';
      this.typing = null;
      this.pre.textContent = '';
      this.stampEl.className = 'stamp';
      this.pipEl.classList.remove('on');
    }
  }

  /** the code window is still typing (main loop keeps rendering while true) */
  busy() { return !!this.typing && this.typing.shown < this.typing.text.length; }

  private renderCode(ctx: Ctx) {
    const a = ctx.state.lastAttempt;
    if (!a) return;
    const key = `${a.fn}|${a.actor}|${a.attempt}`;
    if (key !== this.codeKey) {
      this.codeKey = key;
      setText(this.el, 'who', a.actor.toUpperCase());
      setText(this.el, 'fn', a.fn);
      setText(this.el, 'try', `TRY ${a.attempt}`);
      const instant = ctx.reduced || ctx.state.speed >= 12;
      this.typing = { text: a.src, shown: instant ? a.src.length : 0, t0: performance.now(), cps: 260 * Math.max(1, ctx.state.speed) };
      this.stampEl.className = 'stamp';
    }
    const t = this.typing;
    if (!t) return;
    const target = Math.min(t.text.length, Math.floor(((performance.now() - t.t0) / 1000) * t.cps));
    if (target !== t.shown || !this.pre.childNodes.length) {
      t.shown = Math.max(t.shown, target);
      const lines = t.text.slice(0, t.shown).split('\n').slice(-9).join('\n');
      this.pre.innerHTML = `<span>${esc(lines)}${t.shown < t.text.length ? '<i class="caret"></i>' : ''}</span>`;
    }
  }

  private showStamp(status: string, lie: boolean, pct: number) {
    const el = this.stampEl;
    el.innerHTML = `${esc(lie ? 'LIE' : STATUS_TEXT[status] ?? status)}${status === 'PARTIAL' || lie ? `<small>${pct.toFixed(1)}% · REJECTED</small>` : ''}`;
    el.className = `stamp ${lie ? 'LIE' : status}`;
    void el.offsetWidth;
    el.classList.add('on');
  }

  private showPip(ctx: Ctx, c: FalseClaim) {
    const d = c.first_diff;
    const ins = d ? diffIns(d.expected_ins, d.got_ins) : null;
    this.pipEl.innerHTML = `
      <div class="vs-row"><span>${esc(c.actor.toUpperCase())}</span><span class="vs">VS</span><span>REFEREE</span></div>
      <div class="bars"><div class="hbar"><i style="width:${c.match_pct}%"></i></div><div class="hbar r"><i style="width:100%"></i></div></div>
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
    const key = s.pctAgentCode == null ? 'orig' : s.pctAgentCode.toFixed(1);
    if (key === this.badgeKey) return;
    this.badgeKey = key;
    const l2 = this.el.querySelector('[data-k="badge"]')!;
    if (s.pctAgentCode == null) { this.badgeEl.classList.add('orig'); l2.textContent = 'ORIGINAL CODE'; return; }
    this.badgeEl.classList.remove('orig');
    l2.innerHTML = `<b>${key}%</b><span>AGENT-WRITTEN CODE</span>`;
  }
}
