#!/bin/bash
set -e
./start-vaultchallenge1.sh
kubectl apply -f k8s/vaultchallenge1-deployment.yaml
kubectl rollout status deployment/vaultchallenge1
