-- Table-specific stats
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_all_tables' as tag FROM pg_stat_all_tables
) t;
