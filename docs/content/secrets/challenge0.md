+++
title = "Challenge 0"
weight = 4
+++

### Hello World.

Star-lord should verify the status of the Vault system.

1. `vault status`: displays the current status of the vault system which client is interacting with.

```bash

# vault status
Expected Output:
Key             Value
---             -----
Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         0.11.5
Cluster Name    vault-cluster-81a0bfca
Cluster ID      eb1f59e2-00b1-82fd-427f-9d8c977b9d19
HA Enabled      false
```

If you got the expected response form the vault system, you are ready to dive into the challenges.

2. Flag is version of the vault server displayed on the output of command run before (remove the "." e.g.= 0.11.5 will become 0115)

```
dcorchestration<vault-version>
```

More info: If you are interested to get a primer about vault secret management tool, please see [link](https://www.hashicorp.com/resources/journey-vault-1-0) 