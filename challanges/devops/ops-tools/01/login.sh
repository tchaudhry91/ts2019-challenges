#!/bin/bash
set -e

POD=$(kubectl get pods -l app=server -o jsonpath="{.items[0].metadata.name}")
kubectl exec -ti $POD --container server /bin/bash
