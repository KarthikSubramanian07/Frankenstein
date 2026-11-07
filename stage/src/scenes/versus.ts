// Scene 2: Versus. Every false claim: Digger vs Referee, the exact instruction that lied, K.O.
import type { Ctx, Scene } from '../types.ts';
import { h, esc, diffIns } from '../types.ts';
import type { Effect, FalseClaim } from '../state.ts';
import { reject } from '../audio.ts';

export class VersusScene implements Scene {
  id = 'versus' as const;
  el = h('section', 'scene versus idle');
  private shown: FalseClaim | null = null;
  private koTimer = 0;

  constructor() {
    this.el.innerHTML = `
      <div class="bg"></div>
      <div class="waiting"><h1>HERE COMES A CLAIM</h1><p>Waiting for a digger to say "matched".</p><p data-k="wtally"></p></div>
      <div class="fight">
        <div class="top">
          <div><div class="hbar"><i data-k="hpL"></i></div><div class="cap" data-k="capL"></div></div>
          <div class="round">ROUND<b data-k="round">1</b></div>
          <div><div class="hbar r"><i data-k="hpR" style="width:100%"></i></div><div class="cap r">PROOF 100%</div></div>
        </div>
        <div class="names"><span data-k="digger">DIGGER</span><span>REFEREE</span></div>
        <div class="vs">VS</div>
        <div class="speech" data-k="speech"></div>
        <div class="refline" data-k="refline"></div>
        <div class="evidence" data-k="evidence"></div>
        <div class="ko" data-k="ko"><b>K.O.</b><span>CLAIM REJECTED</span></div>
        <div class="tally" data-k="tally"></div>
      </div>`;
  }

  enter(ctx: Ctx) {
    const last = ctx.state.falseClaims[ctx.state.falseClaims.length - 1];
    if (last && last !== this.shown) this.play(ctx, last);
    else if (this.shown) this.ko(ctx, false);
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const w = this.el.querySelector('[data-k="wtally"]')!;
    const t = `LIES CAUGHT SO FAR: ${s.falseClaims.length}`;
    if (w.textContent !== t) w.textContent = t;
    if (!this.shown && s.falseClaims.length && ctx.current() === 'versus') this.play(ctx, s.falseClaims[s.falseClaims.length - 1]);
    const tl = this.el.querySelector('[data-k="tally"]')!;
    const tt = this.shown ? `LIE ${this.shown.index} OF ${s.falseClaims.length} CAUGHT · ${s.claimsMade} CLAIMS CHECKED` : '';
    if (tl.textContent !== tt) tl.textContent = tt;
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'falseClaim' && ctx.current() === 'versus') this.play(ctx, e.c);
    if (e.kind === 'reset') { this.shown = null; this.el.classList.add('idle'); }
  }

  /** set up the card; after a 1 s hold the referee lands the K.O. */
  play(ctx: Ctx, c: FalseClaim) {
    this.shown = c;
    this.el.classList.remove('idle');
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    q('hpL').style.width = `${c.match_pct}%`;
    q('capL').textContent = `CLAIM ${c.match_pct.toFixed(1)}%`;
    q('round').textContent = String(c.attempt);
    q('digger').textContent = c.actor.toUpperCase();
    q('speech').textContent = c.claim_text ? `"${c.claim_text}"` : '"Matched it."';
    q('refline').innerHTML = `RE-RAN THE COMPILER<br>${esc(c.status)} · ${c.match_pct.toFixed(1)}%`;
    const d = c.first_diff;
    if (d) {
      const ins = diffIns(d.expected_ins, d.got_ins);
      q('evidence').innerHTML = `<div class="where">${esc(c.fn)} · FIRST DIFFERENCE AT BYTE +0x${d.offset.toString(16).toUpperCase()} · ${esc(d.expected)} ≠ ${esc(d.got)}</div>
        <div><span class="lbl">EXPECTED</span><span class="exp">${esc(d.expected_ins)}</span></div>
        <div><span class="lbl">GOT</span>${ins.got}</div>`;
    } else {
      q('evidence').innerHTML = `<div class="where">${esc(c.fn)}</div><div><span class="lbl">VERDICT</span>${esc(c.status)}</div>`;
    }
    q('ko').classList.remove('on');
    clearTimeout(this.koTimer);
    this.koTimer = window.setTimeout(() => this.ko(ctx, true), ctx.reduced ? 0 : 1000);
  }

  private ko(ctx: Ctx, loud: boolean) {
    const ko = this.el.querySelector('[data-k="ko"]')!;
    ko.classList.remove('on');
    void (ko as HTMLElement).offsetWidth;
    ko.classList.add('on');
    if (loud && ctx.current() === 'versus') { ctx.fx.flash(); ctx.fx.shake(); reject(); }
  }
}
