"""Local-only Player 2 server. Explicitly exposes one selected ROM; never a repo root."""
import argparse
import gzip
import hashlib
import json
import re
import sys
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import urlsplit

ROOT = Path(__file__).resolve().parent
ASSETS = ('/index.html', '/style.css', '/player.js', '/sw.js', '/manifest.webmanifest', '/DISTRIBUTION.md',
          '/icons/icon-192.png', '/icons/icon-512.png', '/icons/maskable-512.png', '/icons/apple-touch-icon.png',
          '/core/mgba.js', '/core/mgba.wasm', '/core/qrcode.mjs')
TYPES = {'.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8',
         '.wasm': 'application/wasm', '.gba': 'application/octet-stream', '.mjs': 'text/javascript; charset=utf-8',
         '.webmanifest': 'application/manifest+json', '.png': 'image/png', '.md': 'text/markdown; charset=utf-8'}
_cache = {}


def load(path):
    """Bytes, gzip bytes and a content ETag, recomputed only when the file changes."""
    stat = path.stat()
    key = (str(path), stat.st_mtime_ns, stat.st_size)
    if key not in _cache:
        data = path.read_bytes()
        _cache[key] = (data, gzip.compress(data, 6), '"' + hashlib.sha1(data).hexdigest()[:20] + '"')
    return _cache[key]


def approved():
    """Download is offered only if DISTRIBUTION.md says so, read at request time."""
    try:
        text = (ROOT / 'DISTRIBUTION.md').read_text(encoding='utf-8')
    except OSError:
        return False
    return re.search(r'^Status: approved$', text, re.M) is not None


def verify_build(report_path, engine_path, rom_path):
    """The agent-written share is shown only for a real, byte-identical rebuild that is this ROM."""
    report = json.loads(report_path.read_text(encoding='utf-8-sig'))
    pct = report.get('pct_agent_code')
    if report.get('fixture') or report.get('identical') is not True or not isinstance(pct, (int, float)) or not 0 <= pct <= 100:
        raise ValueError('report must be a real build.rom payload: identical true, pct_agent_code 0-100, not a fixture')
    claim = str(report.get('rom_sha1', '')).lower()
    rom = rom_path.read_bytes()
    if hashlib.sha1(rom).hexdigest() == claim:
        basis = 'rom sha1'
    elif engine_path:
        engine = engine_path.read_bytes()
        if hashlib.sha1(engine).hexdigest() != claim:
            raise ValueError('--engine SHA-1 differs from the report rom_sha1')
        sys.path.insert(0, str(ROOT.parent / 'runtime'))
        from package_rom import validate_package  # Lane D's full engine-plus-WAD package check.
        validate_package(engine, rom)
        basis = 'engine sha1 + package check'
    else:
        raise ValueError('report rom_sha1 is not the served ROM; pass --engine for a packaged ROM')
    return {'pct_agent_code': round(float(pct), 1), 'rom_sha1': claim, 'basis': basis}


class Handler(SimpleHTTPRequestHandler):
    rom = None
    build = None

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
        if route == '/status.json':
            body = json.dumps({'v': 1, 'rom': bool(self.rom), 'distribution_approved': bool(self.rom) and approved(),
                               'build': self.build}).encode()
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.send_header('Content-Length', str(len(body)))
            self.send_header('Cache-Control', 'no-cache')
            self.end_headers()
            if not head:
                self.wfile.write(body)
            return
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
        cache = 'public, max-age=86400' if route.startswith(('/core/', '/icons/')) else 'no-cache'
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
    parser.add_argument('--report', type=Path, help='Real byte-identical build.rom/rebuild JSON with pct_agent_code')
    parser.add_argument('--engine', type=Path, help='Engine-only .gba the report hashes, when --rom is a packaged ROM')
    args = parser.parse_args()
    if args.rom and (not args.rom.is_file() or args.rom.suffix.lower() != '.gba'):
        parser.error('--rom must point to an existing .gba file')
    Handler.rom = args.rom.resolve() if args.rom else None
    if args.report:
        if not args.rom:
            parser.error('--report needs --rom')
        try:
            Handler.build = verify_build(args.report, args.engine, args.rom)
        except (OSError, ValueError) as error:
            parser.error(f'build report refused: {error}')
    server = ThreadingHTTPServer(('127.0.0.1', args.port), partial(Handler, directory=str(ROOT)))
    print(f'Player 2: http://127.0.0.1:{args.port} (localhost only)', flush=True)
    print('ROM: ' + (str(Handler.rom) if Handler.rom else 'none; local file picker remains available'), flush=True)
    print('Build label: ' + (f"{Handler.build['pct_agent_code']}% agent-written ({Handler.build['basis']})" if Handler.build else 'none'), flush=True)
    try: server.serve_forever()
    except KeyboardInterrupt: pass
    finally: server.server_close()


if __name__ == '__main__': main()
