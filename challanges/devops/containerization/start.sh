#!/bin/bash

kubectl delete deployment.apps/frontend 2>/dev/null
kubectl delete deployment.apps/app1 2>/dev/null
kubectl delete deployment.apps/app2 2>/dev/null
kubectl delete service/frontend 2>/dev/null
kubectl delete service/app1 2>/dev/null
kubectl delete service/app2 2>/dev/null
kubectl delete ingress.extensions/app1 2>/dev/null
kubectl delete ingress.extensions/app2 2>/dev/null


git reset --hard
git clean -f -d