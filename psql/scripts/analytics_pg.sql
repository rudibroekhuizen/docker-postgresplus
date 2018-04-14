-- Get pg_log lines
SELECT row_to_json(t)
from (
SELECT *, 'pg_log' as tag FROM pglog WHERE log_time > current_timestamp - interval '1 minutes'
) t;

SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_database' as tag FROM pg_stat_database
) t;

-- Show WAL archiver status
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_archiver' as tag FROM pg_stat_archiver
) t;

-- Show replication status from master server
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_replication' as tag FROM pg_stat_replication
) t;

-- Show replication status from standby server
SELECT row_to_json(t)
from (
SELECT *, 'pg_stat_wal_receiver' as tag FROM pg_stat_wal_receiver
) t;
