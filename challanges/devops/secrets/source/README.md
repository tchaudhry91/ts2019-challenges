Setup Challenge

See wiki for details
```
https://wiki.corp.adobe.com/display/TS2/Challenge+-+Vault
```


Vault "Hello World"
# https://learn.hashicorp.com/vault/getting-started/first-secret

Note: all the setup steps need to be run inside "ts2019-challenges-1/challanges/devops/secrets" folder

1. Cleanup exited docker container to avoid nameclash and Run Docker Server

```
docker container rm $(docker container ls -q -f 'status=exited')
docker build -t vaultserver  -f Vault_DockerFile .
docker run --name vaultserver --hostname vaultserver -d vaultserver

```

2. Setup Vault user docker which will be used for playing challenge

```
docker build -t challengeuser -f VaultUser_DockerFile .
docker volume create vault
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver --name vaultchallenge challengeuser
docker exec -it vaultchallenge /bin/sh
```


3. Setup Challenge1

```

docker build  -t vaultchallenge1  -f challenge1/VaultChallenge1_DockerFile .
docker run -d --link vaultserver:vaultserver vaultchallenge1
```

4. Setup Challenge2

```
a) Restart vault server to cleanup secrets from previous challenge
docker kill vaultserver && \
docker rm vaultserver && \
docker run --name vaultserver --hostname vaultserver -d vaultserver

b) Setup challengarena 

docker kill vaultchallenge && \
docker rm vaultchallenge && \
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver --name vaultchallenge challengeuser

c) Configure Challenge2 
cd ../challenge2
docker build  -t vaultchallenge2  -f VaultChallenge2_DockerFile .
docker run -d --link vaultserver:vaultserver vaultchallenge
```


5. Setup Challenge3

```
a) Restart vault server to cleanup secrets from previous challenge
docker kill vaultserver && \
docker rm vaultserver && \
docker run --name vaultserver --hostname vaultserver -d vaultserver

b) Setup challengarena 

docker kill vaultchallenge && \
docker rm vaultchallenge && \
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver --name vaultchallenge challengeuser

c) Setup  
docker build -t vaultchallenge3 -f VaultChallenge3_DockerFile . && \
docker volume create vault && \
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver vaultchallenge3
d) Login 
docker exec -it vaultchallenge /bin/sh
```


#TODO Cleanup post challenge is over - need to cleanup

* Notes for volunteers
