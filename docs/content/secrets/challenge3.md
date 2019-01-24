+++
title = "Challenge 3"
weight = 15
+++

### Use Vault's unwrap command to unlock master key

Star-lord is tasked to go across galaxy with limited access. This time Thanos has wrapped the key to unlock the galaxy secret. To help Nova has left a clue in the kv locker which if unearthed will pave the way to find and retrieve the master key.
The access is controlled via policy. 

Star Lord's need to follow the trail with hints given below to recover 

  1) `vault kv list PATH`: list files from the specified path

  2) `vault kv get PATH/FILE`: fetch data from the specified file

  3) `vault unwrap TOKEN`: unwraps a wrapped secret from Vault by the given token. The result is the same as the "vault read" operation on a non-wrapped secret. If no token is given, the data in the currently authenticated token is unwrapped.

Use the unwrapped key to unearth the secret. The path to the wrapped secret also needs to be found out.

More about vault unwrap 
The unwrap command unwraps a wrapped secret from Vault by the given token. The result is the same as the "vault read" operation on the non-wrapped secret. If no token is given, the data in the currently authenticated token is unwrapped.

Read more about vault policy which can be used to provide fine grain access of secrets - see [link](https://www.vaultproject.io/docs/concepts/policies.html)

More Hints:
**