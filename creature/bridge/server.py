"""Local-only, dependency-free JSONL tap and recovery websocket bridge."""
from __future__ import annotations

import argparse
import asyncio
import base64
import hashlib
import json
import re
import struct
import time
from pathlib import Path
from urllib.parse import urlsplit

MAX_BODY = 256 * 1024
LOOPBACK = {'127.0.0.1', 'localhost', '::1'}
HTTP_REQUEST_LINE = re.compile(rb'^[A-Z]{3,8} \S+ HTTP/')


def _host_only(value):
    v = value.strip().lower()
    if v.startswith('['):
        return v[1:v.find(']')] if ']' in v else v
    return v.rsplit(':', 1)[0] if v.count(':') == 1 else v


def browser_refusal(headers, method):
    """A web page open on this laptop must not feed or read the bridge (SECURITY.md, threat 5).
    DNS rebinding keeps the attacker's Host; a cross-origin page sends its Origin; and a text/plain POST
    needs no CORS preflight, so telemetry must be application/json."""
    host = headers.get('host')
    if host and _host_only(host) not in LOOPBACK:
        return 'Host must be 127.0.0.1 or localhost'
    origin = headers.get('origin')
    if origin is not None and (urlsplit(origin).hostname or '') not in LOOPBACK:
        return 'cross-origin requests are not accepted'
    if method == 'POST' and headers.get('content-type', '').split(';')[0].strip().lower() != 'application/json':
        return 'Content-Type must be application/json'
    return None


class State:
    def __init__(self, manifest, viz, fixture=False):
        self.game = {f['id'] for f in manifest.get('functions', []) if f.get('scope') == 'game'}
        self.ranges = [(int(f['addr'], 0), int(f['size']), f['id']) for f in manifest.get('functions', []) if f.get('scope') == 'game' and 'addr' in f]
        self.groups = {s['id']: set(s['functions']) & self.game for s in viz.get('subsystems', [])}
        self.base_fixture = fixture or bool(manifest.get('fixture') or viz.get('fixture'))
        self.reset()
        self.frame = 0
        self.sprites = []
        self.running = []
        self.screenshot_path = None
        self.last_screenshot = None
        self.last_tap = None

    def reset(self):
        self.matched = set()
        self.run_id = None
        self.fixture = self.base_fixture

    def event(self, e):
        if e.get('type') == 'fixture' or e.get('fixture'):
            self.fixture = True
        run = e.get('run_id')
        if run and run != self.run_id:
            self.matched.clear()
            self.run_id = run
        elif e.get('type') == 'run.started':
            self.matched.clear()
        if e.get('type') == 'fn.matched' and e.get('fn') in self.game:
            self.matched.add(e['fn'])

    def tap(self, data):
        if not isinstance(data, dict) or type(data.get('frame')) is not int or data['frame'] < 0:
            raise ValueError('frame must be a nonnegative integer')
        sprites = data.get('sprites', [])
        if not isinstance(sprites, list) or len(sprites) > 128:
            raise ValueError('sprites must contain at most 128 entries')
        clean = []
        for s in sprites:
            if not isinstance(s, dict) or any(not isinstance(s.get(k), int) for k in ('i', 'x', 'y', 'w', 'h', 'tile', 'pal')):
                raise ValueError('sprite integer fields missing')
            if any(s[k] < 0 for k in ('i', 'w', 'h', 'tile', 'pal')):
                raise ValueError('negative sprite size or index')
            clean.append({**s, 'subsystem': s.get('subsystem') if s.get('subsystem') in self.groups else None})
        self.frame = data['frame']
        self.sprites = clean
        running = data.get('running', [])
        self.running = list(dict.fromkeys(f for f in running if isinstance(f, str) and f in self.game)) if isinstance(running, list) else []
        if isinstance(data.get('pc'), int) and not isinstance(data['pc'], bool):
            pc = data['pc'] & ~1
            self.running = list(dict.fromkeys(self.running + [fn for addr, size, fn in self.ranges if addr <= pc < addr + size]))
        self.last_tap = time.monotonic()
        if isinstance(data.get('screenshot_path'), str):
            self.screenshot_path = data['screenshot_path']
            self.last_screenshot = time.monotonic()

    def snapshot(self, source_status):
        age = None if self.last_tap is None else round(time.monotonic() - self.last_tap, 3)
        connected = age is not None and age < 3
        return {'v': 1, 'frame': self.frame, 'sprites': self.sprites if connected else [],
                'heal': {k: len(v & self.matched) / len(v) if v else 0 for k, v in self.groups.items()},
                'fixture': self.fixture, 'run_id': self.run_id, 'source_status': source_status,
                'tap_connected': connected, 'sample_age_s': age, 'running': self.running if connected else [],
                'screenshot_path': self.screenshot_path if connected else None,
                'screenshot_age_s': None if self.last_screenshot is None else round(time.monotonic() - self.last_screenshot, 3),
                'matched': len(self.matched), 'game_functions': len(self.game)}


class Tail:
    def __init__(self, path, state):
        self.path, self.state = path, state
        self.identity = None
        self.offset = 0
        self.prefix = b''
        self.status = 'missing'

    def poll(self):
        try:
            resolved = self.path.resolve(strict=True)
            stat = resolved.stat()
            identity = (str(resolved), stat.st_dev, stat.st_ino)
            with resolved.open('rb') as f:
                prefix = f.read(min(self.offset, 512))
                reset = identity != self.identity or stat.st_size < self.offset or prefix != self.prefix
                if reset:
                    self.offset = 0
                    self.state.reset()
                self.identity = identity
                f.seek(self.offset)
                while line := f.readline(MAX_BODY + 1):
                    if len(line) > MAX_BODY:
                        self.status = 'invalid: event line exceeds limit'
                        return
                    if not line.endswith(b'\n'):
                        break  # writer has not finished the JSONL record yet
                    self.offset = f.tell()
                    try:
                        e = json.loads(line)
                        if isinstance(e, dict):
                            self.state.event(e)
                    except (ValueError, UnicodeError):
                        self.status = 'invalid: malformed event'
                        return
                f.seek(0)
                self.prefix = f.read(min(self.offset, 512))
            self.status = 'fixture' if self.state.fixture else 'file'
        except OSError:
            self.status = 'missing'


def ws_packet(payload, opcode=1):
    n = len(payload)
    return bytes([0x80 | opcode]) + (bytes([n]) if n < 126 else b'\x7e' + struct.pack('!H', n) if n < 65536 else b'\x7f' + struct.pack('!Q', n)) + payload


class Bridge:
    def __init__(self, state, tail):
        self.state, self.tail = state, tail
        self.clients = set()

    async def tap(self, reader, writer):
        try:
            while line := await reader.readline():
                if HTTP_REQUEST_LINE.match(line):
                    break  # a browser POSTing to the tap port (cross-protocol); real taps send JSON lines only
                try:
                    self.state.tap(json.loads(line))
                except (ValueError, TypeError, KeyError):
                    pass
        except (ValueError, ConnectionError):
            pass
        finally:
            writer.close()
            await writer.wait_closed()

    async def http(self, reader, writer):
        try:
            raw = await asyncio.wait_for(reader.readuntil(b'\r\n\r\n'), 5)
            lines = raw.decode('ascii').split('\r\n')
            method, path, _ = lines[0].split(' ')
            headers = dict((k.lower().strip(), v.strip()) for k, v in (line.split(':', 1) for line in lines[1:] if ':' in line))
            if refusal := browser_refusal(headers, method):
                return await self.respond(writer, 403, {'error': refusal})
            if method == 'GET' and headers.get('upgrade', '').lower() == 'websocket':
                key = headers.get('sec-websocket-key', '')
                if headers.get('sec-websocket-version') != '13' or len(base64.b64decode(key)) != 16:
                    raise ValueError('invalid websocket handshake')
                accept = base64.b64encode(hashlib.sha1((key + '258EAFA5-E914-47DA-95CA-C5AB0DC85B11').encode()).digest()).decode()
                writer.write(('HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: ' + accept + '\r\n\r\n').encode())
                self.clients.add(writer)
                writer.write(ws_packet(json.dumps(self.state.snapshot(self.tail.status)).encode()))
                await writer.drain()
                while True:
                    h = await reader.readexactly(2)
                    n = h[1] & 127
                    if not h[1] & 128:
                        break
                    if n == 126:
                        n = struct.unpack('!H', await reader.readexactly(2))[0]
                    elif n == 127:
                        n = struct.unpack('!Q', await reader.readexactly(8))[0]
                    if n > MAX_BODY:
                        break
                    mask = await reader.readexactly(4)
                    data = await reader.readexactly(n)
                    data = bytes(b ^ mask[i % 4] for i, b in enumerate(data))
                    opcode = h[0] & 15
                    if opcode == 8:
                        writer.write(ws_packet(b'', 8))
                        break
                    if opcode == 9 and len(data) <= 125:
                        writer.write(ws_packet(data, 10))
                        await writer.drain()
                return
            status, body = 200, self.state.snapshot(self.tail.status)
            if method == 'POST' and path == '/telemetry':
                n = int(headers.get('content-length', '0'))
                if not 0 < n <= MAX_BODY:
                    raise ValueError('body length outside limit')
                self.state.tap(json.loads(await reader.readexactly(n)))
                body = {'ok': True}
            elif method != 'GET' or path not in ('/health', '/state', '/'):
                status, body = 404, {'error': 'not found'}
            await self.respond(writer, status, body)
        except (ValueError, UnicodeError, asyncio.LimitOverrunError, asyncio.TimeoutError):
            await self.respond(writer, 400, {'error': 'invalid request'})
        except (ConnectionError, asyncio.IncompleteReadError):
            pass
        finally:
            self.clients.discard(writer)
            writer.close()
            try:
                await writer.wait_closed()
            except ConnectionError:
                pass

    async def respond(self, writer, status, body):
        data = json.dumps(body, allow_nan=False).encode()
        writer.write(f'HTTP/1.1 {status} {"OK" if status == 200 else "Error"}\r\nContent-Type: application/json\r\nContent-Length: {len(data)}\r\nConnection: close\r\n\r\n'.encode() + data)
        await writer.drain()

    async def tick(self):
        while True:
            self.tail.poll()
            packet = ws_packet(json.dumps(self.state.snapshot(self.tail.status), allow_nan=False).encode())
            for writer in tuple(self.clients):
                try:
                    writer.write(packet)
                    await asyncio.wait_for(writer.drain(), .1)
                except (ConnectionError, asyncio.TimeoutError):
                    self.clients.discard(writer)
                    writer.close()
            await asyncio.sleep(.1)


async def run(args):
    manifest = json.loads(args.manifest.read_text(encoding='utf-8'))
    viz = json.loads(args.viz_map.read_text(encoding='utf-8'))
    state = State(manifest, viz, args.fixture)
    bridge = Bridge(state, Tail(args.events, state))
    tap = await asyncio.start_server(bridge.tap, '127.0.0.1', args.tap_port, limit=MAX_BODY)
    ws = await asyncio.start_server(bridge.http, '127.0.0.1', args.ws_port, limit=16384)
    http = await asyncio.start_server(bridge.http, '127.0.0.1', args.http_port, limit=16384)
    print(f'Tap TCP {args.tap_port}; overlay ws://127.0.0.1:{args.ws_port}; status http://127.0.0.1:{args.http_port}/state', flush=True)
    async with tap, ws, http:
        await bridge.tick()


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--events', type=Path, default=Path('runs/live/events.jsonl'))
    p.add_argument('--manifest', type=Path, default=Path('lab/out/manifest.json'))
    p.add_argument('--viz-map', type=Path, default=Path('lab/out/viz_map.json'))
    p.add_argument('--fixture', action='store_true')
    p.add_argument('--tap-port', type=int, default=7300)
    p.add_argument('--ws-port', type=int, default=7301)
    p.add_argument('--http-port', type=int, default=7304)
    try:
        asyncio.run(run(p.parse_args()))
    except KeyboardInterrupt:
        pass


if __name__ == '__main__':
    main()
