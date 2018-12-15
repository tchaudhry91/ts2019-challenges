#!/bin/bash
set -e

IMAGES="nginx:latest jenkins/jenkins:lts"

kubectl rollout status deployment/registry --namespace=container-registry
for image in $IMAGES; do
    docker pull $image
    docker tag $image localhost:32000/$image
    docker push localhost:32000/$image
    docker image rm $image
done
