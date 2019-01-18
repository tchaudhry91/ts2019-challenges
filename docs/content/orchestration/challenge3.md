+++
title = "Challenge 3"
weight = 15
+++

Challenge 3 (Intermediate)

## Apply Salt states to configure a server cluster with apache2 

Follow  http://localhost:1313/orchestration/challenge3/ for detailed Instructions 

If you have gone through previous challenge you can realise doing changes during remote execution for small tasks is easy using command line but bigger and complex orcestration which need to do multiple changes there need to be better way. 
The SLS (Salt State File) is a representation of the state in which a system should be in, and is set up to contain this data in a simple format. This is often called configuration management.
This Challenge introduces applying Salt states to configure a apache2 server as well as update index.html file. 

### 0. Setup 
```
cd <root directory where challenges are stored>/salt/Challenge3
docker-compose up -d

```

### 0.5 Validate whether setup is running fine

```
$ docker ps
CONTAINER ID        IMAGE                     COMMAND                CREATED             STATUS              PORTS                    NAMES
b5f463e4b531        challenge3_salt-minion3   "bash /opt/setup.sh"   9 hours ago         Up 9 hours                                   salt-minion3
445e9e0d1ebe        challenge3_salt-minion2   "bash /opt/setup.sh"   9 hours ago         Up 9 hours                                   salt-minion2
b36c0150ce11        challenge3_salt-minion1   "bash /opt/setup.sh"   9 hours ago         Up 9 hours                                   salt-minion1
28c83753d9dc        challenge3_salt-master    "bash /opt/setup.sh"   9 hours ago         Up 9 hours          0.0.0.0:4505->4505/tcp   salt-master
```
### 1. Clear any cache states from the minions 

```
docker exec salt-master salt "*" state.clear_cache
```

#### 2. Check the state file and run in it test mode to see what all configuration will be changed

```
docker exec salt-master salt "*" state.apply  top test=True
```
The above command will provide Changes which will occur on minions once the state will be applied before actually making changes. You should notice that applying this SLS file will install apache2, copy the index.html to the default folder and start the service.  

#### 3. Finally apply the state on all the minions 

```
docker exec salt-master salt "*" state.apply  top | more 
```
The above command will actually make the desired configuration changes. The advantage of states can be found by tre running above command again. States are idempotent, if the configuration is already applied no rerun will occur. 

#### 4. Validate the apache2 service is running on all the minons 
```
docker exec salt-master salt "*" cmd.run "service apache2 status"
Expected Output 
salt-minion-salt-minion1:
     * apache2 is running
salt-minion-salt-minion3:
     * apache2 is running
salt-minion-salt-minion2:
     * apache2 is running
```
#### 5. Try to access the default webpage hosted by apache server on any one of minion

```
docker exec salt-master salt salt-minion-salt-minion2 cmd.run "curl -i http://localhost/"

```
The webpage output should return post running the command. The flag will be hidden somewhere in the output. 
Congratulations for completing the challenge.




