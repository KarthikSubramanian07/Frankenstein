// Scene 2: Caught. One idea: a Digger claimed a match; the Checker re-ran the compiler.
// REJECTED (blood, stamped) for a false claim or a byte-identical fake, CONFIRMED (toxic) when the claim held.
// Only real events: the newest false claim or rejected fake, else the newest claim the Checker upheld.
// Never a staged lie. The tally at the foot is counted from the stream, so 0 lies reads as 0 lies.
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
const CLAIM_MAX = 72;
/** cut a long line at a word boundary, never mid-word */
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

/** the Digger who submitted fn+attempt, and what it said (from claim.made) */
function claimOf(s: State, fn: string, attempt: number): { actor: string; text: string } | null {
  let hit: { actor: string; text: string } | null = null;
  for (const [k, text] of s.claims) {
    const [kf, ka, kat] = k.split('|');
    if (kf === fn && Number(kat) === attempt) hit = { actor: ka, text };
  }
  return hit;
}

/** a Digger's own words, quoted; the crew's "(auto-submitted …)" placeholder is not a quote */
const quote = (t: string | null | undefined) =>
  t && !t.startsWith('(') ? `<p class="vs-quote">“${esc(clip(t, CLAIM_MAX))}”</p>` : '';

const p2 = (x: number) => x.toFixed(2);

export class VersusScene implements Scene {
  id = 'versus' as const;
  el = h('section', 'scene versus');
  private who: HTMLElement;
  private quote: HTMLElement;
  private word: HTMLElement;
  private detail: HTMLElement;
  private meta: HTMLElement;
  private tally: HTMLElement;
  private shownObj: object | null | undefined = undefined;
  private tallyKey = '';
  private loud: object | null = null; // a lie or fake that arrived live and has not been stamped yet

  constructor() {
    this.el.innerHTML = `
      <div class="vs-col">
        <p class="vs-who" data-k="who"></p>
        <div data-k="quote"></div>
        <div class="vs-stage"><h1 class="vs-word" data-k="word"></h1></div>
        <div class="vs-detail" data-k="detail"></div>
        <p class="vs-meta" data-k="meta"></p>
      </div>
      <p class="vs-tally" data-k="tally"></p>`;
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    this.who = q('who');
    this.quote = q('quote');
    this.word = q('word');
    this.detail = q('detail');
    this.meta = q('meta');
    this.tally = q('tally');
  }

  enter(ctx: Ctx) { this.shownObj = undefined; this.tallyKey = ''; this.render(ctx); }

  render(ctx: Ctx) {
    this.drawTally(ctx.state);
    const x = pick(ctx.state);
    const obj = objOf(x);
    if (obj === this.shownObj) return;
    this.shownObj = obj;
    this.draw(ctx.state, x);
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

  /** real counts from the stream: claims staked, lies caught, fakes refused */
  private drawTally(s: State) {
    const key = `${s.claimsMade}|${s.falseClaims.length}|${s.fakes.length}`;
    if (key === this.tallyKey) return;
    this.tallyKey = key;
    const n = (v: number, one: string, many: string) => `<b>${v}</b> ${v === 1 ? one : many}`;
    this.tally.innerHTML = s.claimsMade
      ? [n(s.claimsMade, 'claim checked', 'claims checked'), n(s.falseClaims.length, 'lie caught', 'lies caught'),
        n(s.fakes.length, 'fake refused', 'fakes refused')].join('<i>·</i>')
      : '';
  }

  private draw(s: State, x: Shown) {
    this.el.dataset.v = x.kind;
    if (x.kind === 'none') {
      this.who.textContent = '';
      this.quote.innerHTML = '';
      this.word.textContent = 'NO CLAIMS YET';
      this.detail.innerHTML = '<p class="vs-text">The Checker re-runs the compiler on every claimed match.</p>';
      this.meta.textContent = '';
      return;
    }
    const fn = x.kind === 'fake' ? x.f.fn : x.c.fn;
    const attempt = x.kind === 'fake' ? x.f.attempt : x.c.attempt;
    const cl = claimOf(s, fn, attempt);
    const actor = x.kind === 'fake' ? cl?.actor ?? 'digger' : x.c.actor;
    this.who.innerHTML = `<span class="p1">${esc(actor)}</span> claimed a match<i>vs</i><span class="p2">checker</span> recompiled it`;
    this.quote.innerHTML = quote(x.kind === 'lie' ? x.c.claim_text : x.kind === 'fake' ? cl?.text : x.c.text);
    const where = `${esc(fn)} · attempt ${attempt}`;

    if (x.kind === 'ok') {
      this.word.textContent = 'CONFIRMED';
      this.detail.innerHTML = '<p class="vs-text">Every byte matches the original.</p>';
      const labs = x.c.reviews.filter((r) => r.fakematch_p != null).map((r) => `${esc(r.reviewer)} fake ${p2(r.fakematch_p!)}`);
      this.meta.innerHTML = [where, ...labs].join('<i>·</i>');
      return;
    }
    this.word.textContent = 'REJECTED';
    if (x.kind === 'fake') {
      this.detail.innerHTML = `<p class="vs-same">byte match · rejected</p>
        <p class="vs-text">The bytes are identical, but ${esc(clip(x.f.reason || 'the Checker refused how it got there'))}.</p>`;
      this.meta.innerHTML = where;
      return;
    }
    const d = x.c.first_diff;
    if (d) {
      const ins = diffIns(d.expected_ins, d.got_ins);
      this.detail.innerHTML = `<div class="vs-ins">
        <span class="lbl">expected</span><code>${ins.exp}</code>
        <span class="lbl">got</span><code class="got">${ins.got}</code></div>`;
    } else {
      this.detail.innerHTML = '<p class="vs-text">The bytes do not match the original.</p>';
    }
    this.meta.innerHTML = `${where}<i>·</i>${esc(x.c.status || 'no match')} · ${x.c.match_pct.toFixed(1)}% of bytes match`;
  }
}
