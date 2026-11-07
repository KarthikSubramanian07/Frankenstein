// Scene 2: Versus. Every false claim: Digger vs Referee, the exact instruction that lied, K.O.
// With no lie in the run, it shows the newest real claim the Checker re-ran and upheld, with the
// referee's verdict and the fake gate (SubQ Snap, Gemini). Never a staged lie.
import type { Ctx, Scene } from '../types.ts';
import { h, esc, diffIns } from '../types.ts';
import type { Checked, Effect, FalseClaim, Review, State } from '../state.ts';
import { modelName } from '../state.ts';
import { reject } from '../audio.ts';

const pc = (x: number | null) => (x == null ? '--' : `${(x * 100).toFixed(1)}%`);
const LAB: Record<string, string> = { snap: 'SUBQ SNAP', gemini: 'GEMINI' };

export class VersusScene implements Scene {
  id = 'versus' as const;
  el = h('section', 'scene versus idle');
  private shown: FalseClaim | null = null;
  private checked: Checked | null = null;
  private checkedAt = 0;
  private koTimer = 0;

  constructor() {
    this.el.innerHTML = `
      <div class="bg"></div>
      <div class="waiting"><h1>HERE COMES A CLAIM</h1><p>Waiting for a digger to say "matched".</p><p data-k="wtally"></p></div>
      <div class="fight">
        <div class="top">
          <div><div class="hbar"><i data-k="hpL"></i></div><div class="cap" data-k="capL"></div></div>
          <div class="round">TRY<b data-k="round">1</b></div>
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
    else if (ctx.state.lastChecked) this.upheld(ctx, ctx.state.lastChecked);
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const w = this.el.querySelector('[data-k="wtally"]')!;
    const t = `LIES CAUGHT SO FAR: ${s.falseClaims.length}`;
    if (w.textContent !== t) w.textContent = t;
    if (!this.shown && s.falseClaims.length && ctx.current() === 'versus') this.play(ctx, s.falseClaims[s.falseClaims.length - 1]);
    // no lies: keep showing real upheld claims, refreshed at most every 4 s so it can be read
    else if (!this.shown && s.lastChecked && ctx.current() === 'versus'
      && (this.checked !== s.lastChecked || this.checked.reviews !== s.lastChecked.reviews)
      && (performance.now() - this.checkedAt > 4000 || !this.checked)) this.upheld(ctx, s.lastChecked);
    const tl = this.el.querySelector('[data-k="tally"]')!;
    const tt = this.shown ? `LIE ${this.shown.index} OF ${s.falseClaims.length} CAUGHT · ${s.claimsMade} CLAIMS CHECKED`
      : this.checked ? `${s.claimsMade} CLAIMS RE-CHECKED. ${s.falseClaims.length} LIES.` : '';
    if (tl.textContent !== tt) tl.textContent = tt;
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'falseClaim' && ctx.current() === 'versus') this.play(ctx, e.c);
    if (e.kind === 'reset') { this.shown = null; this.checked = null; this.el.classList.add('idle'); this.el.classList.remove('ok'); }
  }

  /** a true claim, checked three ways: Muse wrote it, the fake gate screened it, the compiler proved it */
  upheld(ctx: Ctx, c: Checked) {
    this.checked = c;
    this.checkedAt = performance.now();
    this.el.classList.remove('idle');
    this.el.classList.add('ok');
    const s = ctx.state;
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    q('hpL').style.width = `${c.match_pct}%`;
    q('capL').textContent = `CLAIM ${c.match_pct.toFixed(0)}%`;
    q('round').textContent = String(c.attempt);
    q('digger').textContent = c.actor.toUpperCase();
    q('speech').textContent = `"${c.text}"`;
    q('refline').innerHTML = `RE-RAN THE COMPILER<br>${esc(c.status)} · ${c.match_pct.toFixed(0)}%`;
    // Muse wrote it. Snap checked it. The compiler proved it (largest line, last).
    const lines = [`<div class="where">${esc(c.fn)} · THE CLAIM, CHECKED THREE WAYS</div>`,
      `<div class="m"><span class="lbl">MUSE</span>${esc(modelName(c.model ?? s.model).replace(/^MUSE /, ''))} WROTE IT</div>`];
    lines.push(...gateLines(s, c.reviews));
    lines.push(`<div class="c"><span class="lbl">COMPILER</span><span class="exp">${c.status === 'MATCH' ? 'BYTE-IDENTICAL' : esc(c.status)}</span></div>`);
    q('evidence').innerHTML = lines.join('');
    const ko = q('ko');
    ko.innerHTML = c.upheld ? '<b>TRUE</b><span>CLAIM UPHELD</span>' : '<b>NO</b><span>NOT ACCEPTED</span>';
    ko.classList.remove('on');
    void ko.offsetWidth;
    ko.classList.add('on');
  }

  /** set up the card; after a 1 s hold the referee lands the K.O. */
  play(ctx: Ctx, c: FalseClaim) {
    this.shown = c;
    this.el.classList.remove('idle', 'ok');
    (this.el.querySelector('[data-k="ko"]') as HTMLElement).innerHTML = '<b>K.O.</b><span>CLAIM REJECTED</span>';
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
      q('evidence').innerHTML = `<div class="where">${esc(c.fn)} · FIRST WRONG BYTE AT +0x${d.offset.toString(16).toUpperCase()}</div>
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

/** The fake gate on a match: per-lab scores when they belong to this match, else the run's screening so far. */
function gateLines(s: State, reviews: Review[]): string[] {
  if (reviews.length) {
    // these scores attach only at fn.matched, i.e. after the fake gate let the match through
    return reviews.map((r) => `<div class="g"><span class="lbl">${esc(LAB[r.reviewer] ?? r.reviewer.toUpperCase())}</span>PASSED <small>${pc(r.fakematch_p)} fake odds</small></div>`);
  }
  if (!s.reviews.length) return [];
  const worst = Math.max(...s.reviews.map((r) => r.fakematch_p ?? 0));
  return [`<div class="g"><span class="lbl">SUBQ SNAP</span>SCREENED ${s.reviews.length} <small>worst ${pc(worst)} fake odds</small></div>`];
}
