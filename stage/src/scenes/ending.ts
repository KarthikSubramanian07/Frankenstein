// Scene 4: Ending. The title screen, cleared: true % recovered, both checksums, IDENTICAL only when the
// lab says so and the hashes agree, patch notes on patch.verified, the QR on phone.published.
// Space flips to the Built today / Not ours card, which the demo and the video end on.
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import type { Effect } from '../state.ts';

import { drawStars } from './title.ts';
import { setText, gameName, gamePct } from './common.ts';

export class EndingScene implements Scene {
  id = 'ending' as const;
  el = h('section', 'scene ending');
  private base: string;
  private page: 'main' | 'credits';
  private qrKey = '';

  constructor(base: string, _reduced: boolean) {
    this.base = base;
    this.page = new URLSearchParams(location.search).get('page') === 'credits' ? 'credits' : 'main';
    this.el.innerHTML = `
      <canvas class="stars"></canvas>
      <div class="main">
        <div class="col">
          <div class="end-logo" data-k="logo">FRANKENSTEIN</div>
          <div class="file"><span class="cur">▶</span><span>FILE 1</span><span data-k="game">DOOM</span><span class="pct" data-k="pct">--%</span></div>
          <div class="lies" data-k="lies"></div>
          <div class="sums">
            <div class="sl">ORIGINAL CHECKSUM</div><div class="sv" data-k="orig">--</div>
            <div class="sl">REBUILT CHECKSUM</div><div class="sv" data-k="rebuilt">WAITING FOR THE REBUILD</div>
          </div>
          <div class="verdict" data-k="verdict"></div>
          <div class="patch" data-k="patch"></div>
          <div class="key"><em>? = OUR GUESS.</em> EVERYTHING ELSE IS PROVED.</div>
        </div>
        <div class="qr" data-k="qr"></div>
      </div>
      <div class="credits">
        <h1>BUILT TODAY <span>/</span> NOT OURS</h1>
        <div class="cc">
          <div><h2>BUILT TODAY</h2><p class="when">Nov 7, 2026, after 10:45</p><ul>
            <li>The compiler referee and the fakematch linter</li>
            <li>The agent crew: diggers, checker, archivist, distiller</li>
            <li>These scenes and the event server</li>
            <li>The heal overlay, hot-swap and phone page</li>
            <li>The contracts, fixtures and the public site</li></ul></div>
          <div><h2 class="no">NOT OURS</h2><ul>
            <li>DOOM by id Software, prBoom, and GBADoom by doomhack (GPL-2.0+): the hidden answer key, never shown to the agents</li>
            <li>Muse Spark (Meta), SubQ (Subquadratic), Agentverse and ASI:One (Fetch.ai), MongoDB Atlas</li>
            <li>mGBA, devkitARM, and the fonts (Google Fonts, OFL)</li>
            <li>Prior work: the planning kit in docs/ and the event clock</li></ul></div>
        </div>
      </div>`;
    drawStars(this.el.querySelector('canvas')!, false);
    this.el.classList.toggle('show-credits', this.page === 'credits');
  }

  /** the credits card carries no data, so no sample mark; the main page follows the stream */
  sample() { return this.page === 'credits' ? false : null; }

  key(_ctx: Ctx, k: string) {
    if (k !== ' ') return false;
    this.page = this.page === 'main' ? 'credits' : 'main';
    this.el.classList.toggle('show-credits', this.page === 'credits');
    return true;
  }

  effect(ctx: Ctx, e: Effect) {
    if (e.kind === 'build' && ctx.state.build?.identical) ctx.fx.flash();
  }

  render(ctx: Ctx) {
    const s = ctx.state;
    setText(this.el, 'pct', `${gamePct(ctx)}%`);
    setText(this.el, 'game', gameName(s));
    setText(this.el, 'lies', `${s.matched.length} PROVED · ${s.falseClaims.length} LIES CAUGHT`);
    const orig = ctx.side.romSha1;
    const b = s.build;
    setText(this.el, 'orig', orig ?? 'NOT IN THE MANIFEST');
    setText(this.el, 'rebuilt', b?.rom_sha1 ?? 'NOT REBUILT YET');
    const identical = !!b && b.identical === true && (!orig || orig === b.rom_sha1);
    const differ = !!b && (b.identical === false || (!!orig && orig !== b.rom_sha1));
    const v = this.el.querySelector('[data-k="verdict"]') as HTMLElement;
    const vt = identical ? 'IDENTICAL' : differ ? 'DIFFERENT' : '';
    if (v.textContent !== vt) { v.textContent = vt; v.className = `verdict ${identical ? 'ok' : 'bad'}`; }
    setText(this.el, 'logo', identical ? "IT'S ALIVE" : 'FRANKENSTEIN');
    const pt = s.patch;
    const n = Array.isArray(pt?.changed_functions) ? pt.changed_functions.length : 0;
    setText(this.el, 'patch', pt ? `PATCH 1.01: ${n} FUNCTION${n === 1 ? '' : 'S'} CHANGED`
      : b ? '' : 'THE REBUILD RUNS WHEN THE CREW STOPS');
    this.renderQr(ctx);
  }

  private renderQr(ctx: Ctx) {
    const ph = ctx.state.phone;
    const key = ph ? `${ph.url}|${ph.qr_png}` : '';
    if (key === this.qrKey) return;
    this.qrKey = key;
    const el = this.el.querySelector('[data-k="qr"]') as HTMLElement;
    this.el.classList.toggle('has-qr', !!ph);
    if (!ph) { el.innerHTML = ''; return; }
    const src = ph.qr_png ? `${this.base}/file?path=${encodeURIComponent(ph.qr_png)}` : '';
    const url = String(ph.url ?? '').replace(/^https?:\/\//, '').replace(/\/$/, '');
    el.innerHTML = `<div class="p2">PLAYER 2</div><div class="ps">PRESS START</div>
      <div class="img">${src ? `<img alt="QR code for ${esc(url)}" src="${esc(src)}">` : ''}<span>QR IMAGE NOT FOUND</span></div>
      <div class="url">${esc(url)}</div>`;
    const img = el.querySelector('img');
    if (img) img.onload = () => el.classList.add('loaded');
  }
}
