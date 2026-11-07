// The judgment rail, DOM half: the sponsors at work, on Split and Hi-score.
// A pinned head (Muse's per-model counter, the ASI:One question) and up to three toasts that slide in,
// hold about 3 s and leave. Same-kind lines update their toast in place, so a burst of reviews stays calm.
// Lines come only from live effects (never from the backlog a reconnect replays), like every other animation.
import './judgment.css';
import type { Ctx } from './types.ts';
import { h, esc } from './types.ts';
import type { Effect } from './state.ts';
import type { Line, Op, Sponsor } from './judgment.ts';
import { LABEL, museCounts } from './judgment.ts';

const ROWS = 3; // plates on screen at once, pinned head included (both scenes have room for three rows)
const HOLD = 3000; // ms a toast stays
const MIN_SHOW = 1200; // ms before a newer line may push a toast out
const STALE = 4000; // ms a queued line may wait before it is old news
const OUT_MS = 260;
/** Split's own proof chain (scenes/split.ts) already shows these; the rail adds what it doesn't */
const ON_SPLIT_CHAIN: Set<Op> = new Set(['review', 'decide', 'triage']);

type Toast = { line: Line; el: HTMLElement; body: HTMLElement; shown: number; timer: number; leaving: boolean };

const chip = (s: Sponsor) => `<b>${LABEL[s]}</b>`;

export class Rail {
  el = h('div', 'jrail');
  private head = h('div', 'jhead');
  private stack = h('div', 'jstack');
  private muse = h('div', 'jt pin s-muse');
  private asi = h('div', 'jt pin s-asi');
  private toasts: Toast[] = [];
  private pending: { line: Line; at: number }[] = [];
  private museKey = '';
  private asiKey = '';
  private reduced: boolean;

  constructor(reduced: boolean) {
    this.reduced = reduced;
    this.el.setAttribute('aria-live', 'polite');
    this.head.append(this.asi, this.muse);
    this.el.append(this.head, this.stack);
  }

  /** pinned head, redrawn from state */
  render(ctx: Ctx) {
    const s = ctx.state;
    const counts = museCounts(s);
    const mk = counts.map((c) => `${c.model}:${c.n}`).join('|');
    if (mk !== this.museKey) {
      this.museKey = mk;
      this.muse.innerHTML = counts.length
        ? `${chip('muse')}<span>${counts.map((c) => `${esc(c.short)} <i data-m="${esc(c.model)}">${c.n}</i>`).join(' · ')} TRIES</span>`
        : '';
      this.muse.classList.toggle('on', counts.length > 0);
    }
    const a = s.judge.asi;
    const ak = a ? `${a.query}|${a.label}` : '';
    if (ak !== this.asiKey) {
      this.asiKey = ak;
      const q = a?.query ? (a.query.length > 26 ? `${a.query.slice(0, 25).trimEnd()}…` : a.query) : '';
      this.asi.innerHTML = a ? `${chip('asi')}<span>${q ? `ASKED: <i>“${esc(q.toUpperCase())}”</i>` : 'ASKED IN ASI:ONE'}</span>` : '';
      this.asi.classList.toggle('on', !!a);
    }
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'reset') return this.clear();
    if (e.kind === 'attempt' && e.a.model && /wonder/i.test(e.a.model)) {
      // Snap sent it up a model: Muse Wonder's counter flashes
      this.render(ctx);
      this.light(this.muse);
      const n = this.muse.querySelector(`[data-m="${CSS.escape(e.a.model)}"]`);
      if (n && !this.reduced) { n.classList.remove('bump'); void (n as HTMLElement).offsetWidth; n.classList.add('bump'); }
      return;
    }
    if (e.kind === 'judgment' && !(ctx.current() === 'split' && ON_SPLIT_CHAIN.has(e.line.op))) {
      const pinned = [this.muse, this.asi].filter((p) => p.classList.contains('on')).length;
      this.push(e.line, Math.max(1, ROWS - pinned));
    }
  }

  private push(line: Line, max: number) {
    const now = performance.now();
    const same = this.toasts.find((t) => !t.leaving && t.line.key === line.key);
    if (same) {
      same.line = line;
      same.body.innerHTML = line.text;
      same.shown = now;
      same.el.classList.remove('in'); // no second slide, just the lamp
      this.arm(same);
      this.light(same.el);
      return;
    }
    let live = this.toasts.filter((t) => !t.leaving);
    if (live.length > max) { live.slice(0, live.length - max).forEach((t) => this.drop(t)); live = live.slice(-max); } // from a roomier scene
    if (live.length < max) return this.show(line);
    const victim = live
      .filter((t) => t.line.prio <= line.prio && now - t.shown >= MIN_SHOW)
      .sort((a, b) => a.line.prio - b.line.prio || a.shown - b.shown)[0];
    if (victim) { this.drop(victim); this.show(line); return; }
    // no room yet: keep the best few, newest first within a priority
    this.pending = [...this.pending.filter((p) => p.line.key !== line.key), { line, at: now }]
      .sort((a, b) => b.line.prio - a.line.prio || b.line.id - a.line.id)
      .slice(0, max);
  }

  private show(line: Line) {
    const el = h('div', `jt s-${line.sponsor}`);
    el.innerHTML = `${chip(line.sponsor)}<span></span>`;
    const body = el.querySelector('span')!;
    body.innerHTML = line.text;
    const t: Toast = { line, el, body, shown: performance.now(), timer: 0, leaving: false };
    this.toasts.push(t);
    this.stack.prepend(el); // newest nearest the head
    if (!this.reduced) el.classList.add('in');
    this.light(el);
    this.arm(t);
  }

  private arm(t: Toast) {
    clearTimeout(t.timer);
    t.timer = window.setTimeout(() => this.drop(t), HOLD);
  }

  private drop(t: Toast) {
    if (t.leaving) return;
    t.leaving = true;
    clearTimeout(t.timer);
    const gone = () => {
      t.el.remove();
      this.toasts = this.toasts.filter((x) => x !== t);
    };
    if (this.reduced) gone();
    else { t.el.classList.add('out'); window.setTimeout(gone, OUT_MS); }
    // a freed slot takes the best queued line that is still news
    const now = performance.now();
    this.pending = this.pending.filter((p) => now - p.at < STALE);
    const next = this.pending.shift();
    if (next) this.show(next.line);
  }

  /** the sponsor's lamp: a short flash when it acts */
  private light(el: HTMLElement) {
    if (this.reduced) return;
    el.classList.remove('lit');
    void el.offsetWidth;
    el.classList.add('lit');
  }

  private clear() {
    for (const t of this.toasts) clearTimeout(t.timer);
    this.toasts = [];
    this.pending = [];
    this.stack.innerHTML = '';
    this.museKey = this.asiKey = '';
  }
}
