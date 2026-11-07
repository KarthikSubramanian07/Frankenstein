import { defineConfig } from 'vite';

// Cross-origin isolation, so Lane D's browser player (needs SharedArrayBuffer) can run inside the Rebuild
// game window as an iframe (?game=http://127.0.0.1:7401/). The event server sends CORP and CORS headers.
const isolated = { 'Cross-Origin-Opener-Policy': 'same-origin', 'Cross-Origin-Embedder-Policy': 'require-corp' };

export default defineConfig({
  server: { host: '127.0.0.1', port: 5173, strictPort: true, headers: isolated },
  preview: { host: '127.0.0.1', port: 5173, strictPort: true, headers: isolated },
});
