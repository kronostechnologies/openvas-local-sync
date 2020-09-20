#!/bin/bash

function stopall() {
    jobs -p | xargs kill
}

trap "stopall" SIGKILL SIGTERM SIGHUP SIGINT EXIT

rsync --verbose --daemon --no-detach --config=/etc/rsyncd.conf --log-file=/proc/1/fd/1 &

greenbone-feed-sync-local &

wait

