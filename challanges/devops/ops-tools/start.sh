#!/bin/bash


kubectl delete -f k8s/configmap.yaml 2>/dev/null
kubectl delete -f k8s/deployment.yaml 2>/dev/null
kubectl delete -f k8s/service.yaml 2>/dev/null

kubectl apply -f k8s/configmap.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl rollout status deployment/server
