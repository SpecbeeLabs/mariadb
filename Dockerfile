FROM alpine

ENV TERM ansi

RUN apk update
RUN apk add mariadb mariadb-client

VOLUME ["/etc/mysql", "/var/lib/mysql"]
WORKDIR /data

EXPOSE 3306