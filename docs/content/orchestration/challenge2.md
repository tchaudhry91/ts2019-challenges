+++
title = "Challenge 2"
weight = 10
+++

Challenge 2 (Easy)

## Find the culprit in the cluster and fix it
Your team has identified that servers running on apache are overloaded. It seems that some of deployed servers are not  in service. You need to use the salt cmd to figure out which one is faulty and also fix it to resolve the issue which is impacting organizations customers worldwide. 

Follow  http://localhost:1313/orchestration/challenge2/ for detailed Instructions 

### 1. Determine the minions connected to master

```
docker exec salt-master salt "*" test.ping
Expected Output
salt-minion-salt-minion3:
    True
salt-minion-salt-minion2:
    True
salt-minion-salt-minion1:
    True
```
So there are three servers now let us found out which one is guilty. 

#### 2. Find out the current state of the service running on the servers.

```
docker exec salt-master salt "*" cmd.run "service apache2 status"
```
The above command should provide information about  minion details which is not running apache2

#### 3. Start the service on the faulty minion

```
docker exec salt-master salt <replace-with-minion-id>  cmd.run "service apache2 start"
```
Ensure that there should not be any error returned in the output. 

#### 4. Validate again for to check all the servers are running apache now

```
docker exec salt-master salt "*" cmd.run "service apache2 status"
```
If all servers are running apache2 then lets move to next step. 

#### 5. Lets find out the flag hidden somewhere in the servers

```
docker exec salt-master salt <replace-with-minion-id>  cmd.run "curl -i http://localhost"
```
Great, with this you should be able to capture the flag. Pat yourself for completing another challenge. 
To recap we learnt through this challenge how troubleshooting can be done remotely on multiple servers from a single command line interface. Lets move on to next challenge. 