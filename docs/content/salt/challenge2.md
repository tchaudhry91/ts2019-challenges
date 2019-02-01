+++
title = "Challenge 2"
weight = 5
+++

Challenge 2 - Remote Excution

## Install missing Package using salt cmd.run 

Follow  http://localhost:1313/orchestration/challenge2/ for detailed Instructions 


### 1. Determine the os details of the servers running in salt stack 

```
kubectl exec salt-master -- salt \* cmd.run "cat /etc/hosts"
```

#### 2. Find out a package  name "emacs" whether it is installed across all the servers

```
kubectl exec salt-master salt \* cmd.run "dpkg -l apache2"
```
The above command should provide information about package details if it is already installed. Note down the minion id which do not have the emacs pkg installed. 

#### 3. Install the package on minion which dont have installed obtained from step-2 

```
kubectl get pods | grep sminion  | awk '{print $1}' | xargs -I {} kubectl exec {} apt-get install apache2
```
Ensure that there should not be any error returned in the output. 

#### 4. Validate again for consistent state across all the minions

```
kubectl exec salt-master salt \* cmd.run "dpkg -l apache2"
```

If you get an output which displays all the minons have the emacs installed. 
Imagine the pain eradicated for having to individually sshing and finding out these details across hunders of servers. 

#### 5. Your key will be combination of string written below and minion name 

```
ev19-dc-<minonid>
```
yay! You have reached the end of this Challenge. To recap this challange we learnt about how Salt lets you remotely execute shell commands across multiple systems using cmd.run. To explore a little further there are also multiple execution function which can be used which can further abstract the limitation of os specific commands. See https://docs.saltstack.com/en/getstarted/ssh/remotex.html for few more such examples. 
