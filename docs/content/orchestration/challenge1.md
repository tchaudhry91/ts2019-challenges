+++
title = "Challenge 1"
weight = 5
+++

Challenge 1 - Configure salt-master and salt-minion

###

### Verify the number of minons in the Salt Stack farm

Start environment, and bring up salt master and minions

```
ssh devops
cd /vagrant/challanges/devops/orchestration
./setup.sh
```

Now check salt-minions are able to be seen from salt-master (it may a take a few seconds to work)

```
kubectl exec smaster-0 -- salt \* test.ping
```

### Lets Try one more thing. Who all are running the show in the farm minions?

```
kubectl exec smaster-0 -- salt \* cmd.run "whoami"
```

So we learnt how salt provides an easy command line interface to query any information from multiple servers(termed minions). Lets get on some real challenge.

Your flag to solve the challenge is - *ev19orchestration{number of minions}*.

 _Note:_ : Remove curly braces and just enter the number of minions
