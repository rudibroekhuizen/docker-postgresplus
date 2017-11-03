#/bin/bash

yes "sudo -u postgres psql -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &
yes "sudo -u postgres psql -t -f /scripts/pg_stat_archiver.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60
