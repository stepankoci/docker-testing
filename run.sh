#!/bin/bash

TAG=$1

docker run \
    --name testing-${TAG} \
    -d \
    -p 89${TAG}:80 \
    stepankoci/testing:${TAG}
