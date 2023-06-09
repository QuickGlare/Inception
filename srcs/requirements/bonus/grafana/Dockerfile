FROM alpine:3.17

EXPOSE 3000
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community/
COPY tools/setup.sh /usr/local/bin/

ENTRYPOINT ["/bin/sh", "/usr/local/bin/setup.sh"]