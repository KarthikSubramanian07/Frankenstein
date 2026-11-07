"""Local-only Player 2 server. Explicitly exposes one selected ROM; never a repo root."""
import argparse
import gzip
import hashlib
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit

ROOT = Path(__file__).resolve().parent
ASSETS = ('/index.html', '/style.css', '/player.js', '/core/mgba.js', '/core/mgba.wasm')
TYPES = {'.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8',
         '.wasm': 'application/wasm', '.gba': 'application/octet-stream'}
_cache = {}


def load(path):
    """Bytes, gzip bytes and a content ETag, recomputed only when the file changes."""
    stat = path.stat()
    key = (str(path), stat.st_mtime_ns, stat.st_size)
    if key not in _cache:
        data = path.read_bytes()
        _cache[key] = (data, gzip.compress(data, 6), '"' + hashlib.sha1(data).hexdigest()[:20] + '"')
    return _cache[key]


class Handler(SimpleHTTPRequestHandler):
    rom = None

    def end_headers(self):
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')
        self.send_header('Cross-Origin-Resource-Policy', 'same-origin')
        self.send_header('X-Content-Type-Options', 'nosniff')
        super().end_headers()

    def route(self, head=False):
        route = urlsplit(self.path).path
        if route == '/':
            route = '/index.html'
        if route == '/game.gba':
            target = self.rom if self.rom and self.rom.is_file() else None
            if not target:
                self.send_error(404, 'No assembled ROM configured; use --rom')
                return
        elif route in ASSETS:  # Whitelist: node_modules, source files and directory listings stay private.
            target = ROOT / route.lstrip('/')
        else:
            self.send_error(404)
            return
        try:
            data, packed, etag = load(target)
        except OSError:
            self.send_error(404, 'Missing local asset')
            return
        # Pinned core: cache for a day. Page and ROM: always revalidate, so a new patched ROM is never stale.
        cache = 'public, max-age=86400' if route.startswith('/core/') else 'no-cache'
        if self.headers.get('If-None-Match') == etag:
            self.send_response(304)
            self.send_header('ETag', etag)
            self.send_header('Cache-Control', cache)
            self.end_headers()
            return
        zipped = 'gzip' in (self.headers.get('Accept-Encoding') or '') and len(packed) < len(data) * 0.9
        body = packed if zipped else data
        self.send_response(200)
        self.send_header('Content-Type', TYPES.get(target.suffix.lower(), 'application/octet-stream'))
        self.send_header('Content-Length', str(len(body)))
        self.send_header('X-Uncompressed-Length', str(len(data)))
        self.send_header('ETag', etag)
        self.send_header('Cache-Control', cache)
        self.send_header('Vary', 'Accept-Encoding')
        if zipped:
            self.send_header('Content-Encoding', 'gzip')
        self.end_headers()
        if not head:
            self.wfile.write(body)

    def do_GET(self): self.route()
    def do_HEAD(self): self.route(head=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--port', type=int, default=7401)
    parser.add_argument('--rom', type=Path, help='Assembled .gba with WAD; served at /game.gba')
    args = parser.parse_args()
    if args.rom and (not args.rom.is_file() or args.rom.suffix.lower() != '.gba'):
        parser.error('--rom must point to an existing .gba file')
    Handler.rom = args.rom.resolve() if args.rom else None
    server = ThreadingHTTPServer(('127.0.0.1', args.port), partial(Handler, directory=str(ROOT)))
    print(f'Player 2: http://127.0.0.1:{args.port} (localhost only)', flush=True)
    print('ROM: ' + (str(Handler.rom) if Handler.rom else 'none; local file picker remains available'), flush=True)
    try: server.serve_forever()
    except KeyboardInterrupt: pass
    finally: server.server_close()


if __name__ == '__main__': main()
