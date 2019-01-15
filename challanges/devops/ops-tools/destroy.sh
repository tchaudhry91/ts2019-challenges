#!/bin/bash
kubectl delete service/server
kubectl delete deployment.apps/server
kubectl delete configmaps/server
