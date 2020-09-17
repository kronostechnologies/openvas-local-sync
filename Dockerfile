FROM debian:buster-slim

RUN apt update ; apt install rsync -y --no-install-recommends ; apt clean

COPY rsyncd.conf /etc/
COPY greenbone-feed-sync-local.sh /usr/bin/greenbone-feed-sync-local
COPY entrypoint.sh /usr/bin/entrypoint

EXPOSE 873/tcp

ENTRYPOINT ["/usr/bin/entrypoint"]

CMD ["/bin/bash"]
