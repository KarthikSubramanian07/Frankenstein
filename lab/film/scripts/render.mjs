// Renders a composition to MP4: `node scripts/render.mjs [compositionId] [output]`
// Uses the renderer API directly (same settings as remotion.config.ts), with coarse progress logs.
import path from 'node:path';
import {bundle} from '@remotion/bundler';
import {openBrowser, renderMedia, selectComposition} from '@remotion/renderer';

const [id = 'Frankenstein', out = 'out/frankenstein_film.mp4'] = process.argv.slice(2);

const serveUrl = await bundle({entryPoint: path.resolve('src/index.ts')});
const puppeteerInstance = await openBrowser('chrome');
const composition = await selectComposition({serveUrl, id, puppeteerInstance});

let lastLogged = -1;
await renderMedia({
  composition,
  serveUrl,
  puppeteerInstance,
  codec: 'h264',
  crf: 18,
  x264Preset: 'faster',
  imageFormat: 'jpeg',
  jpegQuality: 92,
  concurrency: (await import('node:os')).cpus().length,
  pixelFormat: 'yuv420p',
  outputLocation: path.resolve(out),
  overwrite: true,
  onProgress: ({progress}) => {
    const pct = Math.floor(progress * 20) * 5;
    if (pct !== lastLogged) {
      lastLogged = pct;
      console.log(`${id}: ${pct}%`);
    }
  },
});

await puppeteerInstance.close({silent: true});
console.log(`Done: ${out}`);
