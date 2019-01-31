#!/bin/bash
#set -e

kubectl delete -f k8s/vaultserver-deployment.yaml
kubectl delete -f k8s/vaultchallenge1-deployment.yaml

kubectl apply -f k8s/vaultserver-deployment.yaml
kubectl apply -f k8s/vaultserver-service.yaml
kubectl rollout status deployment/vaultserver

kubectl apply -f k8s/vaultclient-volume.yaml
kubectl apply -f k8s/vaultclient-deployment.yaml
kubectl rollout status deployment/vaultclient

kubectl apply -f k8s/vaultchallenge2-deployment.yaml
kubectl rollout status deployment/vaultchallenge2
