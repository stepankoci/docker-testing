#!/bin/bash

TAG=$1 
docker stop testing-${TAG}
docker rm testing-${TAG}
docker build --no-cache -t stepankoci/testing:${TAG} versions/php${TAG}-apache/ && \
./run.sh ${TAG}
