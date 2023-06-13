FROM alpine:3.17

RUN apk update \
    && apk add --no-cache redis \
    && rm -rf /var/cache/apk/*

COPY tools/setup.sh /usr/local/bin/

EXPOSE 6379
ENTRYPOINT ["sh", "/usr/local/bin/setup.sh"]