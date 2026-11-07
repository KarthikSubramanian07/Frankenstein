// The main screen: the game on the left, a plain-English log on the right. Nothing else.
// Every line comes from state (so a reconnect or a replay rebuilds it exactly): fn.matched -> proved,
// a verdict with claim_was_true === false -> rejected (a lie), fakematch.rejected / verdict.fake_rejected
// -> rejected (a fake). Names are guesses from names.json and carry a "?".
import './log.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import { gameTotal } from './common.ts';

const LINES = 14;

type Entry = { ts: number; ok: boolean; fn: string; why: string };

/** "draw_column" -> "Draw column?"; no name yet -> the function id (proved, no "?") */
function nameOf(ctx: Ctx, fn: string): { text: string; guess: boolean } {
  const n = ctx.side.names.get(fn);
  if (!n) return { text: fn, guess: false };
  const t = n.replace(/_/g, ' ').trim();
  return { text: t.charAt(0).toUpperCase() + t.slice(1), guess: !ctx.side.confirmed.has(fn) };
}

const cut = (s: string, n: number) => (s.length > n ? `${s.slice(0, n - 1).trimEnd()}…` : s);

export class LogScene implements Scene {
  id = 'log' as const;
  el = h('section', 'scene logscene');
  private memo = '';

  constructor() {
    const game = new URLSearchParams(location.search).get('game');
    this.el.innerHTML = `
      <div class="lg-game">${game ? `<iframe src="${esc(game)}" allow="cross-origin-isolated; autoplay; gamepad; fullscreen"></iframe>` : '<span>Doom plays here</span>'}</div>
      <div class="lg-side">
        <div class="lg-panel">
          <div class="lg-head">
            <span class="cnt"><b data-k="n">0</b> <span data-k="of">/ 568</span> pieces rebuilt</span>
            <span class="tot"><em class="p" data-k="p">+0</em><em class="r" data-k="r">−0</em></span>
          </div>
          <ol class="lg-log" data-k="log"></ol>
        </div>
      </div>`;
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const total = gameTotal(ctx);
    const entries: Entry[] = [
      ...s.matched.map((m) => ({ ts: m.ts, ok: true, fn: m.fn, why: '' })),
      ...s.falseClaims.map((c) => ({
        ts: c.ts, ok: false, fn: c.fn,
        why: c.first_diff ? `claimed right, ${c.match_pct.toFixed(0)}% of bytes match` : `claimed right, ${c.status.toLowerCase().replace('_', ' ')}`,
      })),
      ...s.fakes.map((f) => ({ ts: f.ts, ok: false, fn: f.fn, why: `bytes match, but ${cut(f.reason || 'it was faked', 44)}` })),
    ].sort((a, b) => b.ts - a.ts).slice(0, LINES);

    const key = `${s.matched.length}/${total}|${entries.map((e) => `${e.ts}${e.fn}${e.ok}`).join(',')}|${ctx.side.names.size}`;
    if (key === this.memo) return;
    this.memo = key;
    (this.el.querySelector('[data-k="n"]') as HTMLElement).textContent = String(s.matched.length);
    (this.el.querySelector('[data-k="of"]') as HTMLElement).textContent = `/ ${total || '--'}`;
    // diff-style totals: proved in green, rejected (real lies + fake rejections) in red
    (this.el.querySelector('[data-k="p"]') as HTMLElement).textContent = `+${s.matched.length} proved`;
    (this.el.querySelector('[data-k="r"]') as HTMLElement).textContent = `−${s.falseClaims.length + s.fakes.length} rejected`;
    const log = this.el.querySelector('[data-k="log"]') as HTMLElement;
    log.innerHTML = entries.length
      ? entries.map((e) => {
          const n = nameOf(ctx, e.fn);
          const name = `<span class="nm${n.guess ? ' guess' : ''}">${esc(n.text)}${n.guess ? '<em>?</em>' : ''}</span>`;
          return e.ok
            ? `<li class="ok"><i>✓</i>${name}<span class="st">proved</span></li>`
            : `<li class="no"><i>✗</i>${name}<span class="st">rejected</span><span class="why">${esc(e.why)}</span></li>`;
        }).join('')
      : '<li class="wait">Waiting for the first piece…</li>';
  }
}
