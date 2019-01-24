#!/usr/bin/env bash

set -e

export VAULT_ADDR=http://vaultserver:8200/

# Insert secret for challenge
vault login root
vault policy write nebula /opt/c2_policy.hcl
vault token create -policy=nebula -format json | jq -r ".auth.client_token" > cubbyhole_secret

vault login $(cat cubbyhole_secret)
vault write cubbyhole/rocket/drax key="123-456-7890"
vault login root
vault kv put secret/drax/left/clue/here path=cubbyhole/rocket/drax key=$(cat cubbyhole_secret)

# Dummy keys
vault kv put secret/galaxy/user/key key=deadend
vault kv put secret/galaxy/user/key1 key=anotherdeadend

rm /opt/c2_policy.hcl cubbyhole_secret
# exec tail -f /dev/null

# cheatsheet user need to kv secrets and fetch the key using which actual secret is kept in cubbyhole. Once the policy key is found user
# need to get into cubbyhole secret to get it,
# cubbyhole secret cannot be accessed by root
# vault kv get secret/drax/left/clue/here & vault login <> & vault read cubbyhole/rocket/drax
