Setup Challenge

See wiki for details
```
https://wiki.corp.adobe.com/display/TS2/Challenge+-+Vault
```


Vault "Hello World"
## https://learn.hashicorp.com/vault/getting-started/first-secret

1. Cleanup exited docker container to avoid nameclash and Run Docker Server

```
docker container rm $(docker container ls -q -f 'status=exited')
cd <root>/ts2019-challenges/challanges/devops/secrets
```

2. Setup Challenge0
a) Run vaultserver
```
cd ts2019-challenges/challanges/devops/secrets
docker build -t vaultserver  -f VaultServer_DockerFile . && \
docker run --name vaultserver --hostname vaultserver -d vaultserver
```

b) Setup challengarena
```
docker build -t vaultclient -f VaultClient_DockerFile . && \
docker volume create vault && \
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver --name vaultclient vaultclient
```
c) ssh to vault client access vault server
```
docker exec -it vaultclient /bin/sh
```


3. Setup Challenge1

a) Configure Challenge1
```
cd challenge1 && \
docker build  -t vaultchallenge1  -f VaultChallenge1_DockerFile . && \
docker run -d --link vaultserver:vaultserver vaultchallenge1
```
b) ssh to vault client access vault server
```
docker exec -it vaultchallenge /bin/sh
```

4. Setup Challenge2

```
a) Restart vault server to cleanup secrets from previous challenge
docker kill vaultserver && \
docker rm vaultserver && \
docker run --name vaultserver --hostname vaultserver -d vaultserver
```
b) Setup challengarena
```
docker kill vaultclient && \
docker rm vaultclient && \
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver --name vaultclient vaultclient
```
c) Configure Challenge2
```
cd ../challenge2  && \
docker build  -t vaultchallenge2  -f VaultChallenge2_DockerFile . && \
docker run -d --link vaultserver:vaultserver vaultchallenge2
```
d) ssh to vault client access vault server
```
docker exec -it vaultclient /bin/sh
```


5. Setup Challenge3

```
a) Restart vault server to cleanup secrets from previous challenge
docker kill vaultserver && \
docker rm vaultserver && \
docker run --name vaultserver --hostname vaultserver -d vaultserver

b) Setup challengarena

docker kill vaultclient && \
docker rm vaultclient && \
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver --name vaultclient vaultclient

c) Setup  
docker build -t vaultchallenge3 -f VaultChallenge3_DockerFile . && \
docker volume create vault && \
docker run -d --mount source=vault,destination=/mount --link vaultserver:vaultserver vaultchallenge3
d) Login
docker exec -it vaultchallenge /bin/sh
```


#TODO Cleanup post challenge is over - need to cleanup
