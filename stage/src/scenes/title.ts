// Scene 0: Title. Logo, save-file menu fed from the run, PRESS START.
import type { Ctx, Scene } from '../types.ts';
import { h } from '../types.ts';
import { pctRecovered } from '../state.ts';

function drawStars(cv: HTMLCanvasElement) {
  const g = cv.getContext('2d')!;
  cv.width = 1920;
  cv.height = 1080;
  let seed = 1847;
  const rnd = () => ((seed = (seed * 16807) % 2147483647) / 2147483647);
  for (let i = 0; i < 260; i++) {
    const x = Math.floor(rnd() * 480) * 4, y = Math.floor(rnd() * 240) * 4;
    const big = rnd() < 0.12;
    g.fillStyle = rnd() < 0.15 ? '#FFD23F' : rnd() < 0.3 ? '#9A9AFF' : '#F4F1FF';
    g.globalAlpha = 0.35 + rnd() * 0.65;
    g.fillRect(x, y, big ? 8 : 4, big ? 8 : 4);
  }
  // a pixel moon
  g.globalAlpha = 1;
  g.fillStyle = '#F4F1FF';
  const mx = 1580, my = 120, r = 13;
  for (let yy = -r; yy <= r; yy++) for (let xx = -r; xx <= r; xx++) {
    if (xx * xx + yy * yy <= r * r && (xx - 5) * (xx - 5) + (yy + 3) * (yy + 3) > (r - 2) * (r - 2)) g.fillRect(mx + xx * 4, my + yy * 4, 4, 4);
  }
}

export class TitleScene implements Scene {
  id = 'title' as const;
  el = h('section', 'scene title');

  constructor(reduced: boolean) {
    this.el.innerHTML = `
      <canvas class="stars"></canvas>
      <div class="hill"></div>
      <div class="logo">FRANKENSTEIN</div>
      <div class="tag">Lost games, rebuilt and proven</div>
      <div class="menu">
        <div class="f"><span class="cur">▶</span><span>FILE 1</span><span data-k="game">DOOM</span><span class="pct" data-k="pct">--%</span></div>
        <div class="sub" data-k="lies">0 LIES CAUGHT</div>
        <div class="f new"><span></span><span>FILE 2</span><span>NEW GAME</span><span></span></div>
      </div>
      <div class="press${reduced ? '' : ' blink'}">PRESS START</div>
`;
    drawStars(this.el.querySelector('canvas')!);
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    const pct = pctRecovered(s);
    const q = (k: string) => this.el.querySelector(`[data-k="${k}"]`)!;
    const p = pct == null ? '--%' : `${Math.floor(pct)}%`;
    if (q('pct').textContent !== p) q('pct').textContent = p;
    const g = (s.gameId ?? 'DOOM').toUpperCase();
    if (q('game').textContent !== g) q('game').textContent = g;
    const l = `${s.falseClaims.length} LIES CAUGHT`;
    if (q('lies').textContent !== l) q('lies').textContent = l;
  }
}
