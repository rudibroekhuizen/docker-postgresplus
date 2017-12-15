FROM openjdk:8u121-jdk-alpine
MAINTAINER tree <treetips555@gmail.com>

ENV DRIVER_URL http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.42/mysql-connector-java-5.1.42.jar
ENV APP_URL https://github.com/schemaspy/schemaspy/releases/download/v6.0.0-rc1/schemaspy-6.0.0-rc1.jar

WORKDIR /app

RUN apk --update add graphviz ttf-dejavu && \
    apk --update add --virtual .builddep tzdata wget libressl && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    wget -O mysql-connector-java.jar ${DRIVER_URL} && \
    wget -O schemaspy.jar ${APP_URL} && \
    apk del .builddep && \
    rm -rf /var/cache/apk/*
