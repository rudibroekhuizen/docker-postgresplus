SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_archiver' as tag from pg_stat_archiver
) t;
