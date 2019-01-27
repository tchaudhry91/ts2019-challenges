Please see https://github.com/dneff/ts2019-challenges/tree/master/docs/content/orchestration for details docs 


Mr. Ropein is owner of one of jacksonville farms. His farm is managed by Mr. Runaway who uses Configuration management tool Salt to ensure all the minios lives happily. Mr. Runaway would like you to take a tour of his farm. Lets get started.

0) Challenge 0 -  Salt "Hello  World"

Follow  http://localhost:1313/orchestration/challenge0/ for instructions

## 1) Challenge 1 - Install missing Package using salt cmd.run
### . Setup 
```
cd <root directory where challenges are stored>/salt/Challenge1

docker rm $(docker ps -a | grep salt) && \
docker-compose build && \
docker-compose up -d
```

### Validate whether setup is running fine

```
$ tagrawal-mac:Challenge1 tagrawal$ docker exec salt-master salt "*" test.ping
salt-minion-salt-minion3:
    True
salt-minion-salt-minion1:
    True
salt-minion-salt-minion2:
    True
```

Follow  http://localhost:1313/orchestration/challenge2/ for instructions

### Cleanup 
```
docker-compose down
```
## 2) Challenge 2 - Find the culprit - There is a alarm raised due to faulty server in the cluster which seems to be not in active service causing high load conditionfor other servers. Figure out the and provision it using Salt stack tool. 
### Setup
```
cd <root directory where challenges are stored>/salt/Challenge2

docker-compose build && \
docker-compose up -d
```

Follow  http://localhost:1313/orchestration/challenge2/ for instructions

3) Challenge 3 - Apply Salt states to configure a server cluster with apache2
Follow  http://localhost:1313/orchestration/challenge3/ for instructions
The path where the challenge files are stored is need to be shared in docker. 
## Setup 
Current setup uses docker-compose to setup 1 master and 3 salt minions. Also every challenge has 

a) Cleanup 
```
cd Challenge<> && \
docker-compose down
```
cd challenges/devops/orchestration/<Challengenum>/ 

docker-compose build --no-cache
(will take more than couple of minutes to run)

docker-compose up -d 
```

# TODO - remove the old cached keys from Salt master as cleanup post challenge is completed.
## Useful Commands 
Remove stale keys , this usually is helpful to remove the the error on minion - "[ERROR   ][29] The Salt Master has cached the public key for this node, this salt minion will wait for 10 seconds before attempting to re-authenticate"
```docker exec salt-master salt-run manage.down removekeys=True```
Check which minion keys are accepted
```docker exec salt-master salt-key```
Sometimes if keys are not accepted doign a restart of the setup resolves the issue. 
```docker-compose restart```