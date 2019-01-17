+++
title = "Challenge 1"
weight = 5
+++

Challenge 1

## Install missing Package using salt cmd.run 

### 1. Determine the os details of the servers running in salt stack 

```
docker exec salt-master salt "*" cmd.run "cat /etc/lsb-release"
```
You will notice that 2 of the minions are ubuntu bionic(18.04) and the third one is ubuntu xenial (16.04). Salt command can be applied to individually or usng wildcards (* - applies to all minions). Lets move on. 

#### 2. Find out a package  name "emacs" whether it is installed across all the servers

```
docker exec salt-master salt "*" cmd.run "dpkg -l emacs"
```
The above command should provide information about package details if it is already installed. Note down the minion id which do not have the emacs pkg installed. 

#### 3. Install the package on minion which dont have installed obtained from step-2 

```
docker exec salt-master salt "<replace-with-minion-id>" cmd.run "apt-get install -y emacs"
```
Ensure that there should not be any error returned in the output. 

#### 4. Validate again for consistent state across all the minions

```
docker exec salt-master salt "*" cmd.run "dpkg -l emacs"
```
If you get an output which displays all the minons have the emacs installed. 
Imagine the pain eradicated for having to individually sshing and finding out these details across hunders of servers. 

#### 5. Your key will be combination of string written below and minion name 

```
ev19-dc-<minonid>
```
yay! You have reached the end of this Challenge. To recap this challange we learnt about how Salt lets you remotely execute shell commands across multiple systems using cmd.run. To explore a little further there are also multiple execution function which can be used which can further abstract the limitation of os specific commands. See https://docs.saltstack.com/en/getstarted/ssh/remotex.html for few more such examples. 