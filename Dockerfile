FROM alpine:latest
RUN apk add --no-cache tor
RUN mkdir -p /var/lib/tor /etc/tor && chown -R tor:tor /var/lib/tor /etc/tor
RUN sed "1s/^/SocksPort 0.0.0.0:9050\n/" /etc/tor/torrc.sample > /etc/tor/torrc && chown tor:tor /etc/tor/torrc
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
WORKDIR /var/lib/tor
USER tor
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["tor"]
