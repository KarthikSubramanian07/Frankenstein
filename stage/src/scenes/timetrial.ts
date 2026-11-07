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
type Outcomes = { MATCH?: number; PARTIAL?: number };
type ProbeBuild = { outcomes?: Outcomes; after_repair?: Outcomes & { mean_pct?: number } };
type Probe = { fn_count?: number; variant?: ProbeBuild; unmodified?: ProbeBuild };

const timed = (r: Run) => !r.bench && (r.matched ?? 0) > 0 && r.minutes_per_match != null;
const mins = (x: number) => `${x.toFixed(2)} min`;
const SPLITS: Record<string, string> = { heldout: 'held-out split', train: 'training split' };
const splitName = (s?: string) => (s ? SPLITS[s] ?? `${s} split` : '');

/** The memory-probe plate, built only from lab/out/memory_probe.json fields. null = hide the plate. */
export function probeLines(p: Probe | null): string[] | null {
  const b = p?.variant ?? p?.unmodified;
  const n = Number(p?.fn_count);
  if (!b?.outcomes || !(n > 0)) return null;
  const compiled = Number(b.outcomes.MATCH ?? 0) + Number(b.outcomes.PARTIAL ?? 0);
  const lines = [`From memory: <b>${compiled} of ${n}</b> compile.`];
  const r = b.after_repair;
  if (r && Number.isFinite(Number(r.MATCH)) && Number.isFinite(Number(r.mean_pct)))
    lines.push(`With the real headers: <b>${Number(r.MATCH)} of ${n}</b> exact, <b>${Math.round(Number(r.mean_pct))}%</b> average.`);
  return lines;
}

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
  private probe: Probe | null = null;
  private isSample = false;
  private loaded = false;
  private base: string;

  constructor(base: string) {
    this.base = base;
    this.el.innerHTML = `
      <div class="tt-head">Minutes per piece <span>· shorter is faster</span></div>
      <div class="tt-body" data-k="body"></div>
      <div class="tt-probe" data-k="probe" hidden></div>
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
    // the probe file that matches the shown run (a real run never gets the sample file); no run, no plate
    const on = pickPair(this.runs).on;
    this.probe = on ? await this.json(`/lab/memory_probe?run=${encodeURIComponent(on.dir)}`) : null;
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
    const sp = splitName(on?.split);

    if (a == null) {
      q('body').innerHTML = `<p class="tt-note">No Doom run has finished yet.</p>`;
    } else if (b == null) {
      // one real run: its number alone, no bar (a lone bar has no scale and reads as "slowest")
      q('body').innerHTML = `
        <div class="tt-solo">
          <div class="tt-solo-label">With memory</div>
          <div class="tt-hero">${mins(a)}</div>
          <div class="tt-solo-sub">${Number(on!.matched)} of ${on!.fn_total != null ? Number(on!.fn_total) : '?'} pieces proved</div>
        </div>
        <p class="tt-note">No memory-off run to compare yet.</p>`;
    } else {
      // both runs on one scale: the slower run fills the track, the faster is shorter
      const MAX = 780; // px for the slower bar (keep in sync with .tt-axis width)
      const top = Math.max(a, b);
      const close = Math.abs(a - b) < 0.1 * top;
      const row = (label: string, v: number, fast: boolean) => `
        <div class="tt-row"><div class="tt-label">${label}</div>
          <div class="tt-track"><div class="tt-bar ${fast ? 'fast' : 'bevel'}" style="--w:${Math.max(24, Math.round((v / top) * MAX))}px"></div>
          <div class="tt-val${fast ? ' fast' : ''}">${mins(v)}</div></div></div>`;
      const n = Math.round((Math.abs(a - b) / top) * 100);
      const say = close ? 'Same speed so far: within noise.' : `Memory makes it ${n}% ${a < b ? 'faster' : 'slower'}.`;
      q('body').innerHTML = `<div class="tt-rows">${row('With memory', a, !close && a < b)}${row('Without memory', b, !close && b < a)}</div>
        <div class="tt-axis"><span>&#9664; faster</span><span>slower &#9654;</span></div>
        <div class="tt-say">${say}</div>`;
    }

    const lines = probeLines(this.probe);
    const plate = q('probe');
    plate.hidden = !lines;
    plate.innerHTML = lines ? `<div class="tt-probe-tag">Memory probe</div>${lines.map((l) => `<p>${l}</p>`).join('')}` : '';

    const names = [on?.dir, pair ? off?.dir : undefined].filter(Boolean).map((d) => esc(d!));
    q('runs').innerHTML = names.length ? `${names.length > 1 ? 'runs' : 'run'} ${names.join(' vs ')}${sp ? `, ${esc(sp)}` : ''}` : '';
  }
}
