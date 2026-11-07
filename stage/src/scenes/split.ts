// Scene 1: Rebuild (id "split"). One idea: the game on the left, how much of it is rebuilt on the right.
// Left is the game window (Lane D composes the mGBA capture at x20 y92 960x640, or ?game=<url> embeds it).
// Right is one giant count, one bar, and the newest proved piece sliding in.
import './split.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import type { Effect } from '../state.ts';
import { displayName } from '../data.ts';
import { coin } from '../audio.ts';
import { announce } from '../voice.ts';
import { gameTotal } from './common.ts';
import { FACE_FN } from './mosaic.ts';

const NAME_MAX = 88; // px, the newest piece's name; long names shrink to fit
const NAME_MIN = 40;

export class SplitScene implements Scene {
  id = 'split' as const;
  el = h('section', 'scene split');
  private win: HTMLElement;
  private cap: HTMLElement;
  private runOn: HTMLElement;
  private num: HTMLElement;
  private den: HTMLElement;
  private lbl: HTMLElement;
  private fill: HTMLElement;
  private newest: HTMLElement;
  private newestKey = '';
  private memo = '';

  constructor() {
    const game = new URLSearchParams(location.search).get('game');
    this.el.innerHTML = `
      <div class="sp-win${game ? ' has-game' : ''}">
        ${game ? `<iframe src="${esc(game)}" allow="cross-origin-isolated; autoplay; gamepad; fullscreen"></iframe>` : ''}
        <div class="sp-cap"></div>
      </div>
      <div class="sp-runon"></div>
      <div class="sp-right">
        <div class="sp-count"><span class="sp-num">0</span><span class="sp-den"></span></div>
        <div class="sp-lbl">pieces rebuilt</div>
        <div class="sp-bar bevel"><i></i></div>
        <div class="sp-new"></div>
      </div>
      <div class="sp-line">Muse writes · Snap checks · Compiler proves</div>`;
    const q = (s: string) => this.el.querySelector(s) as HTMLElement;
    this.win = q('.sp-win');
    this.cap = q('.sp-cap');
    this.runOn = q('.sp-runon');
    this.num = q('.sp-num');
    this.den = q('.sp-den');
    this.lbl = q('.sp-lbl');
    this.fill = q('.sp-bar i');
    this.newest = q('.sp-new');
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const n = s.matched.length;
    const total = gameTotal(ctx);
    const last = s.matched[n - 1] ?? null;
    const key = [n, total, s.bench, ctx.obs, s.pctAgentCode, last?.fn, last ? ctx.side.names.get(last.fn) ?? '' : '', ctx.side.confirmed.has(FACE_FN)].join('|');
    if (key === this.memo) return;
    this.memo = key;

    // left: the game window (transparent under OBS; a quiet caption when nothing is composed there)
    this.win.classList.toggle('obs', ctx.obs);
    const cap = ctx.obs || this.win.classList.contains('has-game') ? '' : s.bench ? 'Bench run · not Doom' : 'Game window';
    if (this.cap.textContent !== cap) this.cap.textContent = cap;
    const run = s.pctAgentCode == null ? '' : `Running on ${s.pctAgentCode.toFixed(1)}% agent-written code`;
    if (this.runOn.textContent !== run) this.runOn.textContent = run;

    // right: the one number, the one bar
    this.num.textContent = String(n);
    this.den.textContent = total ? `/ ${total}` : '';
    this.lbl.textContent = s.bench ? 'bench pieces rebuilt' : 'pieces rebuilt';
    const pct = total ? Math.min(100, (100 * n) / total) : 0;
    // a sliver stays visible once anything is proved, so 1 of 568 still reads as "started"
    this.fill.style.width = n ? `max(14px, ${pct}%)` : '0';

    this.renderNewest(ctx, last?.fn ?? null);
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
    let name: string;
    if (fn === FACE_FN) {
      name = `<span class="sp-nm face">DOOMGUY'S FACE${confirmed ? '' : '<em>?</em>'}</span>`;
    } else {
      const d = displayName(ctx.side, fn);
      name = `<span class="sp-nm${d.guess ? ' guess' : ''}">${esc(d.text)}</span>`;
    }
    el.innerHTML = `<span class="sp-tag">PROVED</span>${name}`;
    el.className = `sp-new${fn === FACE_FN ? ' is-face' : ''}`;
    if (!ctx.reduced && !sameFn) { void el.offsetWidth; el.classList.add('slide'); }
    this.fit(el.querySelector('.sp-nm') as HTMLElement);
  }

  /** shrink a long name until it fits on one line (never below NAME_MIN) */
  private fit(nm: HTMLElement) {
    const max = nm.classList.contains('face') ? 112 : NAME_MAX;
    let px = max;
    nm.style.fontSize = `${px}px`;
    while (nm.scrollWidth > nm.clientWidth + 1 && px > NAME_MIN) { px -= 4; nm.style.fontSize = `${px}px`; }
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'matched') {
      coin();
      if (e.m.fn === FACE_FN) {
        announce('The face is back.');
        ctx.fx.flash();
      }
    } else if (e.kind === 'reset') {
      this.memo = '';
      this.newestKey = '';
      this.newest.className = 'sp-new';
      this.newest.innerHTML = '';
    }
  }

  /** nothing animates on its own; kept for main.ts */
  busy() { return false; }
}
