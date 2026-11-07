import { copyFile, mkdir, access } from 'node:fs/promises';
import { resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
const root = fileURLToPath(new URL('.', import.meta.url));
const target = resolve(root, 'core');
// Same-origin copies: the mGBA core, and the QR encoder the "Play it your way" panel loads on demand.
const files = [
  ['node_modules/@thenick775/mgba-wasm/dist/mgba.js', 'mgba.js'],
  ['node_modules/@thenick775/mgba-wasm/dist/mgba.wasm', 'mgba.wasm'],
  ['node_modules/qrcode-generator/dist/qrcode.mjs', 'qrcode.mjs'],
];
for (const [from] of files) await access(resolve(root, from));
await mkdir(target, { recursive: true });
for (const [from, to] of files) await copyFile(resolve(root, from), resolve(target, to));
console.log('Prepared same-origin mGBA core and QR encoder. Serve this directory with server.py or serve.mjs.');
