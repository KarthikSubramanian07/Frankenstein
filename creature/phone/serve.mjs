// Dependency-free alternative host for the browser player.
import http from 'node:http';
import { readFile } from 'node:fs/promises';
import { dirname, resolve, extname } from 'node:path';
import { fileURLToPath } from 'node:url';

const defaultRoot = dirname(fileURLToPath(import.meta.url));
const allowed = new Set(['/index.html', '/player.js', '/style.css', '/core/mgba.js', '/core/mgba.wasm']);
const types = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8', '.wasm': 'application/wasm', '.gba': 'application/octet-stream' };

export function createPlayerServer({ root = defaultRoot, rom = null } = {}) {
  const base = resolve(root);
  const game = rom ? resolve(rom) : null;
  return http.createServer(async (request, response) => {
    response.setHeader('Cross-Origin-Opener-Policy', 'same-origin');
    response.setHeader('Cross-Origin-Embedder-Policy', 'require-corp');
    response.setHeader('Cross-Origin-Resource-Policy', 'same-origin');
    response.setHeader('X-Content-Type-Options', 'nosniff');
    response.setHeader('Cache-Control', 'no-store');
    if (!['GET', 'HEAD'].includes(request.method)) { response.writeHead(405); response.end(); return; }
    let path;
    try { path = new URL(request.url, 'http://localhost').pathname; }
    catch { response.writeHead(400); response.end(); return; }
    if (path === '/health') {
      response.setHeader('Content-Type', 'application/json');
      response.end(request.method === 'HEAD' ? undefined : JSON.stringify({ ok: true, rom_configured: Boolean(game), gameplay_verified: false }));
      return;
    }
    if (path === '/') path = '/index.html';
    const target = path === '/game.gba' ? game : allowed.has(path) ? resolve(base, '.' + path) : null;
    if (!target) { response.writeHead(404); response.end('Unavailable'); return; }
    try {
      const bytes = await readFile(target);
      response.setHeader('Content-Type', types[extname(target)] || 'application/octet-stream');
      response.setHeader('Content-Length', bytes.length);
      response.writeHead(200);
      response.end(request.method === 'HEAD' ? undefined : bytes);
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
