// Browser QA for every scene: text under 28 px (at 1080p), clipped text, text off the stage,
// text under the corner mark. Needs `npm run dev` and `npm run server`. Exit 1 on any problem.
import { chromium } from 'playwright-core';

const BASE = process.env.STAGE_URL || 'http://127.0.0.1:5173';
const CHROME = process.env.CHROME_PATH || '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
export const SCENES = [
  ['title', '?scene=title&replay=fx01&speed=20&t=300'],
  ['split', '?scene=split&replay=fx01&speed=4&t=200'],
  ['split-end', '?scene=split'],
  ['hiscore', '?scene=hiscore&replay=fx01&speed=4&t=200'],
  ['versus', '?scene=versus&replay=fx01&speed=1&t=300'],
  ['timetrial', '?scene=timetrial'],
  ['ending', '?scene=ending'],
];
const only = process.argv.slice(2);
const browser = await chromium.launch({ executablePath: CHROME });
const page = await browser.newPage({ viewport: { width: 1920, height: 1080 } });
const errors = [];
page.on('pageerror', (e) => errors.push(String(e)));
let bad = 0;
for (const [name, q] of SCENES) {
  if (only.length && !only.includes(name)) continue;
  await page.goto(BASE + '/' + q);
  await page.evaluate(() => document.fonts.ready);
  await page.waitForTimeout(2200);
  const issues = await page.evaluate(() => {
    const out = [];
    const scene = document.querySelector('.scene.on');
    if (!scene) return ['no active scene'];
    const mark = document.getElementById('mark');
    const mr = mark && mark.classList.contains('show') ? mark.getBoundingClientRect() : null;
    const els = [...scene.querySelectorAll('*')].filter((el) => {
      const own = [...el.childNodes].some((n) => n.nodeType === 3 && n.textContent.trim());
      if (!own) return false;
      const cs = getComputedStyle(el);
      return cs.visibility !== 'hidden' && cs.display !== 'none' && el.getClientRects().length && !el.closest('[aria-hidden="true"]');
    });
    for (const el of els) {
      const cs = getComputedStyle(el);
      const t = el.textContent.trim().slice(0, 40);
      if (el.closest('pre')) continue; // code window texture
      // walk up for opacity 0
      let o = el, hidden = false;
      while (o && o !== scene) { if (getComputedStyle(o).opacity === '0') hidden = true; o = o.parentElement; }
      if (hidden) continue;
      let a = el, moving = false; // mid-animation positions are transient
      while (a && a !== scene) { if (a.getAnimations().some((x) => x.playState === 'running')) moving = true; a = a.parentElement; }
      if (parseFloat(cs.fontSize) < 28) out.push(`small ${cs.fontSize}: "${t}"`);
      if (el.scrollWidth > el.clientWidth + 2 && cs.overflow !== 'visible' && !el.classList.contains('scroll')) out.push(`clipped: "${t}"`);
      const r = el.getBoundingClientRect();
      if (!moving && r.right > 1922 || r.left < -2 || r.bottom > 1082 || r.top < -2) out.push(`off-stage: "${t}"`);
      if (mr && r.right > mr.left && r.left < mr.right && r.bottom > mr.top && r.top < mr.bottom && !mark.contains(el)) out.push(`under mark: "${t}"`);
    }
    return out;
  });
  const uniq = [...new Set(issues)];
  console.log(`${uniq.length ? 'FAIL' : 'ok  '} ${name}${uniq.length ? '\n   ' + uniq.join('\n   ') : ''}`);
  bad += uniq.length;
}
if (errors.length) { console.log('page errors:\n   ' + errors.join('\n   ')); bad += errors.length; }
await browser.close();
process.exit(bad ? 1 : 0);
