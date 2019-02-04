#!/bin/bash


# cleanup
kubectl delete -f k8s/smaster.yaml
kubectl delete -f k8s/sminion.yaml

# master setup
kubectl create -f k8s/smaster.yaml
kubectl rollout status StatefulSet/smaster
kubectl exec smaster-0 -- bash -c 'echo "file_roots: /srv/salt">>/etc/salt/master'
kubectl exec smaster-0 -- /etc/init.d/salt-master restart
kubectl rollout status StatefulSet/smaster

# minion setip

kubectl create -f k8s/sminion.yaml
kubectl rollout status StatefulSet/sminion 
kubectl get --no-headers=true pods -l name=sminion -o custom-columns=:metadata.name | xargs -I {} kubectl exec {} -- sh -c  'echo "master: smaster-0.smaster.default.svc.cluster.local">/etc/salt/minion'
kubectl get --no-headers=true pods -l name=sminion -o custom-columns=:metadata.name | xargs -I {} kubectl exec {} -- sh -c '/etc/init.d/salt-minion restart && sleep 5 && /etc/init.d/salt-minion status'

# register minions
kubectl exec smaster-0 -- salt-key -L
kubectl exec -it smaster-0 -- salt-key -A -y
