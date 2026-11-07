"""Local-only Player 2 server. Explicitly exposes one selected ROM; never a repo root."""
import argparse
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
import json
from pathlib import Path
from urllib.parse import urlsplit

ROOT = Path(__file__).resolve().parent

class Handler(SimpleHTTPRequestHandler):
    rom = None

    def end_headers(self):
        self.send_header('Cross-Origin-Opener-Policy', 'same-origin')
        self.send_header('Cross-Origin-Embedder-Policy', 'require-corp')
        self.send_header('Cross-Origin-Resource-Policy', 'same-origin')
        self.send_header('X-Content-Type-Options', 'nosniff')
        self.send_header('Cache-Control', 'no-store')
        super().end_headers()

    def route(self, head=False):
        route = urlsplit(self.path).path
        if route == '/game.gba':
            if not self.rom or not self.rom.is_file():
                self.send_error(404, 'No assembled ROM configured; use --rom')
                return
            self.send_response(200)
            self.send_header('Content-Type', 'application/octet-stream')
            self.send_header('Content-Length', str(self.rom.stat().st_size))
            self.end_headers()
            if not head:
                with self.rom.open('rb') as stream:
                    self.copyfile(stream, self.wfile)
            return
        # Whitelist page assets; node_modules, source files and directory listings stay private.
        if route not in ('/', '/index.html', '/style.css', '/player.js', '/core/mgba.js', '/core/mgba.wasm'):
            self.send_error(404)
            return
        if head:
            super().do_HEAD()
        else:
            super().do_GET()

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
