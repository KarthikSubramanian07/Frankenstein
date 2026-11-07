// Offline play after the first load. Cached responses keep the server's COOP/COEP headers, so the page
// stays cross-origin isolated when it is served from here. The ROM is network-first: a newly published
// patched ROM always wins when the network is up; the cached copy is only for offline.
const CACHE = 'player2-v1';
const SHELL = ['./', 'index.html', 'style.css', 'player.js', 'manifest.webmanifest', 'icons/icon-192.png', 'icons/icon-512.png'];
const HEAVY = ['core/mgba.js', 'core/mgba.wasm', 'core/qrcode.mjs', 'game.gba', 'status.json'];

self.addEventListener('install', event => {
  event.waitUntil((async () => {
    const cache = await caches.open(CACHE);
    // The page registers us after it downloaded the core and ROM, so these come from the HTTP cache.
    await Promise.all([...SHELL, ...HEAVY].map(url => fetch(url).then(r => r.ok && cache.put(url, r)).catch(() => {})));
    await self.skipWaiting();
  })());
});
self.addEventListener('activate', event => {
  event.waitUntil((async () => {
    for (const key of await caches.keys()) if (key !== CACHE) await caches.delete(key);
    await self.clients.claim();
  })());
});
self.addEventListener('fetch', event => {
  const url = new URL(event.request.url);
  if (event.request.method !== 'GET' || url.origin !== location.origin) return;
  const path = url.pathname.replace(/^.*\//, '') || './';
  const pinned = url.pathname.includes('/core/');
  event.respondWith((async () => {
    const cache = await caches.open(CACHE);
    const key = event.request.mode === 'navigate' ? './' : event.request;
    if (pinned) { const hit = await cache.match(key); if (hit) return hit; }
    try {
      const response = await fetch(event.request);
      if (response.ok) cache.put(key, response.clone());
      else if (response.status === 404 && path === 'game.gba') cache.delete(key); // Unpublished means unpublished.
      return response;
    } catch (error) {
      const hit = await cache.match(key);
      if (hit) return hit;
      throw error;
    }
  })());
});
