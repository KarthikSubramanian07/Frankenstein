"""Build an allowlisted Cloudflare Pages player directory; does not deploy it."""
from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import math
from pathlib import Path

ROOT = Path(__file__).resolve().parent
DIST = ROOT / 'dist'
ASSETS = (
    'index.html', 'style.css', 'player.js', 'controls.js', 'arrival.js', 'arrival.css', 'doom-entry.js', 'demo.css', 'results.html', 'results.js', 'results.css',  'manifest.webmanifest',
    'DISTRIBUTION.md', 'THIRD_PARTY.md',
    'licenses/MPL-2.0.txt', 'licenses/qrcode-MIT.txt', 'licenses/inih-BSD-3-Clause.txt',
    'icons/icon-192.png', 'icons/icon-512.png', 'icons/maskable-512.png',
    'icons/apple-touch-icon.png', 'core/mgba.js', 'core/mgba.wasm', 'core/qrcode.mjs',
)
HEADERS = '''/*
  Cross-Origin-Opener-Policy: same-origin
  Cross-Origin-Embedder-Policy: require-corp
  Cross-Origin-Resource-Policy: same-origin
  X-Content-Type-Options: nosniff
  Cache-Control: no-store
  X-Robots-Tag: noindex, nofollow
'''
# This judging-window variant keeps the installable shell while never caching the
# ROM/status. Withdrawing a public ROM must not leave our SW serving it offline.
SERVICE_WORKER = '''const CACHE = 'player2-judging-v3';
const SHELL = ['./', 'index.html', 'style.css', 'player.js', 'controls.js', 'arrival.js', 'arrival.css', 'doom-entry.js', 'demo.css', 'results.html', 'results.js', 'results.css',  'manifest.webmanifest',
  'icons/icon-192.png', 'icons/icon-512.png', 'core/mgba.js', 'core/mgba.wasm', 'core/qrcode.mjs'];
self.addEventListener('install', event => event.waitUntil((async () => {
  const cache = await caches.open(CACHE);
  await Promise.all(SHELL.map(url => fetch(url).then(r => r.ok && cache.put(url, r)).catch(() => {})));
  await self.skipWaiting();
})()));
self.addEventListener('activate', event => event.waitUntil((async () => {
  for (const key of await caches.keys()) if (key.startsWith('player2-') && key !== CACHE) await caches.delete(key);
  const cache = await caches.open(CACHE);
  await cache.delete('game.gba'); await cache.delete('status.json');
  await self.clients.claim();
})()));
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);
  if (event.request.method !== 'GET' || url.origin !== location.origin) return;
  const base = new URL(self.registration.scope);
  const path = url.pathname.slice(base.pathname.length);
  if (path === 'game.gba' || path === 'status.json') {
    event.respondWith(fetch(event.request, {cache: 'no-store'})); return;
  }
  if (!SHELL.includes(path || './')) return;
  event.respondWith((async () => {
    const cache = await caches.open(CACHE);
    const key = event.request.mode === 'navigate' ? './' : event.request;
    try { const response = await fetch(event.request); if (response.ok) await cache.put(key, response.clone()); return response; }
    catch (error) { const hit = await cache.match(key); if (hit) return hit; throw error; }
  })());
});
'''


def module_at(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha1(data):
    return hashlib.sha1(data).hexdigest()


def build_bundle(out, rom=None, engine=None, report=None):
    out = out.resolve()
    dist = DIST.resolve()
    if out == dist or not out.is_relative_to(dist):
        raise ValueError('--out must be a NEW child directory inside creature/phone/dist/')
    if out.exists():
        raise ValueError('output already exists; choose a fresh name (nothing is deleted or overwritten)')
    files = {}
    for name in ASSETS:
        source = (ROOT / name).resolve()
        if not source.is_relative_to(ROOT) or not source.is_file():
            raise ValueError(f'missing or external asset {name}; run npm ci --ignore-scripts and npm run prepare:core')
        files[name] = source.read_bytes()
    if report and not rom:
        raise ValueError('--report requires --rom')
    if engine and not rom:
        raise ValueError('--engine requires --rom')
    build = None
    package = None
    if rom:
        package = rom.read_bytes()
        runtime = module_at('phone_bundle_package', ROOT.parent / 'runtime' / 'package_rom.py')
        # Without an engine this checks the package's structure, not provenance.
        off = runtime.header_offset(package)
        engine_bytes = engine.read_bytes() if engine else package[:off + runtime.HEADER_SIZE]
        runtime.validate_package(engine_bytes, package)
        files['game.gba'] = package
    if report:
        raw = json.loads(report.read_text(encoding='utf-8-sig'))
        if not isinstance(raw, dict):
            raise ValueError('report must be a build.rom payload object')
        pct = raw.get('pct_agent_code')
        if type(pct) not in (int, float) or not math.isfinite(pct):
            raise ValueError('report pct_agent_code must be a finite number')
        server = module_at('phone_bundle_server', ROOT / 'server.py')
        build = server.verify_build(report, engine, rom)
    status = {'v': 1, 'rom': bool(rom), 'distribution_approved': False, 'build': build}
    files['status.json'] = (json.dumps(status, indent=2) + '\n').encode()
    files['_headers'] = HEADERS.encode()
    files['sw.js'] = SERVICE_WORKER.encode()
    files['404.html'] = b'<!doctype html><title>Unavailable</title><p>This player asset is unavailable.</p>\n'
    # No absolute local paths, report text, keys, source trees or engine-only file
    # are copied into the public output.
    manifest = {'v': 1, 'kind': 'creature.phone.static-bundle',
                'public_scope': 'judging-window-only', 'download_approved': False,
                'rom_sha1': sha1(package) if package else None,
                'package_validation': 'engine-preservation + structure' if engine else ('structure only' if rom else None),
                'gameplay_verified_by_bundle': False,
                'files': {name: {'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest()}
                          for name, data in sorted(files.items())}}
    files['bundle-manifest.json'] = (json.dumps(manifest, indent=2, sort_keys=True) + '\n').encode()
    # Validate every input before creating output. No recursive deletion needed.
    out.mkdir(parents=True)
    for name, data in files.items():
        destination = out / name
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(data)
    return {'output': str(out), 'files': len(files), 'rom_sha1': manifest['rom_sha1'], 'build': build,
            'distribution_approved': False, 'deployed': False}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--out', type=Path, default=DIST / 'player', help='new child of creature/phone/dist; never overwritten')
    p.add_argument('--rom', type=Path, help='already-packaged shareware .gba; omitted for a waiting page')
    p.add_argument('--engine', type=Path, help='engine-only .gba for full preservation validation')
    p.add_argument('--report', type=Path, help='real identical rebuild payload for a verified agent-code label')
    args = p.parse_args()
    try:
        result = build_bundle(args.out, args.rom, args.engine, args.report)
    except (OSError, ValueError, ImportError) as error:
        p.error(str(error))
    print(json.dumps(result, indent=2))


if __name__ == '__main__': main()
