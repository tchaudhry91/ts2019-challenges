+++
title = "Challenge 2"
weight = 10
+++

### Retrieve a secret from a Vault cubbyhole

Star-lord is challenged to look for Thanos stored challenge in cubbyhole aka cubby and coax him to reveal the key to get out of this maze. The path to the cubbyhole is hidden in a key value secret engine which is hidden inside a deep route.

About vault cubbyhole secret engine: The vault cubbyhole secrets engine is used to store arbitrary secrets. No token (even root) can access another token's cubbyhole. When the token expires, its cubbyhole is destroyed.

To start the challenge you have to power to login as root.

1. As before, login as root
  - `vault login root`

2. Once you are authenticated try to look out for the token which has in hidden inside "/secret" path of kv secret engine.
  - `vault kv get`
  - `vault kv list`

3. Once you have got the secret , login with token which have access to the cubbyhole
  - `vault login <token_retrieved_in_step_2>`

4. Find and retrieve the key inside the cubbyhole to solve the challenge
 - `vault read cubbyhole`



