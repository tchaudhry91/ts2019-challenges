+++
title = "Challenge 3"
weight = 15
+++

Challenge 3 - Configuration Management

## Apply Salt states to configure a server cluster with lighttpd 

Follow  http://localhost:1313/orchestration/challenge3/ for detailed Instructions 

If you have gone through previous challenge you can realise doing changes during remote execution for small tasks is easy using command line but bigger and complex orcestration which need to do multiple changes there need to be better way. 
This Challenge introduces applying Salt states to configure a lighttpd server as well as update index.html file. 

### Salt State file
The SLS (Salt State File) is a representation of the state in which a system should be in, and is set up to contain this data in a simple format. This is often called configuration management. If you are inetrested read more about Salt state [here](https://docs.saltstack.com/en/latest/ref/states/all/salt.states.file.html)

 
### 1. Setup 

Run setup script to reset environment

```
./setup3.sh
```

copy the content below to create a new file `top.sls` in your local dir
```
install_and_start_apache:
    pkg.installed:  
        - pkgs:
            - lighttpd
            - curl
welcome_page:
    file.managed:
        - name:  /var/www/html/index.html
        - source:  salt://index.html
# This is throwing error while applying state
# TypeError: '>' not supported between instances of 'dict' and 'int'
#lighttpd:
#    service.running:
#        enable: true

# Putting cmd.run to start lighttpd service as service module has issues. 
lighttpd_run:
    cmd.run:
        - name: /usr/sbin/service  lighttpd restart > /dev/null 2>&1
```

Run the below to add state file
```
kubectl exec smaster-0 -- mkdir -p /srv/salt
kubectl cp top.sls smaster-0:/srv/salt/top.sls
kubectl exec smaster-0 -- cat /srv/salt/top.sls
```

### 2. Apply salt state

Clear any cache states from the minions 

```
kubectl exec smaster-0 -- salt \* state.clear_cache
```

Check the state file and run in it test mode to see what all configuration will be changed

```
kubectl exec smaster-0 -- salt \* state.apply top test=True
```
The above command will provide Changes which will occur on minions once the state will be applied before actually making changes. You should notice that applying this SLS file will install lighttpd, copy the index.html to the default folder and start the service.  

#### 3. Finally apply the state on all the minions 

```
kubectl exec smaster-0 -- salt \* state.apply top
```
The above command will actually make the desired configuration changes. The advantage of states can be found by tre running above command again. States are idempotent, if the configuration is already applied no rerun will occur. 

#### 4. Validate the lighttpd service is running on all the minons 
```
kubectl exec smaster-0 -- salt \* cmd.run "service lighttpd status"
```
#### 5. Try to access the default webpage hosted by apache server on any one of minion

```
kubectl exec smaster-0 -- salt sminion-0\* cmd.run "curl -i http://localhost/"

```
The webpage output should return post running the command. 

The flag for this challenge is the first line of body. Please enter to win points!
 
Congratulations for completing the challenge.

### 6. Optional - See what happens if you try to apply the states again.

```
kubectl exec smaster-0 -- salt \* state.apply top
```
The advantage of salt states are they are idempotent. What does that mean is it will not rerun 




