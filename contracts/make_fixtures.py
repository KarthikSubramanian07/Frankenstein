#!/usr/bin/env python3
"""Write every contract fixture into contracts/fixtures/. Stdlib only, seeded, deterministic.

    python3 contracts/make_fixtures.py                 # (re)write fixtures
    python3 contracts/make_fixtures.py --install-runs  # also copy sample runs into runs/fx*/ and point runs/live at fx01

Every file is marked as fixture data ("fixture": true, or a first JSONL line {"type":"fixture"}),
so nothing fake can be mistaken for a real run. All numbers here are SAMPLE DATA.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import random
import shutil
from datetime import datetime, timedelta, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
FIX = ROOT / "contracts" / "fixtures"
SEED = 1818  # Frankenstein, 1818 edition
MODEL = "muse-spark-1.3"
PRICE_IN, PRICE_OUT = 1.25 / 1e6, 4.25 / 1e6
T0 = datetime(2026, 11, 7, 19, 30, 0, tzinfo=timezone.utc)
RUN_SECONDS = 20 * 60
N_DIGGERS = 6

SUBSYSTEMS = [  # id, label, game function count, screen region in GBA pixels (240x160)
    ("hud", "Doomguy's face and the status bar", 14, {"x": 0, "y": 128, "w": 240, "h": 32}),
    ("weapons", "the shotgun", 16, {"x": 60, "y": 64, "w": 120, "h": 64}),
    ("enemies", "the imps", 22, {"x": 0, "y": 0, "w": 240, "h": 128}),
    ("world", "the renderer", 32, {"x": 0, "y": 0, "w": 240, "h": 128}),
]
N_LIBRARY = 12
FAKE_SHA = lambda s: hashlib.sha1(f"frankenstein-fixture:{s}".encode()).hexdigest()  # noqa: E731
ORIGINAL_SHA1 = FAKE_SHA("original-rom")
PATCHED_SHA1 = FAKE_SHA("patched-rom")


def iso(t: datetime) -> str:
    return t.strftime("%Y-%m-%dT%H:%M:%S.") + f"{t.microsecond // 1000:03d}Z"


def dump(path: Path, data) -> None:
    path.write_text(json.dumps(data, indent=2) + "\n")


# ---------------------------------------------------------------- manifest + viz map
def build_manifest(rng: random.Random):
    fns, addr = [], 0x08000200
    owners = []  # (scope, subsystem)
    for _ in range(N_LIBRARY // 2):
        owners.append(("library", None))
    for sid, _, n, _ in SUBSYSTEMS:
        owners += [("game", sid)] * n
    owners += [("library", None)] * (N_LIBRARY - N_LIBRARY // 2)
    for scope, sub in owners:
        size = rng.choice([12, 16, 20, 24, 28, 32, 40, 48, 56, 64, 84, 96, 120, 160, 212, 280])
        fid = f"fn_{addr:08X}"
        fns.append({"id": fid, "addr": f"0x{addr:08X}", "size": size, "mode": "thumb",
                    "scope": scope, "split": "train", "asm_path": f"lab/out/asm/{fid}.s",
                    "callees": [], "callers": [], "difficulty": 0.0, "_sub": sub})
        addr += size + (4 if size % 4 else 0) + rng.choice([0, 4])
    # call graph: each function may call up to 3 earlier functions (no cycles)
    for i, f in enumerate(fns):
        if i == 0:
            continue
        for j in sorted(rng.sample(range(i), k=min(i, rng.choice([0, 1, 1, 2, 3])))):
            f["callees"].append(fns[j]["id"])
            fns[j]["callers"].append(f["id"])
    for f in fns:
        branches = f["size"] // rng.choice([10, 14, 20])
        f["difficulty"] = round(min(1.0, f["size"] / 300 * 0.6 + branches / 30 * 0.3 + len(f["callees"]) * 0.03), 2)
    # ~30% heldout, stratified by size: sort game fns by size, take every 3rd-ish with a seeded offset
    game = sorted((f for f in fns if f["scope"] == "game"), key=lambda f: (f["size"], f["addr"]))
    for k, f in enumerate(game):
        if k % 13 in (1, 4, 8, 11):  # 4 of every 13 = 30.8%
            f["split"] = "heldout"
    viz = {"v": 1, "fixture": True, "subsystems": [
        {"id": sid, "label": label, "region": region,
         "functions": [f["id"] for f in fns if f["_sub"] == sid]}
        for sid, label, _, region in SUBSYSTEMS]}
    sub_of = {f["id"]: f["_sub"] for f in fns}
    for f in fns:
        del f["_sub"]
    manifest = {"v": 1, "fixture": True, "game": {
        "id": "doom", "title": "GBADoom (prBoom, Doom shareware)",
        "license": "GPL-2.0-or-later; see DECISIONS.md", "rom_path": "lab/out/target.gba",
        "rom_sha1": ORIGINAL_SHA1,
        "compiler": {"name": "devkitARM GCC", "version": "devkitARM rNN (gcc X.Y.Z) [sample: Lane A pins the real one]",
                     "flags": "-O3 -mthumb -mthumb-interwork -mcpu=arm7tdmi -mtune=arm7tdmi -std=gnu23 (upstream flags minus -flto=8)"}},
        "functions": fns}
    return manifest, viz, sub_of


# ---------------------------------------------------------------- the sample run
CLAIM_LINES = ["Matched it. Pretty sure.", "Got it. Pretty sure.", "That's the one. Ship it.",
               "Byte-perfect, I think.", "Nailed it. Probably."]
IDIOMS = [
    ("Signed divide by power of two", "asr after adding the sign bit (lsr #31)", "write x / 4 on an int, not x >> 2"),
    ("Struct field via base + small offset", "ldr rN, [rM, #imm] with imm < 128", "use p->field, not *(int*)((char*)p+off)"),
    ("Early return becomes a forward branch", "cmp then bxx to the epilogue", "write if (!x) return; first"),
    ("Loop counts down to zero", "subs rN, #1 then bne", "for (i = n; i != 0; i--)"),
    ("Boolean returned as 0/1", "movs r0, #0 ... movs r0, #1", "return a == b; not a ternary"),
    ("Fixed-point multiply", "muls then asrs #16", "FixedMul style: (a * b) >> FRACBITS"),
    ("Switch becomes a jump table", "lsls #2 then ldr pc via table", "dense case labels starting at 0"),
    ("Short in a register is sign-extended", "lsls #16 / asrs #16 pair", "declare the local as short"),
    ("Pointer post-increment in a copy loop", "ldrb/strb then adds #1", "*dst++ = *src++"),
    ("Global accessed through literal pool", "ldr rN, =data_ then ldr", "plain global read, no local cache"),
    ("Bitfield test with a mask", "movs #mask; tst", "if (flags & MF_SHOOTABLE)"),
    ("Unsigned compare picks bhi/bls", "cmp then bhi", "declare the counter unsigned"),
]
TICKER = [
    "Another claim, another lie. Byte {off} disagrees.", "Digger {d} found a loop. It loves loops.",
    "That one took {a} tries. Patience is a virtue.", "Recovered: {fn}. The compiler agrees.",
    "A register swap. The oldest trick in the book.", "Library hit. Somebody learned something.",
    "The status bar flickers back to life.", "Small function, big ego. Matched first try.",
    "The referee does not do partial credit.", "Literal pools: where good intentions go to die.",
]
def src_preview(fid: str, rng: random.Random) -> str:
    v = rng.choice(["a", "p", "x"])
    return "\n".join([
        f"/* {fid}: sample candidate (fixture) */",
        f"int {fid}(int {v}, int b)",
        "{",
        f"    if ({v} <= 0)",
        "        return 0;",
        f"    return ({v} * b) >> 16;",
        "}",
    ])


def build_run(manifest, sub_of, rng: random.Random):
    run_id = "r_fx01"
    game = [f for f in manifest["functions"] if f["scope"] == "game"]  # the live demo run covers every game function
    game.sort(key=lambda f: (len(f["callees"]), f["difficulty"]))  # leaves and easy first
    total_game = sum(1 for f in manifest["functions"] if f["scope"] == "game")
    ev = []  # (t_seconds, writer_order, record)
    order = [0]

    def emit(t, typ, actor, fn=None, **payload):
        order[0] += 1
        if typ == "patch.verified":
            payload = {"fn": fn, **payload}
        ev.append((t, order[0], {"v": 1, "ts": None, "run_id": run_id, "seq": 0, "type": typ,
                                 "actor": actor, "fn": fn, "payload": payload}))

    emit(0.0, "run.started", "scheduler", label="live · library learning (sample)", split="train",
         library="learning", diggers=N_DIGGERS, model=MODEL, budget_usd=40, game_id="doom", fn_total=len(game))
    emit(1.5, "snap.decision", "scheduler", op="triage", functions=len(game), latency_ms=1062,
         hardest=[f["id"] for f in sorted(game, key=lambda f: -f["difficulty"])[:5]])
    emit(2.0, "narration", "archivist", text="Twenty minutes. Six diggers. One referee.", mood="dry",
         speak=False, priority=1)

    # plan outcomes so counts land exactly where the contract says
    n = len(game)
    outcomes = ["matched"] * 60 + ["abandoned"] * 4
    outcomes += ["unfinished"] * (n - len(outcomes))
    false_claim_fns = set(rng.sample(range(60), 9))
    lint_fns = set(rng.sample(sorted(set(range(60)) - false_claim_fns), 3))

    digger_free = [3.0 + i * 1.5 for i in range(N_DIGGERS)]
    speed = 1.7  # seconds-per-attempt scale, tuned so ~60 matches land inside 20 minutes
    matched_ts, idioms_ids, cost_total, attempts_total = [], [], 0.0, 0
    stats = {"false": 0, "fake": 0, "calls": 0, "tin": 0, "tout": 0}
    idiom_n = 0
    for k, f in enumerate(game):
        d = min(range(N_DIGGERS), key=lambda i: digger_free[i])
        t = digger_free[d]
        if t > RUN_SECONDS - 40 or outcomes[k] == "unfinished":
            continue
        dg = f"digger-{d + 1}"
        fid = f["id"]
        emit(t, "fn.claimed", "scheduler", fn=fid, digger=dg, difficulty=f["difficulty"])
        n_att = 1 + int(f["difficulty"] * 5) + rng.choice([0, 0, 1])
        if outcomes[k] == "abandoned":
            n_att = 8
        if k in false_claim_fns or k in lint_fns:
            n_att = max(n_att, 3)
        best, fn_cost = 0.0, 0.0
        for a in range(1, n_att + 1):
            t += rng.uniform(6, 14) * speed
            tin, tout = rng.randint(2500, 6000), rng.randint(300, 1100)
            c = round(tin * PRICE_IN + tout * PRICE_OUT, 5)
            fn_cost += c
            stats["calls"] += 1 + rng.randint(1, 3)
            stats["tin"] += tin
            stats["tout"] += tout
            attempts_total += 1
            emit(t, "attempt.submitted", dg, fn=fid, attempt=a, tokens_in=tin, tokens_out=tout, cost_usd=c,
                 src_preview=src_preview(fid, rng))
            last = a == n_att
            if last and outcomes[k] == "matched":
                status, pct = "MATCH", 100.0
            elif k in lint_fns and a == 1:
                status, pct = "LINT_FAIL", 0.0
            else:
                status = "PARTIAL" if rng.random() > 0.08 else "NO_COMPILE"
                pct = round(rng.uniform(40, 97), 1) if status == "PARTIAL" else 0.0
            best = max(best, pct)
            claim = None
            if k in false_claim_fns and a == max(1, n_att - 1) and not last:
                status, pct = "PARTIAL", round(rng.uniform(85, 98), 1)
                best = max(best, pct)
                claim = False
            elif last and outcomes[k] == "matched":
                claim = True
            if claim is not None:
                t += 0.4
                emit(t, "claim.made", dg, fn=fid, attempt=a, text=rng.choice(CLAIM_LINES))
            t += rng.uniform(0.8, 2.2)
            fd = None
            if status == "PARTIAL":
                off = rng.choice([2, 6, 10, 14, 18, 22])
                fd = {"offset": off, "expected": "1c08", "got": "1c10",
                      "expected_ins": "adds r0, r1, #0", "got_ins": "adds r0, r2, #0"}
            emit(t, "verdict", "checker", fn=fid, attempt=a, status=status, match_pct=pct, first_diff=fd,
                 lint_ok=status != "LINT_FAIL", claim_was_true=claim)
            if status != "MATCH" and a >= 2 and not last:
                emit(t + 0.3, "snap.decision", "scheduler", fn=fid, op="decide_next",
                     action="escalate" if a >= 3 else "keep", confidence=round(rng.uniform(0.55, 0.9), 3),
                     probs={"keep": 0.6, "escalate": 0.35, "abandon": 0.05},
                     p_match_within_budget=round(rng.uniform(0.2, 0.8), 2), latency_ms=rng.randint(450, 900),
                     attempt=a)
            if claim is False:
                stats["false"] += 1
                emit(t + 0.5, "narration", "archivist", text=f"Claim rejected!", mood="alarmed", speak=True, priority=3)
                emit(t + 1.0, "narration", "archivist",
                     text=TICKER[0].format(off=fd["offset"]), mood="alarmed", speak=False, priority=1)
        cost_total += fn_cost
        if outcomes[k] == "matched":
            t += 0.6
            lines = rng.randint(6, 40)
            emit(t, "fn.matched", "checker", fn=fid, attempts=n_att, minutes=round((t - digger_free[d]) / 60, 2),
                 cost_usd=round(fn_cost, 4), src_path=f"runs/{run_id}/recovered/{fid}.c", lines=lines)
            matched_ts.append(t)
            m = len(matched_ts)
            for pct_mark, line in ((0.25, "Quarter recovered!"), (0.5, "Halfway recovered!"), (0.75, "Three quarters!")):
                if m == int(len(game) * pct_mark):
                    emit(t + 0.3, "narration", "archivist", text=line, mood="proud", speak=True, priority=3)
            if m % 5 == 0 and idiom_n < len(IDIOMS):
                title, when, do = IDIOMS[idiom_n]
                iid = f"idm_{idiom_n + 1:03d}"
                idioms_ids.append(iid)
                idiom_n += 1
                emit(t + 1.2, "idiom.learned", "distiller", fn=fid, idiom_id=iid, title=title, applies_when=when, do=do)
                if idiom_n in (4, 8):
                    emit(t + 1.6, "idiom.judged", "distiller", fn=fid, idiom_id=f"idm_{idiom_n - 2:03d}",
                         status="adopted" if idiom_n == 4 else "retired", tries=4, wins=3 if idiom_n == 4 else 1,
                         rate=0.75 if idiom_n == 4 else 0.25, baseline=0.6, title=IDIOMS[idiom_n - 3][0])
            if idioms_ids and rng.random() < 0.5:
                emit(digger_free[d] + 0.2, "idiom.used", dg, fn=fid, idiom_id=rng.choice(idioms_ids))
            if rng.random() < 0.35:
                emit(t + 2.0, "narration", "archivist",
                     text=rng.choice(TICKER[1:]).format(d=d + 1, a=n_att, fn=fid), mood="dry",
                     speak=False, priority=1)
        else:
            emit(t + 0.5, "fn.abandoned", dg, fn=fid, attempts=n_att, best_pct=best)
        digger_free[d] = t + rng.uniform(1, 4)

    # periodic and one-off events
    emit(600.0, "types.proposed", "cartographer", source="subq", structs=7, signatures=31)
    emit(605.0, "permute.result", "digger-2", fn=game[4]["id"], attempt=3, checks=212, from_pct=81.8, to_pct=93.9,
         matched=False, seconds=45.1, improved=True, from_exact=84.8, to_exact=93.9,
         passes={"reorder_stmts": 2, "commute": 1})
    emit(611.0, "fakematch.rejected", "checker", fn=game[3]["id"], attempt=2,
         reason="volatile used to coax codegen", evidence={"snap": {"fakematch_p": 0.91}},
         src_preview="int fn(int *p){ volatile int t = p[4]; return t; }")
    rebuild_at = sorted(matched_ts)[-1] + 8
    rec = len(matched_ts)
    swaps = [(sorted(matched_ts)[i] + 5, i + 1) for i in range(9, rec, 12)]
    for ts_, recovered_ in swaps:
        emit(ts_, "rom.swapped", "creature", rom_sha1=ORIGINAL_SHA1, pct_agent_code=round(recovered_ / total_game * 100 * 0.9, 1))
    emit(rebuild_at, "build.rom", "lab", rom_sha1=ORIGINAL_SHA1, identical=True, recovered=rec,
         from_original=total_game - rec, pct_agent_code=round(rec / total_game * 100 * 0.9, 1),
         rom_path="lab/out/rebuilt.gba")
    hud_fn = next(f["id"] for f in manifest["functions"] if sub_of[f["id"]] == "hud")
    emit(rebuild_at + 6, "patch.verified", "creature", fn=hud_fn, changed_functions=[hud_fn], rom_sha1=PATCHED_SHA1)
    emit(rebuild_at + 9, "phone.published", "creature", url="https://example-fixture.trycloudflare.com/",
         qr_png="creature/phone/qr.png")
    emit(rebuild_at + 10, "narration", "archivist", text="It's alive.", mood="hushed", speak=True, priority=3)

    # fill narration up to ~40 lines with grounded-sounding ticker lines
    n_narr = sum(1 for e in ev if e[2]["type"] == "narration")
    for i in range(max(0, 40 - n_narr)):
        tt = 30 + i * (RUN_SECONDS - 60) / max(1, 40 - n_narr)
        emit(tt, "narration", "archivist", text=TICKER[4 + i % 6], mood="dry", speak=False, priority=0)

    # metric ticks every 5 s, derived from the events emitted so far
    ev.sort(key=lambda e: (e[0], e[1]))
    end = max(e[0] for e in ev) + 5
    ticks, m, att, fc, cost, idx = [], 0, 0, 0, 0.0, 0
    for s in range(5, int(end) + 1, 5):
        while idx < len(ev) and ev[idx][0] <= s:
            r = ev[idx][2]
            m += r["type"] == "fn.matched"
            att += r["type"] == "fn.claimed"
            fc += r["type"] == "verdict" and r["payload"]["claim_was_true"] is False
            cost += r["payload"].get("cost_usd", 0) if r["type"] == "attempt.submitted" else 0
            idx += 1
        ticks.append((float(s), 10**9 + s, {"v": 1, "ts": None, "run_id": run_id, "seq": 0, "type": "metric.tick",
                                           "actor": "scheduler", "fn": None, "payload": {
            "pct_recovered": round(m / len(game) * 100, 1), "matched": m, "attempted": att,
            "false_claims": fc, "cost_usd": round(cost, 4), "elapsed_s": float(s)}}))
    abandoned = sum(1 for e in ev if e[2]["type"] == "fn.abandoned")
    ev += ticks
    ev.append((end + 0.5, 10**10, {"v": 1, "ts": None, "run_id": run_id, "seq": 0, "type": "run.finished",
                                   "actor": "scheduler", "fn": None, "payload": {
        "matched": rec, "abandoned": abandoned, "pct_recovered": round(rec / len(game) * 100, 1),
        "cost_usd": round(cost_total, 4), "elapsed_s": round(end + 0.5, 1)}}))
    ev.sort(key=lambda e: (e[0], e[1]))
    lines = []
    for i, (t, _, r) in enumerate(ev, start=1):
        r["ts"] = iso(T0 + timedelta(seconds=t))
        r["seq"] = i
        lines.append(r)

    curve = [{"t_min": 0, "matched": 0}]
    for mm in range(1, int(end // 60) + 2):
        curve.append({"t_min": mm, "matched": sum(1 for x in matched_ts if x <= mm * 60)})
    metrics = {
        "v": 1, "run_id": run_id, "label": "live · library learning (sample)", "split": "train",
        "library": "learning", "model": MODEL, "reasoning_effort": "high", "fn_total": len(game),
        "matched": rec, "match_rate": round(rec / len(game), 3),
        "attempts_per_match": round(attempts_total / rec, 2),
        "minutes_per_match": round(RUN_SECONDS / 60 / rec * N_DIGGERS, 2),
        "cost_per_match_usd": round(cost_total / rec, 4), "false_claims_caught": stats["false"],
        "fakematches_rejected": 2, "cost_usd": round(cost_total, 4), "curve": curve,
        "muse": {"calls": stats["calls"], "tool_calls": stats["calls"] * 3, "image_calls": 0,
                 "tokens_in": stats["tin"], "tokens_out": stats["tout"], "reasoning_effort": "high",
                 "cost_usd": round(cost_total, 4)},
    }
    return run_id, lines, metrics


def heldout_metrics(run_id, library, matched, fn_total, rng):
    cost = round(matched * rng.uniform(0.3, 0.5) + (fn_total - matched) * 0.6, 2)
    curve, acc = [{"t_min": 0, "matched": 0}], 0
    for mm in range(1, 16):
        acc = min(matched, acc + rng.choice([0, 1, 1, 2]))
        curve.append({"t_min": mm, "matched": acc})
    curve[-1]["matched"] = matched
    return {"v": 1, "run_id": run_id, "label": f"heldout · library {library} (sample)", "split": "heldout",
            "library": library, "model": MODEL, "reasoning_effort": "high", "fn_total": fn_total,
            "matched": matched, "match_rate": round(matched / fn_total, 3),
            "attempts_per_match": round(rng.uniform(2.5, 4.5), 2), "minutes_per_match": round(rng.uniform(1.5, 3), 2),
            "cost_per_match_usd": round(cost / matched, 4), "false_claims_caught": rng.randint(3, 8),
            "fakematches_rejected": rng.randint(0, 2), "cost_usd": cost, "curve": curve,
            "muse": {"calls": matched * 9, "tool_calls": matched * 27, "image_calls": 0, "tokens_in": matched * 41000,
                     "tokens_out": matched * 6200, "reasoning_effort": "high", "cost_usd": cost}}


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--install-runs", action="store_true", help="copy sample runs into runs/fx*/ and link runs/live")
    ap.add_argument("--out", type=Path, default=FIX)
    args = ap.parse_args()
    rng = random.Random(SEED)
    out = args.out
    out.mkdir(parents=True, exist_ok=True)

    manifest, viz, sub_of = build_manifest(rng)
    run_id, events, m01 = build_run(manifest, sub_of, rng)
    heldout_n = sum(1 for f in manifest["functions"] if f["scope"] == "game" and f["split"] == "heldout")
    m02 = heldout_metrics("r_fx02", "on", round(heldout_n * 0.65), heldout_n, rng)
    m03 = heldout_metrics("r_fx03", "off", round(heldout_n * 0.42), heldout_n, rng)
    matched_ids = [e["fn"] for e in events if e["type"] == "fn.matched"]
    first = manifest["functions"][N_LIBRARY // 2]["id"]

    dump(out / "manifest.sample.json", manifest)
    dump(out / "viz_map.sample.json", viz)
    base_ref = {"v": 1, "fixture": True, "fn": first, "lint": {"ok": True, "violations": []},
                "compile": {"ok": True, "log": ""}, "elapsed_ms": 412, "referee": "lab@fixture"}
    dump(out / "referee_result.match.json", {**base_ref, "status": "MATCH", "match_pct": 100.0, "first_diff": None, "diff": []})
    fd = {"offset": 14, "expected": "1c08", "got": "1c10", "expected_ins": "adds r0, r1, #0", "got_ins": "adds r0, r2, #0"}
    dump(out / "referee_result.partial.json", {**base_ref, "status": "PARTIAL", "match_pct": 92.9, "first_diff": fd,
                                               "diff": [fd], "elapsed_ms": 388})
    dump(out / "referee_result.lint_fail.json", {**base_ref, "status": "LINT_FAIL", "match_pct": 0.0, "first_diff": None,
         "diff": [], "lint": {"ok": False, "violations": [{"rule": "L001", "reason": "inline assembly is not allowed"}]},
         "compile": {"ok": False, "log": "not compiled: lint failed"}, "elapsed_ms": 3})
    total_game = sum(1 for f in manifest["functions"] if f["scope"] == "game")
    dump(out / "rebuild_result.sample.json", {"v": 1, "fixture": True, "rom_sha1": ORIGINAL_SHA1, "original_sha1": ORIGINAL_SHA1,
         "identical": True, "recovered": len(matched_ids), "from_original": total_game - len(matched_ids), "method": "source-tree"})
    dump(out / "patch_result.sample.json", {"v": 1, "fixture": True, "rom_path": "lab/out/patched.gba", "rom_sha1": PATCHED_SHA1,
         "changed_functions": [next(f for f in manifest["functions"] if sub_of[f["id"]] == "hud")["id"]],
         "unchanged": len(manifest["functions"]) - 1})
    dump(out / "memory_probe.sample.json", {"v": 1, "fixture": True, "model": MODEL, "fn_count": 20,
         "method": "model asked to write 20 public Doom functions from memory by their original names; "
                   "the same sources compiled against (a) unmodified GBADoom and (b) our private variant",
         "unmodified": {"matched": 6, "match_rate": 0.3, "best_pct": 100.0},
         "variant": {"matched": 0, "match_rate": 0.0, "best_pct": 41.5}})
    with (out / "events.sample.jsonl").open("w") as fh:
        fh.write(json.dumps({"type": "fixture"}) + "\n")
        for e in events:
            fh.write(json.dumps(e, separators=(",", ":")) + "\n")
    dump(out / "metrics.sample.json", {"fixture": True, "runs": [m01, m02, m03]})
    names = {"v": 1, "fixture": True, "run_id": run_id, "names": [
        {"fn": fid, "name": nm, "inferred": True, "basis": "recovered code (sample)"}
        for fid, nm in zip(matched_ids, [
            "status_face_update", "status_face_pain_offset", "ammo_counter_draw", "health_digits_draw",
            "armor_digits_draw", "keycard_icons_draw", "status_bar_refresh", "weapon_raise", "weapon_lower",
            "shotgun_fire", "pistol_fire", "weapon_bob", "muzzle_flash_set", "ammo_check", "imp_chase",
            "imp_fireball", "monster_look", "monster_face_target", "monster_pain", "monster_die",
            "random_byte", "fixed_mul", "fixed_div", "angle_to_point", "column_draw", "span_draw",
            "sector_light_level", "texture_lookup", "clip_wall_segment", "sprite_sort", "seg_render",
            "plane_draw", "visplane_find", "bsp_node_walk", "subsector_render", "blockmap_iter",
            "line_side_test", "thing_spawn", "thing_remove", "sound_start"])]}
    dump(out / "names.sample.json", names)
    dump(out / "sprite_frame.sample.json", {"v": 1, "fixture": True, "frame": 18231, "sprites": [
        {"i": 0, "x": 104, "y": 72, "w": 16, "h": 16, "tile": 32, "pal": 1, "subsystem": "weapons"},
        {"i": 1, "x": 40, "y": 30, "w": 32, "h": 32, "tile": 96, "pal": 3, "subsystem": "enemies"}],
        "heal": {"hud": 0.83, "weapons": 0.41, "enemies": 0.2, "world": 0.05}})
    dump(out / "crew_job.sample.json", {"fixture": True, "job_id": "j_17", "run_id": "r_asi_01", "fn": first,
         "status": "matched", "attempts": 3, "best_pct": 100.0, "cost_usd": 0.31,
         "src_path": f"runs/r_asi_01/recovered/{first}.c", "false_claims": 1})
    dump(out / "crew_status.sample.json", {"fixture": True, "live_run_id": run_id,
         "pct_recovered": m01["match_rate"] * 100, "matched": m01["matched"], "fn_total": m01["fn_total"],
         "false_claims": m01["false_claims_caught"], "last_build": {"rom_sha1": ORIGINAL_SHA1, "identical": True}})
    print(f"fixtures -> {out.relative_to(ROOT) if out.is_relative_to(ROOT) else out}: "
          f"{len(events)} events, {m01['matched']} matched, {m01['false_claims_caught']} false claims")

    if args.install_runs:
        runs = ROOT / "runs"
        for m in (m01, m02, m03):
            d = runs / m["run_id"].replace("r_", "")
            d.mkdir(parents=True, exist_ok=True)
            dump(d / "metrics.json", {**m, "fixture": True})
        shutil.copy(out / "events.sample.jsonl", runs / "fx01" / "events.jsonl")
        shutil.copy(out / "names.sample.json", runs / "fx01" / "names.json")
        live = runs / "live"
        if not live.exists() and not live.is_symlink():
            os.symlink("fx01", live)
        print("installed sample runs: runs/fx01 (events, metrics, names), runs/fx02, runs/fx03; runs/live -> fx01 if unset")


if __name__ == "__main__":
    main()
