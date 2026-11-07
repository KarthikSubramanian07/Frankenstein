// Renders QA stills from one bundle: `npm run stills -- [compositionId] [frame ...]`
import path from 'node:path';
import {bundle} from '@remotion/bundler';
import {openBrowser, renderStill, selectComposition} from '@remotion/renderer';

const QA_FRAMES = [60, 180, 285, 450, 540, 650, 765, 870];

const [id = 'Platypus', ...frameArgs] = process.argv.slice(2);
const frames = frameArgs.length ? frameArgs.map(Number) : QA_FRAMES;

const serveUrl = await bundle({entryPoint: path.resolve('src/index.ts')});
const puppeteerInstance = await openBrowser('chrome');
const composition = await selectComposition({serveUrl, id, puppeteerInstance});

for (const frame of frames) {
  const output = path.resolve('out/stills', `${id}-${String(frame).padStart(3, '0')}.png`);
  await renderStill({composition, serveUrl, output, frame, puppeteerInstance, scale: Number(process.env.STILL_SCALE ?? 1)});
  console.log(output);
}

await puppeteerInstance.close({silent: true});
