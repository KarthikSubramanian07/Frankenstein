// Fetch an explicit GitHub checkpoint; validate before making it available to the demo.
import { mkdir, writeFile, access } from 'node:fs/promises';
import { resolve, dirname } from 'node:path';
import { createHash } from 'node:crypto';
import { fileURLToPath } from 'node:url';

const repo = 'KarthikSubramanian07/Frankenstein';
const sha1 = bytes => createHash('sha1').update(bytes).digest('hex');
const hex = value => typeof value === 'string' && /^[0-9a-f]{40}$/.test(value);
const safePath = value => typeof value === 'string' && /^(events\.jsonl|metrics\.json|names\.json|recovered\/fn_[0-9A-F]{8}\.c)$/.test(value);

export async function syncInputs({ commit, run = 'doom_r01', out }) {
  if (!hex(commit)) throw Error('Supply the full 40-character commit SHA; floating main is not a reproducible input.');
  if (!/^[A-Za-z0-9_-]+$/.test(run)) throw Error('Invalid run id.');
  if (!out) throw Error('Supply a fresh output directory.');
  const root = resolve(out);
  try { await access(root); throw Error('Output already exists; choose a fresh directory.'); }
  catch (error) { if (error.code !== 'ENOENT') throw error; }
  const base = `https://raw.githubusercontent.com/${repo}/${commit}/`;
  async function download(path) {
    const response = await fetch(base + path, { signal: AbortSignal.timeout(20000) });
    if (!response.ok) throw Error(`${path}: HTTP ${response.status}`);
    const bytes = Buffer.from(await response.arrayBuffer());
    if (bytes.length > 32 * 1024 * 1024) throw Error(`${path}: exceeds input limit`);
    return bytes;
  }
  const prefix = `crew/exports/${run}/`;
  const indexBytes = await download(prefix + 'EXPORT.json');
  const index = JSON.parse(indexBytes);
  if (index.fixture !== false || index.run_id !== run || index.game_id !== 'doom') throw Error('Expected an explicitly real Doom export with the requested run id.');
  if (!hex(index.manifest_sha1) || !hex(index.target_rom_sha1)) throw Error('Export has no valid build identity.');
  const entries = Object.entries(index.files || {});
  if (!entries.length || entries.length > 1024 || entries.some(([path, hash]) => !safePath(path) || !hex(hash))) throw Error('Unexpected export paths or hashes.');
  for (const required of ['events.jsonl', 'metrics.json', 'names.json']) {
    if (!index.files[required]) throw Error(`Export missing ${required}`);
  }
  const manifestBytes = await download('lab/out/manifest.json');
  if (sha1(manifestBytes) !== index.manifest_sha1) throw Error('Export manifest differs from this commit; obtain the matching checkpoint.');
  const manifest = JSON.parse(manifestBytes);
  if (manifest.game?.rom_sha1 !== index.target_rom_sha1) throw Error('Manifest target differs from export.');
  const [engine, viz, link] = await Promise.all(['lab/out/target.gba', 'lab/out/viz_map.json', 'lab/out/link_info.json'].map(download));
  if (sha1(engine) !== index.target_rom_sha1) throw Error('Engine SHA-1 does not match manifest/export.');
  JSON.parse(viz); JSON.parse(link);
  const payloads = [];
  // Keep requests bounded and validate every exported file, including recovered source.
  for (let offset = 0; offset < entries.length; offset += 4) {
    const batch = await Promise.all(entries.slice(offset, offset + 4).map(async ([path, hash]) => {
      const bytes = await download(prefix + path);
      if (sha1(bytes) !== hash) throw Error(`${path}: export hash mismatch`);
      return [path, bytes];
    }));
    payloads.push(...batch);
  }
  const metrics = JSON.parse(payloads.find(([path]) => path === 'metrics.json')[1]);
  if (metrics.fixture === true || metrics.run_id !== run) throw Error('Metrics are fixture data or refer to another run.');
  // Only write after the entire pinned bundle has passed validation. Partial writes
  // from disk errors never receive a VERIFIED.json marker and must not be used.
  await mkdir(root, { recursive: true });
  async function save(path, bytes) {
    const target = resolve(root, path);
    await mkdir(dirname(target), { recursive: true });
    await writeFile(target, bytes, { flag: 'wx' });
  }
  await save('manifest.json', manifestBytes);
  await save('target.gba', engine);
  await save('viz_map.json', viz);
  await save('link_info.json', link);
  await save('EXPORT.json', indexBytes);
  for (const [path, bytes] of payloads) await save(`run/${path}`, bytes);
  const verified = { v: 1, repository: repo, commit, run_id: run,
    manifest_sha1: sha1(manifestBytes), engine_sha1: sha1(engine),
    files_verified: payloads.length, fixture: false,
    note: 'Engine-only ROM, not yet a playable WAD-packaged game. SHA-1 verifies consistency, not an independent referee rerun.' };
  await save('VERIFIED.json', JSON.stringify(verified, null, 2) + '\n');
  return { ...verified, directory: root };
}

if (globalThis.process?.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const args = process.argv.slice(2);
  if (args.includes('--help')) {
    console.log('node creature/runtime/sync_inputs.mjs --commit <40-char SHA> --run doom_r01 --out <fresh directory>');
  } else {
    try {
      const options = {};
      for (let i = 0; i < args.length; i += 2) {
        if (!['--commit', '--run', '--out'].includes(args[i]) || !args[i + 1]) throw Error('Use --help for arguments.');
        options[args[i].slice(2)] = args[i + 1];
      }
      console.log(JSON.stringify(await syncInputs(options), null, 2));
    } catch (error) { console.error(error.message); process.exitCode = 1; }
  }
}
