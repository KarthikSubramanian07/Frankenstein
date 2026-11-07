// Scene 3: Faster. Does memory make it faster? Two bars, minutes per piece, one sentence.
// Every number is a field of a run's metrics.json (runs/ and crew/exports/). Nothing typed by hand.
// Real runs hide the samples; bench runs are never raced against Doom; a missing run is shown as missing.
import './timetrial.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';

type Run = {
  dir: string; split?: string; library?: string; bench?: boolean; fixture?: boolean;
  matched?: number; fn_total?: number; minutes_per_match?: number; snap?: { on?: boolean };
};
type Pick = { on?: Run; off?: Run; pair: boolean };

const timed = (r: Run) => !r.bench && (r.matched ?? 0) > 0 && r.minutes_per_match != null;
const mins = (x: number) => `${x.toFixed(2)} min`;
const splitName = (s?: string) => (s === 'heldout' ? 'held-out' : s ?? '');

/** Newest library on/off pair of Doom runs on the same split (held-out first, equal Snap preferred). */
export function pickPair(runs: Run[]): Pick {
  const doom = runs.filter(timed);
  const splits = [...new Set(doom.map((r) => r.split ?? ''))].sort((a, b) => (b === 'heldout' ? 1 : 0) - (a === 'heldout' ? 1 : 0));
  for (const s of splits) {
    const ons = doom.filter((r) => (r.split ?? '') === s && r.library === 'on').reverse();
    const offs = doom.filter((r) => (r.split ?? '') === s && r.library === 'off').reverse();
    if (!ons.length || !offs.length) continue;
    for (const on of ons) {
      const off = offs.find((o) => !!o.snap?.on === !!on.snap?.on);
      if (off) return { on, off, pair: true };
    }
    return { on: ons[0], off: offs[0], pair: true };
  }
  // no pair: the newest Doom run that used memory, and an honest empty slot for the run without it
  const on = [...doom].reverse().find((r) => r.library === 'on' || r.library === 'learning');
  const off = [...doom].reverse().find((r) => r.library === 'off');
  return { on, off, pair: false };
}

export class TimeTrialScene implements Scene {
  id = 'timetrial' as const;
  el = h('section', 'scene timetrial');
  private runs: Run[] = [];
  private isSample = false;
  private loaded = false;
  private base: string;

  constructor(base: string) {
    this.base = base;
    this.el.innerHTML = `
      <div class="tt-head">Minutes per piece <span>· shorter is faster</span></div>
      <div class="tt-rows" data-k="rows"></div>
      <div class="tt-say" data-k="say"></div>
      <div class="tt-runs" data-k="runs"></div>`;
    void this.load();
    setInterval(() => void this.load(), 10000);
  }

  sample() { return this.loaded ? this.isSample : null; }

  private async json(path: string) {
    try { const r = await fetch(`${this.base}${path}`, { cache: 'no-store' }); return r.ok ? await r.json() : null; } catch { return null; }
  }

  async load() {
    const m = await this.json('/metrics');
    if (!m) return; // server down: keep the last numbers
    const all: Run[] = Array.isArray(m.runs) ? m.runs : [];
    const real = all.filter((r) => !r.fixture);
    this.isSample = !real.length;
    this.runs = real.length ? real : all;
    this.loaded = true;
    this.draw();
  }

  enter() {
    this.el.classList.remove('grown');
    void this.el.offsetWidth;
    requestAnimationFrame(() => this.el.classList.add('grown'));
  }
  render() { /* data comes from files, drawn on load */ }

  private draw() {
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`) as HTMLElement;
    const { on, off, pair } = pickPair(this.runs);
    const a = on?.minutes_per_match, b = pair ? off?.minutes_per_match : undefined;
    const MAX = 1080; // px for the slower bar
    const top = Math.max(a ?? 0, b ?? 0) || 1;
    const close = a != null && b != null && Math.abs(a - b) < 0.1 * Math.max(a, b);
    const row = (label: string, v: number | undefined, fast: boolean) =>
      v == null
        ? `<div class="tt-row"><div class="tt-label">${label}</div>
             <div class="tt-track"><div class="tt-bar empty" style="--w:${MAX}px"><span>not measured yet</span></div></div></div>`
        : `<div class="tt-row"><div class="tt-label">${label}</div>
             <div class="tt-track"><div class="tt-bar ${fast ? 'fast' : 'bevel'}" style="--w:${Math.max(24, Math.round((v / top) * MAX))}px"></div>
             <div class="tt-val${fast ? ' fast' : ''}">${mins(v)}</div></div></div>`;

    const aFast = a != null && (b == null || (!close && a < b));
    const bFast = a != null && b != null && !close && b < a;
    q('rows').innerHTML = on
      ? row('With memory', a, aFast) + row('Without memory', b, bFast)
      : row('With memory', undefined, false) + row('Without memory', undefined, false);

    let say: string;
    if (!on) say = 'No Doom run has finished yet.';
    else if (b == null) say = 'No memory-off run to compare yet.';
    else if (close) say = 'Same speed so far: within noise.';
    else {
      const n = Math.round((Math.abs(a! - b) / Math.max(a!, b)) * 100);
      say = `Memory makes it ${n}% ${a! < b ? 'faster' : 'slower'}.`;
    }
    q('say').textContent = say;

    const names = [on?.dir, pair ? off?.dir : undefined].filter(Boolean).map((d) => esc(d!));
    const sp = splitName(on?.split);
    q('runs').innerHTML = names.length ? `${names.join(' vs ')}${sp ? ` · ${esc(sp)}` : ''}` : '';
  }
}
