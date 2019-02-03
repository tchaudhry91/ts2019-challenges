#!/bin/bash


kubectl delete -f k8s/configmap.yaml
kubectl delete -f k8s/deployment.yaml
kubectl delete -f k8s/service.yaml

kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl rollout status deployment/server
