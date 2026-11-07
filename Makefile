PY ?= $(shell [ -x .venv/bin/python ] && echo .venv/bin/python || echo python3)

.PHONY: help setup fixtures validate test sample-runs clock

help: ## list targets
	@grep -E '^[a-z-]+:.*##' $(MAKEFILE_LIST) | awk -F':.*## ' '{printf "  make %-12s %s\n", $$1, $$2}'

setup: ## create .venv with the root dev deps
	python3 -m venv .venv && .venv/bin/pip install -q -r requirements-dev.txt

fixtures: ## regenerate contracts/fixtures (deterministic)
	$(PY) contracts/make_fixtures.py

validate: ## validate fixtures, runs/*, lab/out/*.json against the schemas
	$(PY) contracts/validate.py

test: ## contract tests
	$(PY) -m pytest -q contracts/tests

sample-runs: ## copy sample runs into runs/fx01..fx03 and point runs/live at fx01 (for Stage/Creature dev)
	$(PY) contracts/make_fixtures.py --install-runs

clock: ## print the event schedule (hackclock)
	python3 tools/hackclock.py --plan

.PHONY: test-crew ci

test-crew: ## crew tests (offline: scripted model, mock referee; no keys, no network)
	$(PY) -m pytest -q crew/tests -m "not live"

ci: ## what GitHub Actions runs: deterministic fixtures, schemas, all offline tests (+ bench if arm-none-eabi-gcc is here)
	$(PY) contracts/make_fixtures.py
	git diff --exit-code contracts/fixtures
	$(PY) contracts/validate.py
	$(PY) -m pytest -q contracts/tests crew/tests -m "not live"
	@if command -v arm-none-eabi-gcc >/dev/null; then $(PY) -m pytest -q crew/bench; else echo "skip crew/bench: no arm-none-eabi-gcc"; fi

# ---- one product: tools/frank.py (see tools/README.md) ----
MODE ?= replay
RUN ?=
ARGS ?=

.PHONY: up down status preflight

up: ## start every lane in order (MODE=replay|live, RUN=crew/exports/<id>, ARGS=--yes-spend for live)
	@python3 tools/frank.py up --mode $(MODE) $(if $(RUN),--run $(RUN)) $(ARGS)

down: ## stop everything `make up` started
	@python3 tools/frank.py down

status: ## one board: every service's health plus the run on stage
	@python3 tools/frank.py status

preflight: ## the demo checklist: keys, referee, schemas, export, Stage build, ports, then the by-hand items
	@python3 tools/frank.py preflight
