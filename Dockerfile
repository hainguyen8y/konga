FROM node:12.16-alpine

RUN apk upgrade --update \
    && apk --no-cache add python bash git ca-certificates

WORKDIR /app
COPY . /app
RUN npm install -g bower patch-package \
    && npm --unsafe-perm --production install \
    && apk del python git \
    && rm -rf /var/cache/apk/* \
        /app/.git \
        /app/screenshots \
        /app/test \
    && adduser -H -S -g "Konga service owner" -D -u 1200 -s /sbin/nologin konga \
    && mkdir /app/kongadata /app/.tmp \
    && chown -R 1200:1200 /app/views /app/kongadata /app/.tmp

EXPOSE 1337

VOLUME /app/kongadata

ENTRYPOINT ["/app/start.sh"]
