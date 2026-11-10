// Scene 1: Rebuild (id "split"). One idea: the game on the left, how much of it is rebuilt on the right.
// Left is the game window (Lane D composes the mGBA capture at x20 y92 960x640, or ?game=<url> embeds it).
// With no capture there, the cartridge mosaic (one cell per real game function) fills it instead.
// Right is one giant count, a segmented cartridge meter, and the newest proved piece sliding in.
import './split.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import type { Effect } from '../state.ts';
import { displayName } from '../data.ts';
import { coin } from '../audio.ts';
import { gameTotal } from './common.ts';
import { FACE_FN, Mosaic } from './mosaic.ts';

const NAME_MAX = 80; // px, the newest piece's name; long names shrink to fit
const NAME_MIN = 40;
const MAX_BLOCKS = 72; // meter blocks; each block stands for a whole number of functions
const FLASH_MS = 650; // how long split.busy() keeps the mosaic redrawing after a cell lands
const NONE = '\u0000'; // newestKey before anything renders, so the empty state draws once

export class SplitScene implements Scene {
  id = 'split' as const;
  el = h('section', 'scene split');
  private win: HTMLElement;
  private cap: HTMLElement;
  private runOn: HTMLElement;
  private num: HTMLElement;
  private den: HTMLElement;
  private lbl: HTMLElement;
  private meter: HTMLElement;
  private meterCap: HTMLElement;
  private meterKey = '';
  private newest: HTMLElement;
  private newestKey = NONE;
  private mosaic: Mosaic | null = null;
  private mosaicKey = '';
  private flashUntil = 0;
  private memo = '';

  constructor() {
    const game = new URLSearchParams(location.search).get('game');
    this.el.innerHTML = `
      <div class="sp-win${game ? ' has-game' : ''}">
        ${game ? `<iframe src="${esc(game)}" title="Doom game preview" allow="cross-origin-isolated; autoplay; gamepad; fullscreen"></iframe>` : ''}
        <div class="sp-cap"></div>
      </div>
      <div class="sp-runon"></div>
      <div class="sp-right">
        <div class="sp-count"><span class="sp-num">0</span><span class="sp-den"></span></div>
        <div class="sp-lbl">functions rebuilt</div>
        <div class="sp-meter" role="img"></div>
        <div class="sp-mcap"></div>
        <div class="sp-new"></div>
        <div class="sp-line"><b>Muse</b> writes · <b>Snap</b> checks · <b>Compiler</b> proves</div>
      </div>`;
    const q = (s: string) => this.el.querySelector(s) as HTMLElement;
    this.win = q('.sp-win');
    this.cap = q('.sp-cap');
    this.runOn = q('.sp-runon');
    this.num = q('.sp-num');
    this.den = q('.sp-den');
    this.lbl = q('.sp-lbl');
    this.meter = q('.sp-meter');
    this.meterCap = q('.sp-mcap');
    this.newest = q('.sp-new');
    // no ?game: the cartridge mosaic fills the window; under OBS it hides so the capture shows through
    if (!game) {
      this.mosaic = new Mosaic(20, 92);
      this.win.prepend(this.mosaic.cv);
      // band labels use the pixel face; redraw once it has loaded
      void document.fonts?.ready.then(() => { this.mosaicKey = ''; this.flashUntil = performance.now() + 50; });
    }
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const n = s.matched.length;
    const total = gameTotal(ctx);
    const last = s.matched[n - 1] ?? null;
    this.drawMosaic(ctx);
    const key = [n, total, s.bench, ctx.obs, s.pctAgentCode, last?.fn, last ? ctx.side.names.get(last.fn) ?? '' : '', ctx.side.confirmed.has(FACE_FN)].join('|');
    if (key === this.memo) return;
    this.memo = key;

    // left: the game window (transparent under OBS; a quiet caption when nothing is composed there)
    this.win.classList.toggle('obs', ctx.obs);
    const showMosaic = !!this.mosaic && !ctx.obs && ctx.side.subsystems.length > 0;
    this.win.classList.toggle('has-mosaic', showMosaic);
    // the caption only shows when nothing fills the window (viz map missing and no capture)
    const cap = ctx.obs || showMosaic || this.win.classList.contains('has-game') ? '' : s.bench ? 'Bench run · not Doom' : 'Game window';
    if (this.cap.textContent !== cap) this.cap.textContent = cap;
    const run = s.pctAgentCode == null ? '' : `Running on ${s.pctAgentCode.toFixed(1)}% agent-written code`;
    if (this.runOn.textContent !== run) this.runOn.textContent = run;

    // right: the one number (functions, never the byte %), the cartridge meter
    this.num.textContent = String(n);
    this.den.textContent = total ? `/ ${total}` : '';
    this.lbl.textContent = s.bench ? 'bench functions rebuilt' : 'functions rebuilt';
    this.renderMeter(n, total);

    this.renderNewest(ctx, last?.fn ?? null);
  }

  /** One block per `per` functions. A block lights only when all of its functions are proved; the block
   *  being filled shows half-lit, so even 1 proved function is visible and nothing is rounded up. */
  private renderMeter(n: number, total: number) {
    const per = total ? Math.max(1, Math.ceil(total / MAX_BLOCKS)) : 0;
    const blocks = per ? Math.ceil(total / per) : 0;
    const full = per ? Math.floor(Math.min(n, total) / per) : 0;
    const part = per && n < total && n % per ? 1 : 0;
    const key = `${blocks}|${full}|${part}`;
    if (key === this.meterKey) return;
    const grew = this.meterKey !== '' && this.meterKey.split('|')[0] === String(blocks);
    this.meterKey = key;
    let html = '';
    for (let i = 0; i < blocks; i++) {
      const cls = i < full ? ' on' : i === full && part ? ' part' : '';
      html += `<i class="b${cls}${grew && cls ? ' lit' : ''}"></i>`;
    }
    this.meter.innerHTML = html;
    this.meter.style.setProperty('--blocks', String(blocks || 1));
    this.meter.setAttribute('aria-label', total ? `${n} of ${total} functions rebuilt` : `${n} functions rebuilt`);
    this.meterCap.textContent = per ? `1 block = ${per} function${per === 1 ? '' : 's'}` : '';
  }

  /** Redraw the mosaic when proved cells or names change, and every frame while a cell's flash fades. */
  private drawMosaic(ctx: Ctx) {
    if (!this.mosaic || ctx.obs || !ctx.side.subsystems.length) return;
    const t = performance.now();
    const k = `${ctx.state.matched.length}|${ctx.side.subsystems.length}|${ctx.side.confirmed.has(FACE_FN)}`;
    if (k === this.mosaicKey && t > this.flashUntil) return;
    this.mosaicKey = k;
    this.mosaic.draw(ctx, t);
  }

  /** The newest proved piece slides in once. Guessed names are violet with "?"; otherwise the fn id. */
  private renderNewest(ctx: Ctx, fn: string | null) {
    const confirmed = ctx.side.confirmed.has(FACE_FN);
    const nk = fn ? `${fn}|${ctx.side.names.get(fn) ?? ''}|${fn === FACE_FN && confirmed}` : '';
    if (nk === this.newestKey) return;
    const sameFn = this.newestKey.split('|')[0] === (fn ?? '');
    this.newestKey = nk;
    const el = this.newest;
    if (!fn) {
      el.className = 'sp-new empty';
      el.innerHTML = '<span class="sp-wait">Waiting for the first piece</span>';
      return;
    }
    const d = displayName(ctx.side, fn);
    const name = `<span class="sp-nm${d.guess ? ' guess' : ''}">${esc(d.text)}</span>`;
    el.innerHTML = `<span class="sp-tag">PROVED</span>${name}`;
    el.className = 'sp-new';
    if (!ctx.reduced && !sameFn) { void el.offsetWidth; el.classList.add('slide'); }
    this.fit(el.querySelector('.sp-nm') as HTMLElement);
  }

  /** shrink a long name until it fits on one line (never below NAME_MIN) */
  private fit(nm: HTMLElement) {
    const max = NAME_MAX;
    let px = max;
    nm.style.fontSize = `${px}px`;
    while (nm.scrollWidth > nm.clientWidth + 1 && px > NAME_MIN) { px -= 4; nm.style.fontSize = `${px}px`; }
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'matched') {
      coin();
      if (this.mosaic && !ctx.reduced) { this.mosaic.land(e.m.fn); this.flashUntil = performance.now() + FLASH_MS; }
    } else if (e.kind === 'reset') {
      this.memo = '';
      this.meterKey = '';
      this.mosaicKey = '';
      this.newestKey = NONE;
      this.newest.className = 'sp-new';
      this.newest.innerHTML = '';
    }
  }

  /** true while a newly proved mosaic cell is flashing */
  busy() { return performance.now() < this.flashUntil; }
}
