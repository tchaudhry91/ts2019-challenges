#!/bin/bash

kubectl delete -f km-deploy.yaml
kubectl -n smart-a-app delete po,svc --all
kubectl delete -f namespace.yaml

