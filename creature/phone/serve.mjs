// Dependency-free alternative host for the browser player.
import http from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { createHash } from 'node:crypto';
import { gzipSync } from 'node:zlib';
import { dirname, resolve, extname } from 'node:path';
import { fileURLToPath } from 'node:url';

const defaultRoot = dirname(fileURLToPath(import.meta.url));
const allowed = new Set(['/index.html', '/player.js', '/controls.js', '/style.css', '/sw.js', '/manifest.webmanifest', '/DISTRIBUTION.md',
  '/icons/icon-192.png', '/icons/icon-512.png', '/icons/maskable-512.png', '/icons/apple-touch-icon.png',
  '/core/mgba.js', '/core/mgba.wasm', '/core/qrcode.mjs']);
const types = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8', '.wasm': 'application/wasm', '.gba': 'application/octet-stream', '.mjs': 'text/javascript; charset=utf-8', '.webmanifest': 'application/manifest+json', '.png': 'image/png', '.md': 'text/markdown; charset=utf-8' };

const memo = new Map();
// Bytes, gzip bytes and a content ETag, recomputed only when the file changes.
async function load(file) {
  const info = await stat(file);
  const key = `${file}:${info.mtimeMs}:${info.size}`;
  if (!memo.has(key)) {
    const bytes = await readFile(file);
    memo.set(key, { bytes, packed: gzipSync(bytes, { level: 6 }), etag: `"${createHash('sha1').update(bytes).digest('hex').slice(0, 20)}"` });
  }
  return memo.get(key);
}

const sha1 = bytes => createHash('sha1').update(bytes).digest('hex');
// Download is offered only if DISTRIBUTION.md says so, read at request time.
async function approved(base) { return /^Status: approved$/m.test(await readFile(resolve(base, 'DISTRIBUTION.md'), 'utf8').catch(() => '')); }
// The agent-written share is shown only for a real, byte-identical rebuild that is this ROM.
export async function verifyBuild(reportPath, enginePath, romPath) {
  const report = JSON.parse((await readFile(reportPath, 'utf8')).replace(/^\uFEFF/, ''));
  const pct = report.pct_agent_code;
  if (report.fixture || report.identical !== true || typeof pct !== 'number' || pct < 0 || pct > 100) throw Error('report must be a real build.rom payload: identical true, pct_agent_code 0-100, not a fixture');
  const claim = String(report.rom_sha1 || '').toLowerCase(), rom = await readFile(romPath);
  if (sha1(rom) === claim) return { pct_agent_code: Math.round(pct * 10) / 10, rom_sha1: claim, basis: 'rom sha1' };
  if (!enginePath) throw Error('report rom_sha1 is not the served ROM; pass --engine for a packaged ROM');
  const engine = await readFile(enginePath);
  if (sha1(engine) !== claim) throw Error('--engine SHA-1 differs from the report rom_sha1');
  // Same engine-preservation rule as creature/runtime/package_rom.py (the Python host runs the full check).
  const magic = Buffer.from('GBADOOM-IWAD-HDR'), at = b => { const o = []; for (let i = 0; i + 32 <= b.length; i += 32) if (b.subarray(i, i + 16).equals(magic)) o.push(i); return o; };
  const [off] = at(engine), offs = at(rom);
  if (at(engine).length !== 1 || engine.length !== off + 32 || offs.length !== 1 || offs[0] !== off || !rom.subarray(0, off + 16).equals(engine.subarray(0, off + 16))) throw Error('served ROM is not this engine plus a WAD');
  return { pct_agent_code: Math.round(pct * 10) / 10, rom_sha1: claim, basis: 'engine sha1 + package check' };
}

export function createPlayerServer({ root = defaultRoot, rom = null, build = null } = {}) {
  const base = resolve(root);
  const game = rom ? resolve(rom) : null;
  return http.createServer(async (request, response) => {
    response.setHeader('Cross-Origin-Opener-Policy', 'same-origin');
    response.setHeader('Cross-Origin-Embedder-Policy', 'require-corp');
    response.setHeader('Cross-Origin-Resource-Policy', 'same-origin');
    response.setHeader('X-Content-Type-Options', 'nosniff');
    if (!['GET', 'HEAD'].includes(request.method)) { response.writeHead(405); response.end(); return; }
    let path;
    try { path = new URL(request.url, 'http://localhost').pathname; }
    catch { response.writeHead(400); response.end(); return; }
    if (path === '/status.json') {
      response.setHeader('Content-Type', 'application/json');
      response.setHeader('Cache-Control', 'no-cache');
      const body = JSON.stringify({ v: 1, rom: Boolean(game), distribution_approved: Boolean(game) && await approved(base), build });
      response.end(request.method === 'HEAD' ? undefined : body);
      return;
    }
    if (path === '/health') {
      response.setHeader('Content-Type', 'application/json');
      response.setHeader('Cache-Control', 'no-store');
      response.end(request.method === 'HEAD' ? undefined : JSON.stringify({ ok: true, rom_configured: Boolean(game), gameplay_verified: false }));
      return;
    }
    if (path === '/') path = '/index.html';
    const target = path === '/game.gba' ? game : allowed.has(path) ? resolve(base, '.' + path) : null;
    if (!target) { response.writeHead(404); response.end('Unavailable'); return; }
    try {
      const { bytes, packed, etag } = await load(target);
      // Pinned core: cache for a day. Page and ROM: always revalidate, so a new patched ROM is never stale.
      response.setHeader('Cache-Control', /^\/(core|icons)\//.test(path) ? 'public, max-age=86400' : 'no-cache');
      response.setHeader('ETag', etag);
      if (request.headers['if-none-match'] === etag) { response.writeHead(304); response.end(); return; }
      const zipped = /\bgzip\b/.test(request.headers['accept-encoding'] || '') && packed.length < bytes.length * 0.9;
      const body = zipped ? packed : bytes;
      response.setHeader('Content-Type', types[extname(target)] || 'application/octet-stream');
      response.setHeader('Content-Length', body.length);
      response.setHeader('X-Uncompressed-Length', bytes.length);
      response.setHeader('Vary', 'Accept-Encoding');
      if (zipped) response.setHeader('Content-Encoding', 'gzip');
      response.writeHead(200);
      response.end(request.method === 'HEAD' ? undefined : body);
    } catch { response.writeHead(404); response.end('Missing local asset'); }
  });
}

if (globalThis.process?.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const args = process.argv.slice(2);
  const options = {};
  for (let i = 0; i < args.length; i += 2) {
    if (!['--port', '--rom', '--report', '--engine'].includes(args[i]) || !args[i + 1]) throw Error('Usage: node serve.mjs [--port 7401] [--rom playable.gba] [--report build.json [--engine engine.gba]]');
    options[args[i].slice(2)] = args[i + 1];
  }
  const port = Number(options.port || 7401);
  if (!Number.isInteger(port) || port < 1024 || port > 65535) throw Error('Invalid port');
  if (options.report && !options.rom) throw Error('--report needs --rom');
  const build = options.report ? await verifyBuild(options.report, options.engine, options.rom).catch(e => { throw Error(`build report refused: ${e.message}`); }) : null;
  const server = createPlayerServer({ rom: options.rom, build });
  server.on('error', error => { console.error(error.message); process.exitCode = 1; });
  server.listen(port, '127.0.0.1', () => console.log(`Player: http://127.0.0.1:${port}/ (local preview only)`));
}
