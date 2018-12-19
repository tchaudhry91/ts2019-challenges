#!/bin/bash
set -e

CONTAINERS="client server"
VERSION="0.1"


for container in ${CONTAINERS}; do
    docker build -t ${container} -f Dockerfile.${container}  .
    docker tag ${container} oleksiimy/${container}:${VERSION}
    docker push oleksiimy/${container}:${VERSION}
done

