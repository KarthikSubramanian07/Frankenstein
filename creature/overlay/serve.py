"""Serve only the overlay directory on loopback; no dependencies."""
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=7302)
    args = parser.parse_args()
    handler = partial(SimpleHTTPRequestHandler, directory=str(Path(__file__).parent))
    server = ThreadingHTTPServer(("127.0.0.1", args.port), handler)
    print(f"Overlay: http://127.0.0.1:{args.port}/ (WS bridge :7301)", flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == "__main__":
    main()
