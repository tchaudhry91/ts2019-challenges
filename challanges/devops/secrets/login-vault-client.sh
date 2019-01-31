#!/bin/bash
set -e

POD=$(kubectl get pods -l app=vaultclient -o jsonpath="{.items[0].metadata.name}")
kubectl exec -ti $POD /bin/sh
