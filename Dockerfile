FROM alpine:3.7

# Install mariadb and other packages
RUN apk --update add mariadb mariadb-client pwgen bash && \
    rm -f /var/cache/apk/*

RUN rm /etc/mysql/my.cnf
ADD ./files/my.cnf /etc/mysql/my.cnf

RUN mkdir -p /etc/mysql/conf.d

ADD files/run.sh /scripts/run.sh
RUN mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306

ENTRYPOINT ["/scripts/run.sh"]
