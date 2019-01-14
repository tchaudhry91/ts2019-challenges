+++
title = "Challenge 1"
weight = 5
+++

### Fetch a secret from the KV store by using `list/get`

Thanos has created a multi level grid to get into vault, the key to which is stored in a storehouse in vault. To solve the challenge Star lord to guess the path and retrieve the key. This will pave the path to future gates.

Star-lord friends are there to help him on the journey

1. Start the challenge by authenticating as root:
  - `vault login root`

2. Find the hidden key by using the following [commands](https://www.vaultproject.io/docs/commands/):
  - `vault kv list PATH`: list files from the specified path
  - `vault kv get PATH/FILE`: fetch data from the specified file

To get started, try running `vault kv list /secret`.
