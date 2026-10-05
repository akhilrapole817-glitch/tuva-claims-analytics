#!/usr/bin/env bash
# Builds Tuva Core v1.0.0 on DuckDB over Tuva's synthetic claims Input Layer,
# with data quality results and the optional data marts.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [ ! -d tuva-core ]; then
  git clone --branch v1.0.0 https://github.com/tuva-health/tuva-core.git
fi

python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install dbt-duckdb

mkdir -p .dbt-profile
export DBT_PROFILES_DIR="$ROOT/.dbt-profile"
cat > "$DBT_PROFILES_DIR/profiles.yml" <<YAML
default:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: $ROOT/tuva.duckdb
      threads: 1
YAML

cd tuva-core
./scripts/dbt-local deps
# Synthetic Input Layer + Core, with data quality results enabled.
# Add  synthetic_data_size: large  to the vars for the larger dataset.
./scripts/dbt-local build --full-refresh \
  --vars '{claims_enabled: true, data_quality_enabled: true}'
echo "Done. Database: $ROOT/tuva.duckdb"
