// Scene 1: Split. Left 1000 px is the game (OBS puts mGBA under it; otherwise the cartridge map), right is
// the rebuild: the hi-score table (who wrote each match), the code window, and the proof chain:
// Muse writes it. Snap judges it. The compiler proves it.
import type { Ctx, Scene } from '../types.ts';
import { h, esc, diffIns } from '../types.ts';
import type { Effect, FalseClaim, SnapDecision, State } from '../state.ts';
import { modelName } from '../state.ts';
import type { Region } from '../data.ts';
import { coin, reject } from '../audio.ts';
import { announce } from '../voice.ts';
import { hudHtml, renderHud, tickerHtml, renderTicker, renderRows, setText, gameName, gameTotal, writer } from './common.ts';
import { Mosaic, FACE_FN } from './mosaic.ts';
import type { RowsMemo } from './common.ts';

const FRAME = { x: 20, y: 92, scale: 4 }; // 240x160 GBA at 4x = 960x640
const ROW0 = { x: 1040, y: 196 }; // the top hi-score row, where beams start
const STATUS_TEXT: Record<string, string> = { MATCH: 'MATCH', PARTIAL: 'PARTIAL', LINT_FAIL: 'LINT FAIL', NO_COMPILE: 'NO COMPILE' };
const HOLD_MS = 3200; // a steering decision (triage, escalate, director) stays up this long before fake-gate reviews replace it

const pc = (x: number | null | undefined) => (x == null ? '--' : `${(x * 100).toFixed(1)}%`);
const short = (m: string | null | undefined) => modelName(m).replace(/^MUSE /, '');

export function regionRect(r: Region) {
  return { x: FRAME.x + r.x * FRAME.scale, y: FRAME.y + r.y * FRAME.scale, w: r.w * FRAME.scale, h: r.h * FRAME.scale };
}

/** A proof-chain line: who (tag), what they did in plain words (big), the evidence (small). */
export type ChainLine = { tag: string; big: string; small: string; cls: string };

/** What SubQ Snap (or Gemini, the second lab) just decided, in plain words. */
export function snapLine(d: SnapDecision, s: State): ChainLine {
  const p = d.p ?? {};
  const sure = typeof p.confidence === 'number' ? `${Math.round(p.confidence * 100)}% sure` : '';
  switch (d.op) {
    case 'review': {
      const gem = String(p.reviewer ?? 'snap') === 'gemini';
      return { tag: gem ? 'GEMINI' : 'SNAP', big: gem ? 'SECOND OPINION' : 'SCREENED FOR FAKES', cls: gem ? 'gem' : 'snap',
        small: `${pc(p.fakematch_p)} chance it's faked · ${pc(p.recital_p)} copied` };
    }
    case 'decide_next': {
      const a = String(p.action ?? 'keep');
      const big = a === 'escalate' ? `SENT IT TO ${short(s.escalationModel ?? 'muse-wonder-1.0')}` : a === 'abandon' ? 'GAVE UP ON IT' : 'KEEP DIGGING';
      return { tag: 'SNAP', big, small: [sure, d.fn ? `${d.fn}, after try ${p.attempt ?? '?'}` : ''].filter(Boolean).join(' · '), cls: 'snap' };
    }
    case 'triage': return { tag: 'SNAP', big: 'PICKED THE ORDER', small: `read ${p.functions ?? '?'} functions at once`, cls: 'snap' };
    case 'director': return { tag: 'SNAP', big: 'PICKED FROM PLAY', small: `next up: ${d.fn ?? (p.fns?.[0] ?? '?')}${sure ? ` · ${sure}` : ''}`, cls: 'snap' };
    case 'eyes': return { tag: 'SNAP', big: 'WATCHED THE GAME', small: 'compared two frames', cls: 'snap' };
    case 'route': return { tag: 'SNAP', big: 'ROUTED A REQUEST', small: 'plain words to functions', cls: 'snap' };
    default: return { tag: 'SNAP', big: d.op.toUpperCase(), small: '', cls: 'snap' };
  }
}

export class SplitScene implements Scene {
  id = 'split' as const;
  el = h('section', 'scene split');
  private rowsEl: HTMLElement;
  private pre: HTMLElement;
  private stampEl: HTMLElement;
  private pipEl: HTMLElement;
  private badgeEl: HTMLElement;
  private memo: RowsMemo = { key: '', top: '' };
  private typing: { text: string; shown: number; t0: number; cps: number } | null = null;
  private codeKey = '';
  private pipTimer = 0;
  private badgeKey = '';
  private mosaic = new Mosaic(20, 92);
  private total = 0;
  private game = 'DOOM';
  private ph: HTMLElement;
  private snapShown: SnapDecision | null = null;
  private snapAt = 0;
  private proofKey = '';

  constructor() {
    this.el.innerHTML = `
      <div class="hud">${hudHtml()}</div>
      <div class="game-frame"><div class="ph"></div></div>
      <div class="face-hero" data-k="faceHero"></div>
      <div class="legend"><span class="sw ok"></span>PROVED<span class="sw q">?</span>OUR GUESS<span class="sw st"></span>NOT BACK YET</div>
      <div class="badge orig"><div class="l1">NOW RUNNING ON</div><div class="l2" data-k="badge">ORIGINAL CODE</div></div>
      <div class="divider"></div>
      <div class="panel">
        <h2><span>HI-SCORE</span><small>WRITTEN BY</small></h2>
        <div class="rows"></div>
        <div class="codewin">
          <div class="bar"><span class="who" data-k="who">WAITING</span><span data-k="fn"></span><span class="try" data-k="try"></span></div>
          <pre></pre>
          <div class="stamp"></div>
        </div>
        <div class="chain">
          <div class="pl muse" data-k="lMuse"><b>MUSE</b><span class="big"></span><span class="small"></span></div>
          <div class="pl snap" data-k="lSnap"><b>SNAP</b><span class="big"></span><span class="small"></span></div>
          <div class="pl proof" data-k="lProof"><b>PROOF</b><span class="big"></span><span class="small"></span></div>
        </div>
        <div class="tip">Muse writes it. Snap judges it. The compiler proves it.</div>
        <div class="pip"></div>
      </div>
      <div class="ticker">${tickerHtml()}</div>`;
    this.rowsEl = this.el.querySelector('.rows')!;
    this.pre = this.el.querySelector('pre')!;
    this.stampEl = this.el.querySelector('.stamp')!;
    this.pipEl = this.el.querySelector('.pip')!;
    this.badgeEl = this.el.querySelector('.badge')!;
    this.ph = this.el.querySelector('.ph')!;
    this.el.querySelector('.game-frame')!.prepend(this.mosaic.cv);
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    renderHud(this.el, s);
    renderRows(this.rowsEl, ctx, 3, this.memo, null, writer);
    this.renderCode(ctx);
    this.renderProof(ctx);
    this.total = gameTotal(ctx);
    this.game = gameName(s);
    this.renderBadge(s);
    renderTicker(this.el, s, ctx.reduced);
    // the game window: live capture in OBS; otherwise the cartridge map (a bench run is not Doom)
    const ph = s.bench ? 'BENCH RUN<br>NOT DOOM' : '';
    if (this.ph.innerHTML !== ph) this.ph.innerHTML = ph;
    this.mosaic.cv.style.display = s.bench || ctx.obs ? 'none' : 'block';
    if (!s.bench && !ctx.obs) this.mosaic.draw(ctx, performance.now());
  }

  /** the map animates its static and the proof chain holds decisions on a timer, so Split keeps rendering */
  animating(ctx: Ctx) { return !ctx.obs && !ctx.reduced; }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'matched') {
      const sub = ctx.side.fnToSub.get(e.m.fn);
      const cell = ctx.obs ? null : this.mosaic.rectOf(ctx, e.m.fn);
      const land = cell ?? regionRect(sub ? sub.region : { x: 0, y: 0, w: 240, h: 160 });
      const fn = e.m.fn;
      const face = fn === FACE_FN;
      ctx.fx.beam(ROW0, { x: land.x + land.w / 2, y: land.y + land.h / 2 }, land, face ? '#9A9AFF' : '#7CF2C8', () => {
        coin();
        this.mosaic.land(fn);
        if (face) this.faceHero(ctx);
      });
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
      this.proofKey = '';
      this.snapShown = null;
      this.typing = null;
      this.pre.textContent = '';
      this.stampEl.className = 'stamp';
      this.pipEl.classList.remove('on');
    }
  }

  /** the code window is still typing (main loop keeps rendering while true) */
  busy() { return !!this.typing && this.typing.shown < this.typing.text.length; }

  /** The hero moment: the face function is proved. Its bytes are proved; "it's the face" stays a guess
   *  (violet ?) until the lab confirms the name in names.json. */
  private faceHero(ctx: Ctx) {
    const el = this.el.querySelector('[data-k="faceHero"]') as HTMLElement;
    const confirmed = ctx.side.confirmed.has(FACE_FN);
    const size = ctx.side.cells.find((c) => c.id === FACE_FN)?.size ?? 0;
    el.innerHTML = `<div class="fh1">DOOMGUY'S FACE${confirmed ? '' : '<em>?</em>'}</div>
      <div class="fh2">${size ? `${size.toLocaleString('en-US')} BYTES · ` : ''}BYTE-IDENTICAL</div>
      <div class="fh3">${confirmed ? 'The lab confirmed it is the face.' : 'The bytes are proved. That it is the face is our guess.'}</div>`;
    el.classList.remove('on');
    void el.offsetWidth;
    el.classList.add('on');
    ctx.fx.flash();
    announce('The face is back.');
    window.setTimeout(() => el.classList.remove('on'), 7000);
  }

  /** Muse writes it. Snap judges it. The compiler proves it. Each line from the newest real event. */
  private renderProof(ctx: Ctx) {
    const s = ctx.state;
    const a = s.lastAttempt;
    const muse: ChainLine = a
      ? { tag: 'MUSE', big: `${short(a.model ?? s.model)} WROTE IT`, small: `${a.fn} · try ${a.attempt} · ${a.actor}`, cls: 'muse' }
      : { tag: 'MUSE', big: 'WAITING', small: 'for a digger to write C', cls: 'muse' };
    // steering decisions stay up for a moment; the per-match fake gate replaces them after that
    const latest = s.snap[s.snap.length - 1] ?? null;
    const now = performance.now();
    if (latest && latest !== this.snapShown) {
      const holding = this.snapShown && this.snapShown.op !== 'review' && now - this.snapAt < HOLD_MS;
      if (!holding || latest.op !== 'review') { this.snapShown = latest; this.snapAt = now; }
    }
    const sn: ChainLine = this.snapShown ? snapLine(this.snapShown, s)
      : { tag: 'SNAP', big: s.snapOn ? 'WAITING' : 'OFF', small: s.snapOn ? 'for a decision' : 'not used in this run', cls: 'snap' };
    const v = s.lastVerdict;
    const proof: ChainLine = !v ? { tag: 'PROOF', big: 'WAITING', small: 'for the compiler', cls: 'proof' }
      : v.claim_was_true === false ? { tag: 'PROOF', big: 'LIE CAUGHT', small: `claimed a match, only ${v.match_pct.toFixed(1)}% of bytes agree`, cls: 'proof bad' }
      : v.status === 'MATCH' ? { tag: 'PROOF', big: 'BYTE-IDENTICAL', small: `the compiler rebuilt ${v.fn} exactly`, cls: 'proof' }
      : v.status === 'PARTIAL' ? { tag: 'PROOF', big: 'NOT A MATCH', small: `${v.match_pct.toFixed(1)}% of bytes agree · rejected`, cls: 'proof bad' }
      : { tag: 'PROOF', big: 'REJECTED', small: v.status === 'LINT_FAIL' ? 'broke the no-cheating rules' : `${STATUS_TEXT[v.status] ?? v.status}`, cls: 'proof bad' };
    const lines: [string, ChainLine][] = [['lMuse', muse], ['lSnap', sn], ['lProof', proof]];
    const key = lines.map(([, l]) => `${l.tag}/${l.big}/${l.small}`).join('|');
    if (key === this.proofKey) return;
    const old = this.proofKey.split('|');
    this.proofKey = key;
    lines.forEach(([k, l], i) => {
      const el = this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
      el.className = `pl ${l.cls}`;
      el.querySelector('b')!.textContent = l.tag;
      el.querySelector('.big')!.textContent = l.big;
      el.querySelector('.small')!.textContent = l.small;
      // a line that changed blinks once
      if (!ctx.reduced && old[i] !== `${l.tag}/${l.big}/${l.small}`) { el.classList.remove('tick'); void el.offsetWidth; el.classList.add('tick'); }
    });
  }

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
      // a short snippet: the newest four lines, each cut cleanly at the window edge
      const lines = t.text.slice(0, t.shown).split('\n').filter((l) => l.trim()).slice(-4);
      const caret = t.shown < t.text.length ? '<i class="caret"></i>' : '';
      this.pre.innerHTML = lines.map((l, i) => `<div>${esc(l)}${i === lines.length - 1 ? caret : ''}</div>`).join('');
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
    // hero number: the hot-swap share once a rebuilt ROM is running; before that, functions proved in the whole game
    const total = this.total;
    const key = s.pctAgentCode == null ? `p${s.matched.length}/${total}/${s.bench}` : s.pctAgentCode.toFixed(1);
    if (key === this.badgeKey) return;
    this.badgeKey = key;
    const l1 = this.el.querySelector('.badge .l1')!;
    const l2 = this.el.querySelector('[data-k="badge"]')!;
    this.badgeEl.classList.remove('orig');
    if (s.pctAgentCode == null) {
      l1.textContent = 'PROVED BYTE FOR BYTE';
      l2.innerHTML = `<b>${s.matched.length}</b><span>OF ${total || '--'} ${esc(this.game)} FUNCTIONS</span>`;
      return;
    }
    l1.textContent = 'NOW RUNNING ON';
    l2.innerHTML = `<b>${key}%</b><span>AGENT-WRITTEN CODE</span>`;
  }
}
