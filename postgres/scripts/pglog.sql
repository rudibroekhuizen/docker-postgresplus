-- yes "psql -t -f pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60

SELECT row_to_json(t)
from (
SELECT * from pglog WHERE log_time > current_timestamp - interval '1 minutes'
) t;
