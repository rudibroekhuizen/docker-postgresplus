#!/bin/sh

# Logging postgres db
yes "psql postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}/postgres -t -f /usr/local/bin/analytics_pg.sql | jq -c . >> /tmp/analytics.json" | parallel --jobs 1 --delay 60 &

# Logging specified db
yes "psql postgresql://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}/${POSTGRES_DB} -t -f /usr/local/bin/analytics_db.sql | jq -c . >> /tmp/analytics.json" | parallel --jobs 1 --delay 60
