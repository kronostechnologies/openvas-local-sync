#!/bin/bash

rsync --verbose --daemon --config=/etc/rsyncd.conf --log-file=/proc/1/fd/1

#greenbone-feed-sync-local

$@
