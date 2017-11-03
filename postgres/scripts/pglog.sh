#/bin/bash

yes "sudo -u postgres psql -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60
