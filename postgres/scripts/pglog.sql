SELECT row_to_json(t)
from (
SELECT * from pglog WHERE log_time > current_timestamp - interval '1 minutes'
) t;
