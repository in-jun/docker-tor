FROM alpine:latest AS builder
RUN apk add --no-cache tor

FROM alpine:latest
RUN apk add --no-cache tor && adduser -D -s /bin/sh tor
RUN mkdir -p /var/lib/tor /etc/tor && chown -R tor:tor /var/lib/tor /etc/tor
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
WORKDIR /var/lib/tor
USER tor
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["tor"]
