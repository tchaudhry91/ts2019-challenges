+++
title = "Challenge 1"
weight = 5
+++

Challenge 1 - Configure salt-master and salt-minion

### 

### Verify the number of minons in the Salt Stack farm

In dir, bring up salt master and minions 

```
kubectl create -f k8s/smaster.yaml
kubectl create -f k8s/sminion.yaml
```

Check if they are running and get the pod name for salt master and minion

```
kubectl get pods | grep -E "smaster|sminion" 
```


Configure salt-minion and make sure they know the salt-master

```
kubectl get pods | grep sminion  | awk '{print $1}' | xargs -I {} kubectl exec {} -- sh -c  'echo "master: smaster-0.smaster.default.svc.cluster.local">/etc/salt/minion'
kubectl get pods | grep sminion  | awk '{print $1}' | xargs -I {} kubectl exec {} /etc/init.d/salt-minion restart
```

Configure salt-master to accept minions keys

```
kubectl exec smaster-0 -- salt-key -L
kubectl exec -it smaster-0 -- salt-key -A
```

Now check salt-minions are able to be seen from salt-master (it may a take a few seconds to work)

```
$ kubectl exec smaster-0 -- salt \* test.ping
```

### Lets Try one more thing. Who all are running the show in the farm minions?

```
$ kubectl exec smaster-0 -- salt \* cmd.run "whoami"
```

So we learnt how salt provides an easy command line interface to query any information from multiple servers(termed minions). Lets get on some real challenge.

Your flag to solve the challenge is - *ev19orchestration{number of minions}*. 
