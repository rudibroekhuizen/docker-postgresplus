#/bin/bash

pg_basebackup \
  --host=127.0.0.1 \
  --username=$REPLICATION_USER \
  --pgdata=/tmp/backup \
  --format=tar \
  --progress \
  --gzip \
  --xlog-method=fetch
