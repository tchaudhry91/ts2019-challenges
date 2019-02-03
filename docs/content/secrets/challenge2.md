+++
title = "Challenge 2"
weight = 5
+++

### Fetch a secret from the KV store by using `list/get`

Thanos has created a multi level grid to get into vault, the key to which is stored in a storehouse in vault. To solve the challenge Star lord to guess the path and retrieve the key. This will pave the path to future gates.

Star-lord friends are there to help him on the journey
0. Setup environment

```
ssh devops
cd /vagrant/challanges/devops/secrets/
./start.sh
```

1. Begin the challenge by starting  vault-server, vault-client and authenticating as root:

  - `./start-vaultchallenge2.sh`
  - `./login-vault-client.sh`
  - `vault login root`

2. Find the hidden key by using the following [commands](https://www.vaultproject.io/docs/commands/):
  - `vault kv list PATH`: list files from the specified path
  - `vault kv get PATH/FILE`: fetch data from the specified file

To get started, try running `vault kv list /secret` and keep going until you see the key!

_**Hint (if you are stuck at step-2)**_: vault kv secrets are stored in hierarchial paths, think unix files and directory
