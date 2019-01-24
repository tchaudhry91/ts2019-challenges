#!/usr/bin/env bash

set -e

export VAULT_ADDR=http://vaultserver:8200/

# Insert secret for challenge
vault login root
vault kv put secret/galaxy/savior/key/lies/here key=8946d35959a95bc8dcb33b71bfc88be7

# Dummy keys
vault kv put secret/galaxy/diana/key key=deadend
vault kv put secret/galaxy/sophie/key key=anotherdeadend

# For debug purposes only in case we don't want container to die
#exec tail -f /dev/null

# Cheatsheet user need to search among some dummy keys putup in kv secrets engine
# # vault kv get secret/galaxy/savior/key/lies/here
