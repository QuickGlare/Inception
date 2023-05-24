FROM alpine:3.17

EXPOSE 443
RUN apk add nginx openssl
RUN mkdir -p /etc/ssl
RUN mkdir -p /etc/nginx/http.d/

COPY conf/default.conf /etc/nginx/http.d/
COPY tools/setup.sh /usr/local/bin/

ENTRYPOINT ["/bin/sh", "/usr/local/bin/setup.sh"]