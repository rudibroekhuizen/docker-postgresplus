SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_archiver' as tag from pg_stat_archiver
) t;

SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_replication' as tag from pg_stat_replication
) t;

-- Check the replication status from standby server
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_wal_receiver' as tag from pg_stat_wal_receiver
) t;

