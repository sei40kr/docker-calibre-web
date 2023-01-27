FROM python:3.10-alpine

ARG version

ENV CALIBRE_DBPATH=/config
ENV CALIBRE_PORT=8083

RUN apk --no-cache add curl gcc libc-dev libxml2-dev libxslt-dev linux-headers && \
    curl -Lo /tmp/calibre-web.tar.gz https://github.com/janeczku/calibre-web/releases/download/${version}/calibre-web-${version}.tar.gz && \
    mkdir -p /app/calibre-web /config /books && \
    cd /app/calibre-web && \
    tar xf /tmp/calibre-web.tar.gz -C /app/calibre-web --strip-components=1 && \
    pip --no-cache-dir install -UIr requirements.txt && \
    rm -rf /tmp/*

COPY docker-entrypoint.sh /app/calibre-web
COPY books/metadata.db /books/metadata.db

WORKDIR /app/calibre-web

EXPOSE 8083
VOLUME /config /books

ENTRYPOINT ./docker-entrypoint.sh ./cps.py