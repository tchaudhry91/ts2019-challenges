+++
title = "Challenge 1"
weight = 5
+++

### Deploy [kube-monkey](https://github.com/asobti/kube-monkey) to test application resiliency.

There should be four files on the filesystem: configmap-debug.yaml, km-deploy.yaml, monkey-victim.yaml, namespace.yaml. Use these to deploy kube-monkey in your cluster.


1. Start environment
  - `ssh devops`

2. Navigate to repo
  - `cd /vagrant/challanges/devops/chaos-engineering/` 
  - `./start.sh` 

3. Deploy the app with kube-monkey enabled
  - `kubectl create -f <file 1>.yaml`
  - `kubectl create -f <file 2>.yaml`
  - `kubectl create -f <file 3>.yaml`
  - `kubectl create -f <file 4>.yaml`

4. Check if it is working 
  - `watch kubectl get pods --namespace=smart-a-app`

#### In what order were the files deployed?
1. Which 1 yaml file must to be deployed before monkey-victim.yaml? 
2. Which 1 yaml file must to be deployed before km-deploy.yaml? 

Enter flag in the order of <your anwser of 1>,<your answer of 2> Eg. abc.yaml,123.yaml
