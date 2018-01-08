FROM alpine:3.6

RUN  apk add --update postgresql-client \
  && rm -rf /var/cache/apk/* /var/tmp/* \

CMD ["psql"]
