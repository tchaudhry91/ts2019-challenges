+++
title = "Challenge 3"
weight = 10
+++

### Retrieve a secret from a Vault cubbyhole

Star-lord is again need to search for challenge stored in cubbyhole by Thanos.  The path and the login key to the cubbyhole is hidden inside a key value(kv) secret engine. This  will be in a deep route among few  deadends.

About vault cubbyhole secret engine: The vault cubbyhole secrets engine is used to store arbitrary secrets. No token (even root) can access another token's cubbyhole. When the token expires, its cubbyhole is destroyed.

To start the challenge you have to login to vault as root.

1. As before, begin with starting vault-server, vault-client and login as root
  - `./start-vaultchallenge2.sh`
  - `./login-vault-client.sh`
  - `vault login root`

2. Once you are authenticated try to look out for the token which is hidden inside "/secret" path of kv secret engine.
  
  - `vault kv list` - To list the keys in the vault kv secret use this command
  - `vault kv get` - To get the value of a key  use following command

    _**Hint**_: Get started with following command
    `vault kv list /secret`

3. Once you have got the secret , login with token which have access to the cubbyhole
  - `vault login <token-retrieved-from-step_2>`

4. Find and retrieve the key inside the cubbyhole to solve the challenge
 - `vault read cubbyhole/<path-retrieved-from-step2>`

5. Voila the Flag is revealed to you. Congrats for completing this challenge. 

If you are  interested further you may read more about vault [cubbyhole](https://www.vaultproject.io/docs/secrets/cubbyhole/index.html)

_**Hint (if you are stuck at step-2)**_: vault kv secrets are stored in hierarchial paths, think unix files and directory
