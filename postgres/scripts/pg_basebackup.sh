#!/bin/bash

pg_basebackup \
  --host=127.0.0.1 \
  --username=$REPLICATION_USER \
  --write-recovery-conf \
  --pgdata=/tmp/backup \
  --format=tar \
  --progress \
  --gzip \
  --xlog-method=fetch

# To unpack:
# gunzip base.tar.gz && tar -xvf base.tar



# Stream method:
#pg_basebackup \
#  --host=127.0.0.1 \
#  --username=$REPLICATION_USER \
#  --write-recovery-conf \
#  --pgdata=/tmp/backup \
#  --progress \
#  --xlog-method=stream
