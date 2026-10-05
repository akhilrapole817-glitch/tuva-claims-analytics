# Tuva Healthcare Claims Analytics

Running the open-source [Tuva Project](https://thetuvaproject.com) (Tuva Core v1.0.0), a dbt framework that turns raw
healthcare claims into a normalized core data model, data quality results, and analytic data marts, on DuckDB over
Tuva's synthetic Medicare-style claims Input Layer.

## Why
Healthcare claims arrive in dozens of payer-specific layouts. Tuva standardizes them into one Input Layer and builds a
shared core model (patients, claims, eligibility) plus marts such as chronic conditions, CMS-HCC risk scores, and quality
measures, so analysts and data scientists start from the same definitions.

## Run it
```bash
./scripts/run_tuva.sh          # clones tuva-core v1.0.0, installs dbt-duckdb, builds everything into tuva.duckdb
```

## Results (fill in from your run)
| Item | Value |
|---|---|
| Patients in `core.patient` | _TODO_ |
| Medical claim lines in `core.medical_claim` | _TODO_ |
| Schemas built | _TODO (from queries/explore.sql #1)_ |
| Data quality checks run / failed | _TODO_ |
| Build time on laptop | _TODO_ |

## How raw claims map to the Input Layer
_TODO: In your own words, explain the Input Layer tables (medical claims, pharmacy claims, eligibility), the key fields
(member ID, claim ID, claim line, service dates, diagnosis and procedure codes, paid amounts), and what you would change to
map a real payer feed into them._

## What I learned
_TODO: 3 to 5 bullets, e.g. what the data quality checks caught, how the chronic condition or CMS-HCC marts are derived._

Tuva Project is licensed by Tuva Health under its open-source license; see the tuva-core repository.
