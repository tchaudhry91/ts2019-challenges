

# Get Start
docker-compose up -d
Your service need to be updated with latest version of apache2. Follow on get this done 

Go to apache.sls file. Open it in your choice of editor (vi, vim, nano). If you need help with using a shell based editor, please
raise a hand and one of volunteer will be with you shortly. 



If you reach here and want to learn more about salt here is a great tutorial 

https://learning.oreilly.com/videos/learning-salt


#cheatsheet

Findout which minion dont have apache2 running

docker exec salt-master salt "*" state.sls top 


#TODO make the setup run through docker command

docker build -t saltmaster -f SaltMaster_DockerFile  .
docker run --hostname saltmaster --name saltmaster -d saltmaster

#TODO - remove the old cached keys from Salt master as cleanup post challenge is completed.
# docker exec salt-master salt-run manage.down removekeys=True

