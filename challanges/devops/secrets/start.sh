#!/bin/bash

CFGS="k8s/vaultchallenge1-deployment.yaml
k8s/vaultchallenge2-deployment.yaml
k8s/vaultchallenge3-deployment.yaml
k8s/vaultclient-deployment.yaml
k8s/vaultserver-challenge3-deployment.yaml
k8s/vaultserver-deployment.yaml
k8s/vaultserver-service.yaml
k8s/vaultclient-volume.yaml
"

for cfg in $CFGS; do
	kubectl delete -f $cfg 2>/dev/null
done

