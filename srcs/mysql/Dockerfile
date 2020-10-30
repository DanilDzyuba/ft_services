FROM alpine:latest
RUN apk update
RUN apk add --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        mariadb mariadb-client mysql-client

ADD start.sh ./
ADD wp-dump.sql ./
ADD db_init.sh ./
RUN chmod +x db_init.sh
ENTRYPOINT ["sh", "start.sh"]
EXPOSE 3306