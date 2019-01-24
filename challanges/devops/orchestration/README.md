Please see https://github.com/dneff/ts2019-challenges/tree/master/docs/content/orchestration for details docs 


Mr. Ropein is owner of one of jacksonville farms. His farm is managed by Mr. Runaway who uses Configuration management tool Salt to ensure all the minios lives happily. Mr. Runaway would like you to take a tour of his farm. Lets get started.

0) Challenge 0 -  Salt "Hello  World"

Follow  http://localhost:1313/orchestration/challenge0/ for instructions

1) Challenge 1 - Install missing Package using salt cmd.run

Follow  http://localhost:1313/orchestration/challenge2/ for instructions

2) Challenge 2 - Find the culprit in the cluster and fix it
Follow  http://localhost:1313/orchestration/challenge2/ for instructions

3) Challenge 3 - Apply Salt states to configure a server cluster with apache2
Follow  http://localhost:1313/orchestration/challenge3/ for instructions

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
# docker exec salt-master salt-run manage.down removekeys=True
