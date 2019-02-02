+++
title = "Challenge 1"
weight = 5
+++

### Deploy [kube-monkey](https://github.com/asobti/kube-monkey) to test application resiliency.

There should be four files on the filesystem: configmap-debug.yaml, km-deploy.yaml, monkey-victim.yaml, namespace.yaml. Use these to deploy kube-monkey in your cluster.


1. Navigate to repo 
  - `cd /vagrant/challanges/devops/chaos-engineering/`

2. Enable kube-monkey using the config file
  - `kubectl apply -f <file 1>.yaml`

3. Deploy the app with kube-monkey enabled
  - `kubectl create -f <file 2>.yaml`
  - `kubectl create -f <file 3>.yaml`
  - `kubectl create -f <file 4>.yaml`

4. Check if it is working 
  - `watch kubectl get pods --namespace=smart-a-app`

#### In what order were the files deployed?
(Use the first letter of each file as your answer.)
