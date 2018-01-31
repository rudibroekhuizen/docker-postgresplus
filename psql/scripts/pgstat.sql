-- Show WAL archiver status
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_archiver' as tag from pg_stat_archiver
) t;

-- Show replication status from master server
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_replication' as tag from pg_stat_replication
) t;

-- Show replication status from standby server
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_wal_receiver' as tag from pg_stat_wal_receiver
) t;
