FROM debian:buster-slim

RUN apt update ; apt install rsync -y --no-install-recommends ; apt clean

COPY rsyncd.conf /etc/
COPY greenbone-feed-sync-local.sh /usr/bin/greenbone-feed-sync-local

RUN mkdir -p /var/lib/openvas/feed-mirror/
RUN greenbone-feed-sync-local

EXPOSE 873/tcp

ENTRYPOINT ["/usr/bin/entrypoint"]

CMD ["rsync", "--verbose", "--daemon", "--no-detach", "--config=/etc/rsyncd.conf", "--log-file=/proc/1/fd/1"]
