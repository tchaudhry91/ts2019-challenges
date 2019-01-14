+++
title = "Challenge 3"
weight = 15
+++

### Use Vault's unwrap command to unlock master key

Star-lord is tasked to go across galaxy with limited access. This time Thanos has wrapped the key to unlock the galaxy secret. To help Nova has left a clue in the kv locker which if unearthed will pave the way to find and retrieve the master key.

Star Lord's friends have given him the following tools for this task:

  - `vault kv list PATH`: list files from the specified path

  - `vault kv get PATH/FILE`: fetch data from the specified file

  - `vault unwrap TOKEN`: unwraps a wrapped secret from Vault by the given token. The result is the same as the "vault read" operation on a non-wrapped secret. If no token is given, the data in the currently authenticated token is unwrapped.

Use the unwrapped key to unearth the secret. The path to the wrapped secret also needs to be found out.

