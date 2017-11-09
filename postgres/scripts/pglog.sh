#/bin/bash

# Logging local
yes "sudo -u postgres psql -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &

# Logging remote
yes "sudo -u postgres psql -h primary -U replicator -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &
yes "sudo -u postgres psql -h secondary -U replicator -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &




# Stats local
yes "sudo -u postgres psql -t -f /scripts/pgstat.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &

# Stats remote
yes "sudo -u postgres psql -h primary -U replicator -t -f /scripts/pgstat.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60
yes "sudo -u postgres psql -h secondary -U replicator -t -f /scripts/pgstat.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60
