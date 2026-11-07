"""Writes web/agents.wasm (the agents' C, -O2 -fwrapv) and web/vectors.json: inputs plus the outputs the ORIGINAL GBA
machine code gave for them under Unicorn. The browser page re-runs the agents' wasm on the same inputs and compares.
Run from the repo root: /tmp/eqv/bin/python lab/demo/equivalence/vectors.py"""
import json, random, shutil, struct, sys, tempfile
from pathlib import Path
sys.argv = [sys.argv[0], "0", "-fwrapv"]
import run
K = 5_000


def main():
    rom = run.ROM.read_bytes()
    gba = run.Gba(rom)
    rnd = random.Random(7)
    rand = lambda: run.s32(rnd.getrandbits(32))
    v = {"table": list(rom[0x2638C:0x2638C + 256])}
    for fn in ("fn_03002660", "fn_0800FDFC"):
        args = [[rand(), rand()] for _ in range(K)]
        v[fn] = {"args": args, "gba": [run.s32(gba.call(fn, *a)) for a in args]}
    boxes = [[rand() for _ in range(6)] for _ in range(K)]
    out = []
    for b in boxes:
        gba.uc.mem_write(run.BOX, struct.pack("<4i", *b[:4]))
        gba.call("fn_0800549C", run.BOX, b[4], b[5])
        out.append(list(struct.unpack("<4i", gba.uc.mem_read(run.BOX, 16))))
    v["fn_0800549C"] = {"args": boxes, "gba": out}
    seq = []
    gba.uc.mem_write(run.G + 4 * 502, struct.pack("<I", 0))
    for _ in range(K):
        seq.append(gba.call("fn_08006B00"))
    v["fn_08006B00"] = {"slot": 502, "start": 0, "gba": seq}
    web = run.HERE / "web"
    web.mkdir(exist_ok=True)
    (web / "vectors.json").write_text(json.dumps(v, separators=(",", ":")))
    with tempfile.TemporaryDirectory() as t:
        _, wasm = run.build(Path(t))
        shutil.copy(wasm, web / "agents.wasm")
    print("wrote", web)


if __name__ == "__main__":
    main()
