#/bin/bash
set -e

# Override settings
echo "include_dir = '/conf.d'" >> /pgdata/postgresql.conf

# Create pg_hba entry for replication
echo "host replication $REPLICATION_USER 0.0.0.0/0 trust" >> "$PGDATA/pg_hba.conf"

# Create replication user
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
     CREATE ROLE $REPLICATION_USER WITH REPLICATION PASSWORD '$REPLICATION_PASSWORD' LOGIN;
EOSQL
