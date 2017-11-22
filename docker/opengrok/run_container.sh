#!/bin/bash

docker run -td --rm \
  --privileged=true \
  --volume="$1:/src" \
  -p 8080:8080 \
  opengrok
  #-v /path/to/opengrok_data:/data \
