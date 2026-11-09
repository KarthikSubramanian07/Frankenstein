"""Behavioral equivalence: the agents' recovered C, compiled for this Mac (arm64) and for WebAssembly, against the
original GBA machine code run instruction by instruction in a Thumb/ARM emulator (Unicorn). Same inputs, fixed seed.
Run from the repo root:  /tmp/eqv/bin/python lab/demo/equivalence/run.py [N] [-fwrapv]
Needs: pip install unicorn ziglang (any venv); clang; node. Reads lab/out/target.gba (built locally, never committed)."""
import ctypes, json, random, struct, subprocess, sys, tempfile, time
from pathlib import Path
from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM
from unicorn.arm_const import UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2, UC_ARM_REG_LR, UC_ARM_REG_SP

HERE = Path(__file__).parent
REPO = HERE.parents[2]
REC = REPO / "crew/exports/union/recovered"
ROM = REPO / "lab/out/target.gba"
N = int(sys.argv[1]) if len(sys.argv) > 1 else 1_000_000
FLAGS = [a for a in sys.argv[2:]]  # e.g. -fwrapv: define signed overflow the way the GBA hardware does it
FNS = ["fn_03002660", "fn_03000D94", "fn_0800FDFC", "fn_0800549C", "fn_08006B00", "fn_08006B20"]
RET = 0x02000000          # return address: EWRAM, never executed (emulation stops there)
G = 0x02010000            # where the emulated game's globals block lives
BOX = 0x02020000
M = 0xFFFFFFFF


def s32(x): return struct.unpack("<i", struct.pack("<I", x & M))[0]


def build(tmp):
    """arm64 dylib and wasm module from the agents' files plus stub.c. Returns (ctypes lib, wasm path)."""
    srcs = [str(REC / f"{f}.c") for f in FNS] + [str(HERE / "stub.c")]
    dylib, wasm = tmp / "agents.dylib", tmp / "agents.wasm"
    subprocess.run(["clang", "-O2", "-w", *FLAGS, "-shared", "-o", dylib, *srcs], check=True)
    exports = FNS + ["set_table", "set_state", "get_state", "set_box", "get_box", "box_ptr"]
    subprocess.run([sys.executable, "-m", "ziglang", "cc", "--target=wasm32-freestanding", "-O2", "-w", *FLAGS, "-nostdlib",
                    "-Wl,--no-entry", *[f"-Wl,--export={e}" for e in exports], "-o", wasm, *srcs], check=True)
    return ctypes.CDLL(str(dylib)), wasm


class Gba:
    """The original machine code from the ROM image, run by Unicorn. IWRAM functions come from the referee's targets."""
    def __init__(self, rom):
        self.uc = Uc(UC_ARCH_ARM, UC_MODE_ARM)
        self.uc.mem_map(0x02000000, 0x40000)
        self.uc.mem_map(0x03000000, 0x8000)
        self.uc.mem_map(0x08000000, (len(rom) + 0xFFFF) & ~0xFFFF)
        self.uc.mem_write(0x08000000, rom)
        for f in FNS:
            if f.startswith("fn_03"):
                code = b"".join(struct.pack("<I", int(i["bytes"], 16)) for i in json.load(open(REPO / f"lab/out/target/{f}.json"))["items"])
                self.uc.mem_write(int(f[3:], 16), code)
        self.uc.mem_write(0x030064C4, struct.pack("<I", G))  # the game's pointer to its globals
        man = {x["id"]: x for x in json.load(open(REPO / "lab/out/manifest.json"))["functions"]}
        self.thumb = {f: man[f]["mode"] == "thumb" for f in FNS}

    def call(self, fn, *args):
        uc = self.uc
        for reg, a in zip((UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_R2), args):
            uc.reg_write(reg, a & M)
        uc.reg_write(UC_ARM_REG_SP, 0x03007F00)
        uc.reg_write(UC_ARM_REG_LR, RET)
        start = int(fn[3:], 16) | (1 if self.thumb[fn] else 0)
        uc.emu_start(start, RET, count=10_000)
        return uc.reg_read(UC_ARM_REG_R0)


def wasm_run(wasm, jobs):
    """Run the same jobs in Node's WebAssembly engine; returns outputs in the same order."""
    script = HERE / "run_wasm.mjs"
    out = subprocess.run(["node", script, str(wasm)], input=json.dumps(jobs), capture_output=True, text=True, check=True)
    return json.loads(out.stdout)


def main():
    rom = ROM.read_bytes()
    table = list(rom[0x2638C:0x2638C + 256])
    rnd = random.Random(2026_11_07)
    edges = [0, 1, -1, 2, -2, 0x7FFFFFFF, -0x80000000, 0x10000, -0x10000, 0xFFFF]
    two = [(a, b) for a in edges for b in edges] + [(s32(rnd.getrandbits(32)), s32(rnd.getrandbits(32))) for _ in range(N)]
    one = [(a,) for a in edges] + [(s32(rnd.getrandbits(32)),) for _ in range(N)]
    boxes = [[s32(rnd.getrandbits(32)) for _ in range(6)] for _ in range(N)]
    with tempfile.TemporaryDirectory() as t:
        lib, wasm = build(Path(t))
        gba = Gba(rom)
        for i, v in enumerate(table):
            lib.set_table(i, v)
        results = {}

        def record(fn, what, n, mism, example, secs):
            results[fn] = {"what": what, "inputs": n, "mismatches": mism, "first_mismatch": example,
                           "platforms": ["GBA machine code (Unicorn, ARM7TDMI ISA)", "arm64 macOS (clang -O2)", "wasm32 (zig cc -O2, Node)"],
                           "seconds": round(secs, 1)}
            print(f"{fn}: {n} inputs, {mism} mismatches ({what})", flush=True)

        for fn, arity, sig in [("fn_03002660", 2, two), ("fn_0800FDFC", 2, two), ("fn_03000D94", 1, one)]:
            t0 = time.time()
            cf = getattr(lib, fn); cf.restype = ctypes.c_int; cf.argtypes = [ctypes.c_int] * arity
            g = [s32(gba.call(fn, *a)) for a in sig]
            n = [cf(*a) for a in sig]
            w = wasm_run(wasm, {"fn": fn, "args": sig})
            bad = [(a, x, y, z) for a, x, y, z in zip(sig, g, n, w) if not (x == y == z)]
            record(fn, "pure function of its arguments", len(sig), len(bad), bad[0] if bad else None, time.time() - t0)

        t0 = time.time()  # bounding box update: memory in, memory out
        cf = lib.fn_0800549C; cf.argtypes = [ctypes.c_void_p, ctypes.c_int, ctypes.c_int]
        lib.box_ptr.restype = ctypes.c_void_p
        bp = lib.box_ptr()
        bad, gout, nout = [], [], []
        for b in boxes:
            gba.uc.mem_write(BOX, struct.pack("<4i", *b[:4]))
            gba.call("fn_0800549C", BOX, b[4], b[5])
            gb = list(struct.unpack("<4i", gba.uc.mem_read(BOX, 16)))
            for i in range(4): lib.set_box(i, b[i] & M)
            cf(bp, b[4], b[5])
            nb = [s32(lib.get_box(i)) for i in range(4)]
            gout.append(gb); nout.append(nb)
        w = wasm_run(wasm, {"fn": "fn_0800549C", "args": boxes})
        bad = [(b, x, y, z) for b, x, y, z in zip(boxes, gout, nout, w) if not (x == y == z)]
        record("fn_0800549C", "updates a 4-int box in memory", len(boxes), len(bad), bad[0] if bad else None, time.time() - t0)

        for fn, slot in [("fn_08006B00", 502), ("fn_08006B20", 501)]:  # RNGs: same start index, N draws in a row
            t0 = time.time()
            cf = getattr(lib, fn); cf.restype = ctypes.c_uint
            gs, ns = [], []
            for start in range(256):
                gba.uc.mem_write(G + 4 * slot, struct.pack("<I", start)); lib.set_state(slot, start)
                for _ in range(N // 256):
                    gs.append(gba.call(fn)); ns.append(cf())
            w = wasm_run(wasm, {"fn": fn, "slot": slot, "draws": N // 256, "table": table})
            bad = [i for i, (x, y, z) in enumerate(zip(gs, ns, w)) if not (x == y == z)]
            record(fn, f"random draws from the ROM's table, every start index, {N // 256} draws each", len(gs), len(bad),
                   bad[0] if bad else None, time.time() - t0)

    out = {"v": 1, "seed": 20261107, "host_flags": ["-O2", *FLAGS], "n": N, "rom_sha1_engine": __import__("hashlib").sha1(rom).hexdigest(), "functions": results,
           "all_identical": all(r["mismatches"] == 0 for r in results.values())}
    (HERE / ("results_fwrapv.json" if "-fwrapv" in FLAGS else "results.json")).write_text(json.dumps(out, indent=1) + "\n")
    print("ALL IDENTICAL" if out["all_identical"] else "MISMATCHES FOUND")


if __name__ == "__main__":
    main()
