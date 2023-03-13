# docker-postgresplus


## Overview
PostgreSQL playground running on Docker with logs presented in Kibana dashboard and Pgadmin webinterface.

## Usage
Install docker and docker-compose. Clone this repo to your local machine. Than start the containers:

```bash
docker-compose up
```

### Open pgAdmin webinterface
```bash
[pgadmin]: http://pgadmin.docker.localhost/
```
Database, username and password: postgres

### Connect to Postgres container
     docker exec -it dockerpostgresplus_postgres_1 sh (or docker-compose exec postgres sh)
     su
     docker-compose exec postgres psql -U postgres

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

### Grafana
URL: http://elasticsearch:9200
Access: proxy
Index name: logstash- (daily pattern)
Version: 5.x

### Useful commands
```bash
# Check CPU consumption
$ docker stats $(docker inspect -f "{{ .Name }}" $(docker ps -q))

# Remove containers plus volumes
$ docker-compose down -v --remove-orphans --rmi all

# docker-compose Elasticsearch

Elasticsearch uses a hybrid mmapfs / niofs directory by default to store its indices. The default operating system limits on mmap counts is likely to be too low, which may result in out of memory exceptions. On Linux, you can increase the limits by running the following command as root:

One time:
$ sysctl -w vm.max_map_count=262144

Persistant:
$ echo 'vm.max_map_count=262144' >> /etc/sysctl.conf

```


![postgres](diagram.png?raw=true)

![postgres](postgres_1.png?raw=true)

![postgres](postgres_2.png?raw=true)

![postgres](postgres_3.png?raw=true)
