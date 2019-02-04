#!/bin/bash

kubectl delete  -f km-deploy.yaml 2>/dev/null
kubectl -n smart-a-app delete  po,svc --all 2>/dev/null
kubectl delete  -f namespace.yaml 2>/dev/null

git reset --hard
git clean -f -d
