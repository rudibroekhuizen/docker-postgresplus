FROM alpine:3.7

RUN  apk add --update postgresql-client jq parallel\
     && rm -rf /var/cache/apk/* /var/tmp/*

COPY scripts /usr/local/bin/

RUN chmod +x /usr/local/bin/analytics.sh

CMD ["analytics.sh"]
