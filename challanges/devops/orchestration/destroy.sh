#!/bin/bash


# cleanup
kubectl delete -f k8s/smaster.yaml
kubectl delete -f k8s/sminion.yaml
