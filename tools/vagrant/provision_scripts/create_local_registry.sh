#!/bin/bash
set -e

IMAGES="nginx:latest
oleksiimy/server:0.1
oleksiimy/client:0.1
ayushsobti/kube-monkey:v0.3.0
saykumar/ts2019:s1
tchaudhry/hash-svc:ts2019blue
tchaudhry/hash-svc:ts2019red
tchaudhry/simple-http-load:master
prom/prometheus"

kubectl rollout status deployment/registry --namespace=container-registry
for image in $IMAGES; do
    docker pull $image
    docker tag $image localhost:32000/$image
    docker push localhost:32000/$image
    docker image rm $image
done
