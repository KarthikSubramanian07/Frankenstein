// Dependency-free alternative host for the browser player.
import http from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { createHash } from 'node:crypto';
import { gzipSync } from 'node:zlib';
import { dirname, resolve, extname } from 'node:path';
import { fileURLToPath } from 'node:url';

const defaultRoot = dirname(fileURLToPath(import.meta.url));
const allowed = new Set(['/index.html', '/player.js', '/style.css', '/core/mgba.js', '/core/mgba.wasm']);
const types = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8', '.wasm': 'application/wasm', '.gba': 'application/octet-stream' };

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

export function createPlayerServer({ root = defaultRoot, rom = null } = {}) {
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
      response.setHeader('Cache-Control', path.startsWith('/core/') ? 'public, max-age=86400' : 'no-cache');
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
    if (!['--port', '--rom'].includes(args[i]) || !args[i + 1]) throw Error('Usage: node serve.mjs [--port 7401] [--rom playable.gba]');
    options[args[i].slice(2)] = args[i + 1];
  }
  const port = Number(options.port || 7401);
  if (!Number.isInteger(port) || port < 1024 || port > 65535) throw Error('Invalid port');
  const server = createPlayerServer({ rom: options.rom });
  server.on('error', error => { console.error(error.message); process.exitCode = 1; });
  server.listen(port, '127.0.0.1', () => console.log(`Player: http://127.0.0.1:${port}/ (local preview only)`));
}
