// Downloads the official Windows packager and bundled shareware inputs only.
import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createHash } from 'node:crypto';
const commit = "7763f5f9adf18f83a59093bc1ab786fe2c36591f";
const entries = [
  {
    "path": "GbaWadUtil/GbaWadUtil.exe",
    "size": 709120,
    "sha": "f08081a700974947f065369d2b8ca4bc181d09ec"
  },
  {
    "path": "GbaWadUtil/Qt6Core.dll",
    "size": 11812192,
    "sha": "2d8ea18ac939150d7c576200e4a0c06faef6ec03"
  },
  {
    "path": "GbaWadUtil/Qt6Gui.dll",
    "size": 12598104,
    "sha": "46979105a1ce9594dd1b433377f7f833d2b94f7d"
  },
  {
    "path": "GbaWadUtil/Qt6Svg.dll",
    "size": 658264,
    "sha": "06b78f04b0f6e4083efb30c580940841dd8f802e"
  },
  {
    "path": "GbaWadUtil/Qt6Widgets.dll",
    "size": 7531352,
    "sha": "d4f3d0221e8620595a430361bfd69f335f8db49f"
  },
  {
    "path": "GbaWadUtil/data/gbadoom.wad",
    "size": 8469,
    "sha": "910ec6ec4b1e3d4b37afd04f97d8c7284737ffb3"
  },
  {
    "path": "GbaWadUtil/doom1.wad",
    "size": 4196020,
    "sha": "1a58f66277d6bc869dfeb701591bd39f25eaacd0"
  },
  {
    "path": "GbaWadUtil/libgcc_s_seh-1.dll",
    "size": 109056,
    "sha": "089a1a695c0d115345bba5e367878c25b9912705"
  },
  {
    "path": "GbaWadUtil/libstdc++-6.dll",
    "size": 2243072,
    "sha": "4191c7a8257cd104a7f801bc513494c37036193d"
  },
  {
    "path": "GbaWadUtil/libwinpthread-1.dll",
    "size": 53248,
    "sha": "55456fe870965b5363f2ba477b30dd577e37af5a"
  },
  {
    "path": "GbaWadUtil/platforms/qwindows.dll",
    "size": 1338216,
    "sha": "1c0989e6a3be55ba74eec82289fa6304246407b1"
  }
];
const blobHash = b => createHash('sha1').update(Buffer.from('blob '+b.length)).update(Buffer.from([0])).update(b).digest('hex');
export async function prepareVendor() {
  const root = resolve(dirname(fileURLToPath(import.meta.url)), 'vendor/GBADoom-7763f5f');
  const results = [];
  for (const file of entries) {
    const target = resolve(root, file.path);
    let bytes = await readFile(target).catch(() => null);
    let cached = Boolean(bytes && bytes.length === file.size && blobHash(bytes) === file.sha);
    if (!cached) {
      const response = await fetch('https://raw.githubusercontent.com/doomhack/GBADoom/'+commit+'/'+file.path, {signal:AbortSignal.timeout(60000)});
      if (!response.ok) throw Error(file.path+': HTTP '+response.status);
      bytes = Buffer.from(await response.arrayBuffer());
      if (bytes.length !== file.size || blobHash(bytes) !== file.sha) throw Error('Git blob integrity mismatch: '+file.path);
      await mkdir(dirname(target), {recursive:true});
      await writeFile(target,bytes);
    }
    results.push({path:file.path,bytes:bytes.length,git_blob:file.sha,cached});
  }
  const result = {v:1,upstream:'doomhack/GBADoom',commit,root,files:results,note:'Local build inputs. Downloaded binaries and WAD stay ignored; not an approval to redistribute them.'};
  await writeFile(resolve(root,'VERIFIED.json'),JSON.stringify(result,null,2)+String.fromCharCode(10));
  return result;
}
if (globalThis.process?.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  try { console.log(JSON.stringify(await prepareVendor(),null,2)); }
  catch(error) { console.error(error.message); process.exitCode=1; }
}
