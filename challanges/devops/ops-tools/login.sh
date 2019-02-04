#!/bin/bash
set -e

#POD=$(kubectl get pods -l app=server -o jsonpath="{.items[0].metadata.name}")
POD=$(kubectl get pods | grep -E "^server-.*Running" | awk '{print $1}')
kubectl exec -ti $POD --container server /bin/bash
