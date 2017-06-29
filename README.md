# docker-postgresplus
PostgreSQL with Kibana dashboard

1. Run pgbench
2. Import dashboard

### Pgbench

psql> CREATE DATABASE pgbenchdb;

pgbench> pgbench -i -s 50 pgbenchdb

pgbench> pgbench -c 10 -j 2 -t 1000 pgbenchdb


### Remove everything (including volumes)
docker-compose down -v --remove-orphans --rmi all
