# docker-postgresplus


## Overview
PostgreSQL playground running on Docker with logs presented in Kibana dashboard and Pgadmin webinterface.

## Usage
Install Docker. Clone this repo to your local machine. Create network, to be able to run more postgres instances on the same network. Run docker-compose up.

```bash
docker network create pgnet
docker-compose up
```

### Open pgAdmin webinterface
```bash
http://pgadmin.docker.localhost/
```
Database, username and password: postgres

### Connect to Postgres container
     docker exec -it dockerpostgresplus_postgres_1 sh (or docker-compose exec postgres sh)
     su

### Download and unzip test database (in the container)
     wget https://s3.amazonaws.com/assets.datacamp.com/course/sql/dvdrental.zip; unzip dvdrental.zip

### Create database (psql)
     su postgres
     psql
     CREATE DATABASE sakila;
     exit

### Load database using pg_restore
     pg_restore -U postgres -d sakila dvdrental.tar

### Collect logs
     docker-compose exec postgres bash /scripts/pglog.sh

### Run 1000 queries
     yes "select * from public.film_actor;" | head -n 1000 | parallel "psql -U postgres -d sakila -c {1}"

## Pgbench
     psql> CREATE DATABASE pgbenchdb;
     pgbench -i -s 50 pgbenchdb
     pgbench -c 10 -j 2 -t 1000 pgbenchdb

### Import dashboard
To make sure all fields exist prior to importing the Kibana dashboard, run pgbench first.


### Useful commands
```bash
# Check CPU consumption
$ docker stats $(docker inspect -f "{{ .Name }}" $(docker ps -q))

# Remove containers plus volumes
$ docker-compose down -v --remove-orphans --rmi all
```




![postgres](postgres_1.png?raw=true)

![postgres](postgres_2.png?raw=true)

![postgres](postgres_3.png?raw=true)
