// Scene 0: Title. A game title screen: the logo, the promise, one save file, PRESS START.
// The save file reads the real run: proved share of the whole game, and lies caught only when there are some.
import './title.css';
import type { Ctx, Scene } from '../types.ts';
import { h } from '../types.ts';
import { gameName, gamePct, setText } from './common.ts';

export class TitleScene implements Scene {
  id = 'title' as const;
  el = h('section', 'scene title');
  private memo = '';

  constructor(reduced: boolean) {
    this.el.innerHTML = `
      <h1 class="ti-logo">FRANKENSTEIN</h1>
      <p class="ti-tag">Lost games, rebuilt and proven.</p>
      <div class="ti-file bevel" role="group" aria-label="Save file">
        <span class="ti-cur" aria-hidden="true">&#9654;</span>
        <span class="ti-row"><span>FILE 1</span><span data-k="game"></span><span class="ti-pct" data-k="pct"></span></span>
        <span class="ti-lies" data-k="lies"></span>
      </div>
      <div class="ti-press${reduced ? '' : ' blink'}">PRESS START</div>`;
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const empty = s.mode === 'none';
    const lies = s.falseClaims.length;
    const pct = gamePct(ctx);
    const key = [empty, gameName(s), pct, lies].join('|');
    if (key === this.memo) return;
    this.memo = key;
    setText(this.el, 'game', empty ? 'NEW GAME' : gameName(s));
    setText(this.el, 'pct', empty || pct === '--' ? '' : `${pct}%`);
    // only a real count: no line at all until the Checker has caught a lie
    setText(this.el, 'lies', lies ? `${lies} ${lies === 1 ? 'LIE' : 'LIES'} CAUGHT` : '');
    this.el.classList.toggle('has-lies', lies > 0);
  }
}
