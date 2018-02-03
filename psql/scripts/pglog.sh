#!/bin/sh

# Logging local
#yes "sudo -u postgres psql -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 & 
yes "psql postgresql://analytics:postgres@postgres/postgres -t -f /usr/local/bin/analytics.sql | jq -c . >> /tmp/analytics.json" | parallel --jobs 1 --delay 60

# Logging remote
#yes "psql postgresql://analytics:postgres@primary/postgres -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &
#yes "psql postgresql://analytics:postgres@secondary/postgres -t -f /scripts/pglog.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &



# Stats local
#yes "sudo -u postgres psql -t -f /scripts/pgstat.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &

# Stats remote
#yes "psql postgresql://analytics:postgres@primary/postgres -t -f /scripts/pgstat.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &
#yes "psql postgresql://analytics:postgres@secondary/postgres -t -f /scripts/pgstat.sql | jq -c . >> /tmp/pglog.json" | parallel --jobs 1 --delay 60 &


#sleep 1000
