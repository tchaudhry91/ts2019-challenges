+++
title = "Challenge 2"
weight = 5
+++

Challenge 2 - Remote Execution

### Start environment, and bring up salt master and minions 

```
ssh devops
cd /vagrant/challanges/devops/orchestration
./setup.sh
```

## Install missing Package using salt cmd.run

### 1. Determine the os details of the servers running in salt stack

```
kubectl exec smaster-0 -- salt \* cmd.run "cat /etc/hosts"
```

#### 2. Find out a package  name "lighttpd" whether it is installed across all the servers

```
kubectl exec smaster-0 -- salt \* cmd.run "dpkg -l lighttpd"
```
The above command should provide information about package details if it is already installed.

#### 3. Install the package on sminion-0  

```
kubectl exec sminion-0 -- bash -c "apt-get update && apt-get install -y lighttpd"
```	
Ensure that there should not be any error returned in the output. 

#### 4. Validate again for consistent state across all the minions

```
kubectl exec smaster-0 -- salt \* cmd.run "dpkg -l lighttpd"
```

If you get an output which displays all the minons have the lighttpd installed. 
Imagine the pain eradicated for having to individually sshing and finding out these details across hunders of servers. 

#### 5. Your key will be combination of string written below and lighttpd version (major.minor.patch)

```
ev19orchestration<version as major.minor.patch>
```
yay! You have reached the end of this Challenge. To recap this challange we learnt about how Salt lets you remotely execute shell commands across multiple systems using cmd.run. To explore a little further there are also multiple execution function which can be used which can further abstract the limitation of os specific commands. See https://docs.saltstack.com/en/getstarted/ssh/remotex.html for few more such examples. 
