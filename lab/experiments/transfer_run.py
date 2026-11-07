"""Cross-game transfer, step 2: run the crew, unmodified, on Voxelburg for one arm, then copy the run out.

    python3 lab/experiments/transfer_run.py cold 1
    python3 lab/experiments/transfer_run.py warm 1

Loads .env into the environment (crew.config needs python-dotenv for that, which is not installed here), never
printing it. MONGODB_URI is blanked so both arms use crew's local-JSON backend and nothing touches Atlas.
The crew writes runs/transfer_<arm>_<rep>/ (its runs_dir is fixed); this copies it to lab/exports/transfer/<arm>/r<rep>/.
"""
import os
import shutil
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[2]
OUT = REPO / "lab/exports/transfer"
REFEREE = "http://127.0.0.1:7102"
MANIFEST = "lab/out/games/voxelburg/manifest.json"
# identical for both arms; Snap and Gemini off so the only difference is the library + case memory
COMMON = ["--diggers", "6", "--max-usd-per-fn", "0.5", "--budget-usd", "5", "--no-snap", "--no-gemini",
          "--no-rebuild", "--names"]


def load_env() -> None:
    for line in (REPO / ".env").read_text().splitlines():
        if "=" in line and not line.lstrip().startswith("#"):
            k, v = line.split("=", 1)
            os.environ.setdefault(k.strip(), v.strip().strip('"').strip("'"))
    os.environ["MONGODB_URI"] = ""
    if "SSL_CERT_FILE" not in os.environ:  # python.org macOS builds ship without a CA bundle
        import certifi
        os.environ["SSL_CERT_FILE"] = certifi.where()
    os.environ["REFEREE_URL"] = REFEREE
    os.environ["FRANK_MANIFEST"] = MANIFEST


def main(arm: str, rep: str) -> int:
    assert arm in ("cold", "warm")
    load_env()
    sys.path.insert(0, str(REPO))
    os.chdir(REPO)
    from crew.run import main as crew_main  # import after env is set

    run_id = f"transfer_{arm}_{rep}"
    lib = OUT / arm / "library" / "idioms.json"
    lib.parent.mkdir(parents=True, exist_ok=True)
    fns = (OUT / "fns.txt").read_text().strip()
    argv = ["--fns", fns, "--run-id", run_id, "--library", "off" if arm == "cold" else "on",
            "--library-path", str(lib), "--label", f"voxelburg transfer · {arm} · r{rep}", *COMMON]
    rc = crew_main(argv)
    dest = OUT / arm / f"r{rep}"
    shutil.rmtree(dest, ignore_errors=True)
    shutil.copytree(REPO / "runs" / run_id, dest)
    return rc


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:3]))
