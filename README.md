# docker-postgresplus


## Overview
PostgreSQL playground running on Docker with logs presented in Kibana dashboard and Pgadmin webinterface.

## Setup
Install Docker. Clone this repo to your local machine. Run docker-compose: 

     docker-compose up

## Import dashboard
To make sure all fields exist prior to importing the Kibana dashboard, run pgbench first.

1. Run pgbench
2. Import dashboard

### Pgbench

psql> CREATE DATABASE pgbenchdb;

pgbench> pgbench -i -s 50 pgbenchdb

pgbench> pgbench -c 10 -j 2 -t 1000 pgbenchdb


### Remove everything (including volumes)
     docker-compose down -v --remove-orphans --rmi all
