+++
title = "Challenge 1"
weight = 5
+++

### Deploy [kube-monkey](https://github.com/asobti/kube-monkey) to test application resiliency.

There should be four files on the filesystem: configmap-debug.yaml, km-deploy.yaml, monkey-victim.yaml, namespace.yaml. Use these to deploy kube-monkey in your cluster.


1. Enable kube-monkey using the config file
  - `kubectl apply -f configmap-debug.yaml`

2. Deploy the app with kube-monkey enabled
  - `kubectl create -f km-deploy.yaml`
  - `kubectl create -f namespace.yaml`
  - `kubectl create -f monkey-victim.yaml`

3. Check if it is working 
  - `watch kubectl get pods --namespace=smart-a-app`

#### In what order were the files deployed?
(Use the first letter of each file as your answer.)
