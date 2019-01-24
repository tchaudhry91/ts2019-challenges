Please see https://github.com/dneff/ts2019-challenges/tree/master/docs/content/orchestration for details docs 
Salt "Hello  World"

Mr. Ropein is owner of one of jacksonville farms. His farm is managed by Mr. Runaway who uses Configuration management tool Salt to ensure
all the minios lives happily. Mr. Runaway would like you to take a tour of his farm. Lets get started.


Lets see who is there in the farm -
docker exec salt-master salt "*" test.ping



Salt "Figure the culprit"

Mr. Runaway has having trouble in diagnize



docker exec salt-master salt "*" test.ping

That was easy one.

Lets Try one more thing. Who all are running the show in the farm?

docker exec salt-master salt "*" cmd.run "whoami"

Lets begin the Real challenge
1) Challenge

Mr. Ropein is trying to figure out one of the farms is not reporting correct time. Can you help him find the culprit which is not reporting correct time.
Mr. Runaway will lead you to it.


docker-compose build


#TODO - remove the old cached keys from Salt master as cleanup post challenge is completed.
#docker exec salt-master salt-run manage.down removekeys=True

## Setup 
Current setup uses docker-compose to setup 1 master and 3 salt minions. Also every challenge has 
cd Challenges/root/salt/Challenge2/
docker-compose build --no-cache
(will take more than couple of minutes to run)

docker-compose up -d 
