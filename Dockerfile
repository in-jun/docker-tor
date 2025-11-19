FROM alpine:latest
RUN apk add --no-cache tor
RUN mkdir -p /var/lib/tor /etc/tor && chown -R tor:tor /var/lib/tor /etc/tor
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
WORKDIR /var/lib/tor
USER tor
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["tor"]
