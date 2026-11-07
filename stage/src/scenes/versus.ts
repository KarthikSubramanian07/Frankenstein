// Scene 2: Caught. One idea: the agent claimed it was right; the Checker re-ran the compiler.
// REJECTED (blood) with the one wrong instruction, or CONFIRMED (toxic) when the claim was true.
// Only real events: the newest false claim or rejected fake, else the newest claim the Checker upheld.
// Never a staged lie.
import './versus.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc, diffIns } from '../types.ts';
import type { Checked, Effect, FakeRejected, FalseClaim, State } from '../state.ts';
import { reject } from '../audio.ts';

type Shown =
  | { kind: 'lie'; c: FalseClaim }
  | { kind: 'fake'; f: FakeRejected }
  | { kind: 'ok'; c: Checked }
  | { kind: 'none' };

const REASON_MAX = 64;
/** cut a long reason at a word boundary, never mid-word */
function clip(s: string, n = REASON_MAX): string {
  const t = s.replace(/\s+/g, ' ').trim();
  if (t.length <= n) return t;
  const cut = t.slice(0, n);
  const sp = cut.lastIndexOf(' ');
  return `${(sp > n * 0.6 ? cut.slice(0, sp) : cut).replace(/[\s,;:.-]+$/, '')}…`;
}

/** newest of lies and fakes by ts; else the newest upheld claim; else nothing */
function pick(s: State): Shown {
  const lie = s.falseClaims[s.falseClaims.length - 1];
  const fake = s.fakes[s.fakes.length - 1];
  if (lie && (!fake || lie.ts >= fake.ts)) return { kind: 'lie', c: lie };
  if (fake) return { kind: 'fake', f: fake };
  if (s.lastChecked?.upheld) return { kind: 'ok', c: s.lastChecked };
  return { kind: 'none' };
}

const objOf = (x: Shown) => (x.kind === 'lie' ? x.c : x.kind === 'fake' ? x.f : x.kind === 'ok' ? x.c : null);

export class VersusScene implements Scene {
  id = 'versus' as const;
  el = h('section', 'scene versus');
  private claim: HTMLElement;
  private word: HTMLElement;
  private detail: HTMLElement;
  private shownObj: object | null | undefined = undefined;
  private loud: object | null = null; // a lie or fake that arrived live and has not been stamped yet

  constructor() {
    this.el.innerHTML = `
      <div class="vs-col">
        <p class="vs-claim" data-k="claim"></p>
        <h1 class="vs-word" data-k="word"></h1>
        <div class="vs-detail" data-k="detail"></div>
      </div>`;
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    this.claim = q('claim');
    this.word = q('word');
    this.detail = q('detail');
  }

  enter(ctx: Ctx) { this.shownObj = undefined; this.render(ctx); }

  render(ctx: Ctx) {
    const x = pick(ctx.state);
    const obj = objOf(x);
    if (obj === this.shownObj) return;
    this.shownObj = obj;
    this.draw(x);
    if (x.kind === 'none') return;
    // stamp the word in, once per new verdict
    this.word.classList.remove('stamp');
    void this.word.offsetWidth;
    this.word.classList.add('stamp');
    if (obj && obj === this.loud && ctx.current() === 'versus') {
      this.loud = null;
      if (!ctx.reduced) { ctx.fx.flash(); ctx.fx.shake(); }
      reject();
    }
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'falseClaim') this.loud = e.c;
    else if (e.kind === 'fake') this.loud = e.f;
    else if (e.kind === 'reset') { this.loud = null; this.shownObj = undefined; }
    else return;
    if (ctx.current() === 'versus') this.render(ctx);
  }

  private draw(x: Shown) {
    this.el.dataset.v = x.kind;
    if (x.kind === 'none') {
      this.claim.textContent = '';
      this.word.textContent = 'NO CLAIMS YET';
      this.detail.innerHTML = '';
      return;
    }
    this.claim.textContent = 'Agent claimed it was right';
    if (x.kind === 'ok') {
      this.word.textContent = 'CONFIRMED';
      this.detail.innerHTML = '<p class="vs-text">Every byte matches the original.</p>';
      return;
    }
    this.word.textContent = 'REJECTED';
    if (x.kind === 'fake') {
      this.detail.innerHTML = `<p class="vs-text">Bytes matched, but: <b>${esc(clip(x.f.reason || 'the Checker refused it'))}</b></p>`;
      return;
    }
    const d = x.c.first_diff;
    if (d) {
      const ins = diffIns(d.expected_ins, d.got_ins);
      this.detail.innerHTML = `<div class="vs-ins">
        <span class="lbl">expected</span><code>${ins.exp}</code>
        <span class="lbl">got</span><code>${ins.got}</code></div>`;
    } else {
      this.detail.innerHTML = `<p class="vs-text">Only ${x.c.match_pct.toFixed(1)}% of the bytes match.</p>`;
    }
  }
}
