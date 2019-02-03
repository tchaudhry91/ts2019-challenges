#!/bin/bash
set -e

kubectl apply -f k8s/vaultserver-deployment.yaml
kubectl apply -f k8s/vaultserver-service.yaml
kubectl rollout status deployment/vaultserver

kubectl apply -f k8s/vaultclient-volume.yaml
kubectl apply -f k8s/vaultclient-deployment.yaml
kubectl rollout status deployment/vaultclient
