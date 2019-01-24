

# Get Start
docker-compose up -d


#cheatsheet

Findout which minion don't have apache2 running
docker exec salt-master salt "*" cmd.run "service apache2 status"
```
aalt-minion-4eab9faf680b:
     * apache2 is running
salt-minion-e4c14f345cac:
     * apache2 is not running
salt-minion-7c6ddfa63b66:
     * apache2 is not running
```
docker exec salt-master salt "*" cmd.run "service apache2 start"
Look for the key in the server root
docker exec salt-master salt "*" cmd.run "curl http://localhost"


If you reach here you will find the flag. 

Lets keep the slate clean for the next guy. Please run this before you leave. :) 

```
docker-compose down
```

#TODO make the setup run through docker command

docker build -t saltmaster -f SaltMaster_DockerFile  .
docker run --hostname saltmaster --name saltmaster -d saltmaster

#TODO - remove the old cached keys from Salt master as cleanup post challenge is completed.
#docker exec salt-master salt-run manage.down removekeys=True

