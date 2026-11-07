// Scene 4: Alive (id "ending"). One idea: the rebuilt game is byte-for-byte the original.
// IDENTICAL only when the lab's build.rom says so and the hashes agree; DIFFERENT in red otherwise;
// before any build, an honest NOT REBUILT YET with the proved count. The QR shows on phone.published.
// Space flips to the Built today / Not ours card, which the demo and the video end on.
import './ending.css';
import type { Ctx, Scene } from '../types.ts';
import { h, esc } from '../types.ts';
import type { Effect } from '../state.ts';
import { setText, gameTotal } from './common.ts';

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
      <div class="en-main">
        <div class="en-col">
          <div class="en-verdict" data-k="verdict">NOT REBUILT YET</div>
          <div class="en-sums">
            <div class="en-sum"><span class="l">original</span><span class="v" data-k="orig">--</span></div>
            <div class="en-sum rb"><span class="l">rebuilt</span><span class="v" data-k="rebuilt">--</span></div>
          </div>
          <div class="en-foot" data-k="foot"></div>
        </div>
        <div class="en-qr" data-k="qr"></div>
      </div>
      <div class="en-credits">
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
    this.el.classList.toggle('show-credits', this.page === 'credits');
  }

  /** the credits card carries no data, so no sample mark; the main page follows the stream */
  sample() { return this.page === 'credits' ? false : null; }

  setPage(p: 'main' | 'credits') {
    this.page = p;
    this.el.classList.toggle('show-credits', p === 'credits');
  }

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
    const orig: string | null = ctx.side.romSha1;
    const b = s.build;
    const identical = !!b && b.identical === true && (!orig || orig === b.rom_sha1);
    const differ = !!b && (b.identical === false || (!!orig && orig !== b.rom_sha1));
    const state = identical ? 'ok' : differ ? 'bad' : 'none';
    if (this.el.dataset.state !== state) this.el.dataset.state = state;

    setText(this.el, 'verdict', identical ? 'IDENTICAL' : differ ? 'DIFFERENT' : 'NOT REBUILT YET');
    setText(this.el, 'orig', orig ?? 'not in the manifest');
    setText(this.el, 'rebuilt', b ? String(b.rom_sha1 ?? 'no checksum reported') : '');

    const total = gameTotal(ctx);
    const proved = `<b>${s.matched.length}</b> of ${total || '?'} pieces proved`;
    const foot = identical ? "IT'S ALIVE" : proved;
    const f = this.el.querySelector('[data-k="foot"]') as HTMLElement;
    if (f.innerHTML !== foot) f.innerHTML = foot;
    this.renderQr(ctx);
  }

  private renderQr(ctx: Ctx) {
    const ph = ctx.state.phone;
    const key = ph ? `${ph.url}|${ph.qr_png}` : '';
    if (key === this.qrKey) return;
    this.qrKey = key;
    const el = this.el.querySelector('[data-k="qr"]') as HTMLElement;
    this.el.classList.toggle('has-qr', !!ph);
    el.classList.remove('loaded');
    if (!ph) { el.innerHTML = ''; return; }
    const src = ph.qr_png ? `${this.base}/file?path=${encodeURIComponent(ph.qr_png)}` : '';
    const url = String(ph.url ?? '').replace(/^https?:\/\//, '').replace(/\/$/, '');
    el.innerHTML = `<div class="p2">Player 2, press start</div>
      <div class="img">${src ? `<img alt="QR code for ${esc(url)}" src="${esc(src)}">` : ''}<span>QR image not found</span></div>
      <div class="url">${esc(url)}</div>`;
    const img = el.querySelector('img');
    if (img) img.onload = () => el.classList.add('loaded');
  }
}
