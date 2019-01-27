#!/bin/bash
set -e

CONTAINERS="vault_challengeuser
vault_server
vault_challenge1
vault_challenge2
vault_challenge3
"
VERSION="0.1"


for container in ${CONTAINERS}; do
    ( cd ${container}
    echo
    echo "****** Building ${container} ***********"
    echo
    docker build -t ${container} -f Dockerfile.${container}  .
    docker tag ${container} oleksiimy/${container}:${VERSION}
    docker push oleksiimy/${container}:${VERSION} )
done


