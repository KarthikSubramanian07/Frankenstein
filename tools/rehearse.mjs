// Rehearse the 3-minute judging-room cut against the running Stage, with a stopwatch.
// Walks the beats of docs/DEMO_SCRIPT.md in order, presses the same scene keys the presenter presses,
// screenshots every beat at 1920x1080 and checks what the judge would see. Spends nothing: replay only.
//
//   node tools/rehearse.mjs [--run doom_r01] [--pace 1] [--out runs/_rehearsal/<stamp>] [--phone http://127.0.0.1:7401/]
//
// --pace 1 is real time (3:00). --pace 0.25 runs the same walk in 45 s. Needs `make up` (stage-page and
// stage-server healthy) and Chrome. Uses Lane C's own playwright-core from stage/node_modules.
import fs from 'node:fs';
import path from 'node:path';
import { createRequire } from 'node:module';
import { fileURLToPath } from 'node:url';

const REPO = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const require = createRequire(path.join(REPO, 'stage', 'package.json'));
const { chromium } = require('playwright-core');

const arg = (k, d) => { const i = process.argv.indexOf('--' + k); return i > 0 ? process.argv[i + 1] : d; };
const RUN = arg('run', 'doom_r01');
const PACE = Number(arg('pace', '1'));
const STAGE = arg('stage', 'http://127.0.0.1:5173');
const PHONE = arg('phone', 'http://127.0.0.1:7401/');
const stamp = new Date().toISOString().slice(11, 19).replace(/:/g, '');
const OUT = path.resolve(REPO, arg('out', `runs/_rehearsal/${stamp}`));
const CHROME = process.env.CHROME_PATH || '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';

// The beats of docs/DEMO_SCRIPT.md (judging-room cut). at = script second; key = what the presenter presses;
// expect = text the judge must be able to read on screen for the beat to land (case-insensitive).
const BEATS = [
  { at: 0, id: 'B1-doom', where: 'phone', expect: [], note: 'Doom running with the static face, full screen' },
  { at: 12, id: 'B2-split', key: '1', expect: ['PROVED BYTE FOR BYTE'], note: 'the rule; judge presses Enter on make demo-live' },
  { at: 30, id: 'B3-dig', expect: ['MUSE', 'SNAP'], note: 'Muse writes, referee checks, two labs screen' },
  { at: 62, id: 'B3-match', expect: ['MATCH'], note: 'the live matches land (live: about 38 s after Enter)' },
  { at: 70, id: 'B4-versus', key: '2', expect: ['REFEREE'], note: 'trust but verify' },
  { at: 92, id: 'B5-hiscore', key: '5', expect: ['RECOVERED'], note: '28 of 30 real Doom functions' },
  { at: 104, id: 'B5-timetrial', key: '3', expect: ['HELD-OUT'], note: 'held-out, library on vs off' },
  { at: 120, id: 'B6-ending', key: '4', expect: ['CHECKSUM'], note: 'rebuild proof: IDENTICAL only when proved' },
  { at: 140, id: 'B7-finale', expect: [], note: 'patch, Snap eyes, QR; judge plays' },
  { at: 165, id: 'B8-credits', key: ' ', expect: ['BUILT TODAY', 'NOT OURS'], note: 'built today / not ours, stop' },
  { at: 180, id: 'END', expect: [], note: 'questions' },
];

fs.mkdirSync(OUT, { recursive: true });
const browser = await chromium.launch({ executablePath: CHROME, headless: true });
const ctx = await browser.newContext({ viewport: { width: 1920, height: 1080 } });
const page = await ctx.newPage();
const issues = [];
let loads = 0;
page.on('load', () => { loads += 1; });
page.on('pageerror', (e) => issues.push(`page error: ${String(e).slice(0, 120)}`));
page.on('response', (r) => { if (r.status() >= 400 && !r.url().includes('favicon')) issues.push(`${r.status()} ${r.url().replace(STAGE, '')}`); });

const t0 = Date.now();
const wall = () => (Date.now() - t0) / 1000;
const rows = [];
let phonePage = null;

// Replay speed so the run reaches its end by the Ending beat: a 268 s run at 4x is 67 s of replay.
await page.goto(`${STAGE}/?scene=title&replay=${RUN}&speed=4`);
await page.evaluate(() => document.fonts.ready);
const firstLoads = loads;

for (const b of BEATS) {
  const due = b.at * PACE;
  if (wall() < due) await page.waitForTimeout((due - wall()) * 1000);
  if (b.id === 'END') { rows.push({ ...b, t: wall(), ok: true, seen: '' }); break; }
  let target = page;
  if (b.where === 'phone') {
    phonePage = await ctx.newPage();
    const s = Date.now();
    try {
      await phonePage.goto(PHONE, { timeout: 8000 });
      await phonePage.waitForTimeout(800);
      const st = await phonePage.evaluate(() => ({ state: document.documentElement.dataset.state, coi: self.crossOriginIsolated,
        line: document.querySelector('#gate-line')?.textContent || '' }));
      b.seen = `phone ${st.state} coi=${st.coi} in ${Date.now() - s} ms: ${st.line.slice(0, 60)}`;
      if (st.state === 'error' || st.state === 'norom' || /no assembled rom|could not|isn't published/i.test(st.line)) issues.push(`B1: phone page has no playable ROM (${st.line.slice(0, 80)})`);
    } catch (e) { b.seen = 'phone page unreachable'; issues.push('B1: phone page unreachable: ' + PHONE); }
    target = phonePage;
  } else {
    if (phonePage) { await phonePage.close(); phonePage = null; }
    if (b.key) { await page.bringToFront(); await page.keyboard.press(b.key === ' ' ? 'Space' : b.key); await page.waitForTimeout(700); }
    const text = (await page.evaluate(() => document.body.innerText || '')).toUpperCase();
    const missing = b.expect.filter((w) => !text.includes(w));
    b.seen = missing.length ? `MISSING ${missing.join(', ')}` : 'ok';
    if (missing.length) issues.push(`${b.id}: not on screen: ${missing.join(', ')}`);
    if (/NO SIGNAL/.test(text)) issues.push(`${b.id}: NO SIGNAL (stage-server socket dropped)`);
    if (b.id === 'B6-ending' && /NOT REBUILT YET/.test(text)) issues.push('B6: Ending says NOT REBUILT YET (no build.rom in this run)');
    if (b.id === 'B4-versus' && /CLAIM UPHELD/.test(text) && !/K\.?O/.test(text)) issues.push('B4: Versus shows a TRUE claim; no lie caught in this run');
  }
  const file = path.join(OUT, `${String(Math.round(b.at)).padStart(3, '0')}-${b.id}.png`);
  await target.screenshot({ path: file });
  rows.push({ ...b, t: wall(), file: path.relative(REPO, file) });
}
if (loads > firstLoads) issues.push(`the Stage reloaded ${loads - firstLoads} time(s) mid-demo (Vite hot reload: a teammate saved a file). Serve the built Stage for the real demo.`);
await browser.close();

const fmt = (s) => `${Math.floor(s / 60)}:${String(Math.floor(s % 60)).padStart(2, '0')}`;
const lines = [`REHEARSAL ${stamp} · run ${RUN} · pace ${PACE} · ${OUT.replace(REPO + '/', '')}`, ''];
lines.push('  SCRIPT  WALL    BEAT            KEY  ON SCREEN');
for (const r of rows) lines.push(`  ${fmt(r.at).padEnd(6)}  ${r.t.toFixed(1).padStart(5)}s  ${r.id.padEnd(14)}  ${(r.key === ' ' ? 'spc' : r.key || '').padEnd(3)}  ${r.seen || ''}  · ${r.note}`);
const uniq = [...new Set(issues)];
lines.push('', uniq.length ? `ISSUES (${uniq.length})` : 'NO ISSUES');
for (const i of uniq) lines.push('  ! ' + i);
const report = lines.join('\n');
fs.writeFileSync(path.join(OUT, 'REHEARSAL.txt'), report + '\n');
console.log(report);
process.exit(0);
