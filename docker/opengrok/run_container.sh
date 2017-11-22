#!/bin/bash

sudo docker run --rm \
    --volume="$1:/src" \
    -p 8081:8080 \
    opengrok
    #    -v /path/to/opengrok_data:/data \
