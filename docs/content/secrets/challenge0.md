+++
title = "Challenge 0"
weight = 4
+++

### Hello World.

1. Star-lord should start Vault Server and Client using the following:

    - ` ./start-vaultchallenge0.sh`
    - ` ./login-vault-client.sh`

2. Verify the status of the Vault system.

    - `vault status`: displays the current status of the system.

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

