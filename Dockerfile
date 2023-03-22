
FROM docker:latest

COPY entrypoint.sh /entrypoint.sh

RUN set -eux; \
    apk update; \
    apk add --no-cache\
      bash \
    ; \
    rm -rf /root/.cache; \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]
