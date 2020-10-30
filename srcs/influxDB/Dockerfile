FROM alpine:latest
RUN apk update
RUN apk add --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
        influxdb

ADD start.sh ./
ENTRYPOINT ["sh", "start.sh"]
EXPOSE 8086