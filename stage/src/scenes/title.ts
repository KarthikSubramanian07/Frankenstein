// Scene 0: Title. Three things only: the name, the promise, PRESS START.
import './title.css';
import type { Ctx, Scene } from '../types.ts';
import { h } from '../types.ts';

export class TitleScene implements Scene {
  id = 'title' as const;
  el = h('section', 'scene title');

  constructor(reduced: boolean) {
    this.el.innerHTML = `
      <div class="ti-col">
        <h1 class="ti-logo">FRANKENSTEIN</h1>
        <p class="ti-tag">Lost games, rebuilt and proven.</p>
      </div>
      <div class="ti-press${reduced ? '' : ' blink'}">PRESS START</div>`;
  }

  render(_ctx: Ctx) { /* nothing on this screen follows the run */ }
}
