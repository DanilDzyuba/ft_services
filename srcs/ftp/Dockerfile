FROM alpine:latest
RUN apk update
RUN apk add --no-cache telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ vsftpd openssl
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -subj \
    "/C=RU/ST=Moscow/L=Moscow/O=21 School/OU=clauren/CN=localhost" -keyout \
	/etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN adduser -D admin && echo "admin:admin" | chpasswd

ADD start.sh ./
ENTRYPOINT ["sh", "start.sh"]
EXPOSE 20 21 21100