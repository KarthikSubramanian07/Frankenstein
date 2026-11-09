"""Crew configuration: the one place that reads the environment (.env if present)."""
from __future__ import annotations

import os
from dataclasses import dataclass, field
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent

try:  # python-dotenv is optional; plain env vars always work
    from dotenv import load_dotenv

    load_dotenv(ROOT / ".env")
except ImportError:  # pragma: no cover
    pass

# USD per token. Muse Spark 1.3: $1.25 in / $4.25 out per 1M (contracts, section 16 of the kit).
PRICES = {"muse-spark-1.3": (1.25e-6, 4.25e-6)}
DEFAULT_PRICE = (1.25e-6, 4.25e-6)  # unknown models are priced like Spark; cost is labelled an estimate


def env(name: str, default: str = "") -> str:
    v = os.environ.get(name, "")
    v = v.split("#", 1)[0].strip()
    return v or default


@dataclass
class Config:
    api_key: str = field(default_factory=lambda: env("META_API_KEY"))
    base_url: str = field(default_factory=lambda: env("META_BASE_URL", "https://api.meta.ai/v1").rstrip("/"))
    model: str = field(default_factory=lambda: env("META_MODEL", "muse-spark-1.3"))
    escalation_model: str = field(default_factory=lambda: env("META_ESCALATION_MODEL", "muse-wonder-1.0"))
    reasoning_effort: str = field(default_factory=lambda: env("META_REASONING_EFFORT", "high"))
    referee_url: str = field(default_factory=lambda: env("REFEREE_URL", "http://127.0.0.1:7101"))
    mongodb_uri: str = field(default_factory=lambda: env("MONGODB_URI"))
    mongodb_db: str = field(default_factory=lambda: env("MONGODB_DB", "frankenstein"))
    subq_key: str = field(default_factory=lambda: env("SUBQ_API_KEY"))
    subq_url: str = field(default_factory=lambda: env("SUBQ_BASE_URL", "https://api.subq.ai/v1").rstrip("/"))
    subq_model: str = field(default_factory=lambda: env("SUBQ_MODEL", "subq-preview"))
    budget_usd: float = field(default_factory=lambda: float(env("RUN_BUDGET_USD", "40")))
    runs_dir: Path = ROOT / "runs"

    @property
    def lab_out(self) -> Path:
        return ROOT / "lab" / "out"

    @property
    def manifest_path(self) -> Path:
        override = env("FRANK_MANIFEST")  # e.g. crew/bench/out/manifest.json for the real-compiler bench
        if override:
            return (ROOT / override) if not Path(override).is_absolute() else Path(override)
        real = self.lab_out / "manifest.json"
        return real if real.exists() else ROOT / "contracts" / "fixtures" / "manifest.sample.json"

    @staticmethod
    def env_has(name: str) -> bool:
        return bool(env(name))

    def price(self, model: str) -> tuple[float, float]:
        return PRICES.get(model, DEFAULT_PRICE)
