// Screenshot every built scene at 1920x1080 and 1280x720 into stage/shots/.
// Needs `npm run dev` and `npm run server` running. Uses the local Chrome install.
import { chromium } from 'playwright-core';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const HERE = path.dirname(fileURLToPath(import.meta.url));
const OUT = path.resolve(HERE, '..', 'shots');
const BASE = process.env.STAGE_URL || 'http://127.0.0.1:5173';
const RUN = process.env.RUN || 'doom_r01';
const CHROME = process.env.CHROME_PATH || '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome';
const only = process.argv.slice(2);

const SHOTS = [
  { name: 'log', q: '?replay=' + RUN + '&speed=4&t=200', wait: 2600 },
  { name: 'log-r12', q: '?replay=doom_r12&speed=8&t=420', wait: 2600 },
  { name: 'log-sample', q: '?replay=fx01&speed=1&t=40', wait: 2600 },
  { name: 'card', q: '?scene=card&replay=' + RUN + '&speed=20&t=999', wait: 1500 },
  { name: 'card-sample', q: '?scene=card', wait: 1500 },
  { name: 'road', q: '?scene=road&replay=doom_r12&speed=8&t=300', wait: 3200 },
  { name: 'legacy-split', q: '?legacy=1&scene=split&replay=' + RUN + '&speed=4&t=200', wait: 2600 },
];

fs.mkdirSync(OUT, { recursive: true });
const browser = await chromium.launch({ executablePath: CHROME, headless: true });
for (const [w, hgt] of [[1920, 1080], [1280, 720]]) {
  const page = await browser.newPage({ viewport: { width: w, height: hgt } });
  for (const s of SHOTS) {
    if (only.length && !only.includes(s.name)) continue;
    await page.goto(BASE + '/' + s.q);
    await page.evaluate(() => document.fonts.ready);
    await page.waitForTimeout(s.wait);
    const file = path.join(OUT, `${s.name}-${w}x${hgt}.png`);
    await page.screenshot({ path: file });
    console.log(file);
  }
  await page.close();
}
await browser.close();
