# docker-postgresplus


## Overview
PostgreSQL playground running on Docker with logs presented in Kibana dashboard and Pgadmin webinterface.

## Setup
Install Docker. Clone this repo to your local machine. Run docker-compose: 

     docker-compose up


### Connect to Postgres container

     docker exec -it dockerpostgresplus_postgres_1 sh

### Download and unzip test database (in the container)

     wget https://s3.amazonaws.com/assets.datacamp.com/course/sql/dvdrental.zip; unzip dvdrental.zip

### Create database (psql)

     su postgres
     psql
     CREATE DATABASE dvdrental;
     exit

### Load database using pg_restore

     pg_restore -U postgres -d dvdrental dvdrental.tar

### Create pgbench database (psql)

     CREATE DATABASE pgbenchdb;

### Run pgbench

     pgbench -i -s 50 pgbenchdb
     pgbench -c 10 -j 2 -t 1000 pgbenchdb

### Import dashboard
To make sure all fields exist prior to importing the Kibana dashboard, run pgbench first.


### Remove containers plus volumes
     docker-compose down -v --remove-orphans --rmi all

### Useful commands
# Check CPU consumption
docker stats $(docker inspect -f "{{ .Name }}" $(docker ps -q))
