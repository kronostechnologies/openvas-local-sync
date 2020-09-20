#!/bin/bash

docker build -t openvas-local-sync .

docker run -v $(pwd)/data/:/var/lib/openvas/feed-mirror/ -it -p 873:873 openvas-local-sync
