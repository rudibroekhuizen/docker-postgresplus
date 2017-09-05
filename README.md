# docker-postgresplus


## Overview
PostgreSQL playground running on Docker with logs presented in Kibana dashboard and Pgadmin webinterface.

## Usage
Install Docker. Clone this repo to your local machine. Run docker-compose: 
```bash
docker-compose up
```

### Open pgAdmin webinterface
```bash
http://localhost:5050
```
Database, username and password: postgres

### Connect to Postgres container
     docker exec -it dockerpostgresplus_postgres_1 sh
     sudo -s

### Download and unzip test database (in the container)
     wget https://s3.amazonaws.com/assets.datacamp.com/course/sql/dvdrental.zip; unzip dvdrental.zip

### Create database (psql)
     su postgres
     psql
     CREATE DATABASE sakila;
     exit

### Load database using pg_restore
     pg_restore -U postgres -d sakila dvdrental.tar

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
