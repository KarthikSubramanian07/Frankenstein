// The main screen: the game on the left, the counter and a raw machine log on the right.
// Every line is a real event (rawlog.ts), kept in state, so a reconnect or a replay rebuilds it exactly.
// PROVED and REJECTED lines are bright; everything else is dim.
import './log.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import { gameTotal } from './common.ts';

const RAW = 60; // lines rendered; the column shows the newest that fit

export class LogScene implements Scene {
  id = 'log' as const;
  el = h('section', 'scene logscene');
  private memo = '';

  constructor() {
    const game = new URLSearchParams(location.search).get('game');
    this.el.innerHTML = `
      <div class="lg-game"><b class="ttl">doom</b>${game ? `<iframe src="${esc(game)}" allow="cross-origin-isolated; autoplay; gamepad; fullscreen"></iframe>` : '<span>game capture</span>'}</div>
      <div class="lg-side">
        <div class="lg-panel">
          <ol class="lg-raw" data-k="log"></ol>
        </div>
      </div>`;
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const total = gameTotal(ctx);
    const tail = s.raw.slice(-RAW);
    const last = tail[tail.length - 1];
    const key = `${s.matched.length}/${total}|${s.raw.length}|${last?.ts}|${last?.text}`;
    if (key === this.memo) return;
    this.memo = key;
    // the machine log: newest at the bottom, the column clips the oldest at the top like a terminal
    const log = this.el.querySelector('[data-k="log"]') as HTMLElement;
    log.innerHTML = tail.length
      ? tail.map((l) => `<li class="${l.kind}"><span class="t">${l.time}</span><span class="w">${esc(l.who)}</span><span class="f">${esc(l.fn)}</span><span class="x">${esc(l.text)}</span></li>`).join('')
      : '<li class="dim"><span class="x">waiting for events…</span></li>';
  }
}
