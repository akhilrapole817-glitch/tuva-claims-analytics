-- Run with:  python -c "import duckdb; c=duckdb.connect('tuva.duckdb'); print(c.sql(open('queries/explore.sql').read().split(';')[0]))"
-- 1. Which schemas did the build create?
select schema_name from information_schema.schemata order by 1;

-- 2. Size of the core model
select (select count(*) from core.patient) as patients,
       (select count(*) from core.medical_claim) as medical_claim_lines;

-- 3. List every table in each output schema (use this to find the mart tables)
select table_schema, table_name
from information_schema.tables
where table_schema not in ('information_schema', 'main', 'pg_catalog')
order by 1, 2;
