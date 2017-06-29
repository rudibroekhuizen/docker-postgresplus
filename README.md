# docker-postgresplus


## Overview
PostgreSQL playground running on Docker with logs presented in Kibana dashboard and Pgadmin webinterface.

## Setup
Install Docker. Clone this repo to your local machine. Run docker-compose: 

     docker-compose up


To make sure all fields exist prior to importing the Kibana dashboard, run pgbench first.

### Create pgbench database (psql)

     CREATE DATABASE pgbenchdb;

### Run pgbench

     pgbench -i -s 50 pgbenchdb
     pgbench -c 10 -j 2 -t 1000 pgbenchdb

### Import dashboard


### Remove everything (including volumes)
     docker-compose down -v --remove-orphans --rmi all
