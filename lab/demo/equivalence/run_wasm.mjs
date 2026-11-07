// Runs one job from run.py inside Node's WebAssembly engine and prints the outputs as JSON.
import { readFileSync } from 'node:fs';
const { instance } = await WebAssembly.instantiate(readFileSync(process.argv[2]));
const x = instance.exports;
const job = JSON.parse(readFileSync(0, 'utf8'));
let out = [];
if (job.fn === 'fn_0800549C') {
  const p = x.box_ptr();
  for (const b of job.args) {
    for (let i = 0; i < 4; i++) x.set_box(i, b[i] >>> 0);
    x.fn_0800549C(p, b[4], b[5]);
    out.push([0, 1, 2, 3].map(i => x.get_box(i) | 0));
  }
} else if (job.slot) {
  job.table.forEach((v, i) => x.set_table(i, v));
  for (let s = 0; s < 256; s++) { x.set_state(job.slot, s); for (let k = 0; k < job.draws; k++) out.push(x[job.fn]() >>> 0); }
} else {
  out = job.args.map(a => x[job.fn](...a) | 0);
}
process.stdout.write(JSON.stringify(out));
