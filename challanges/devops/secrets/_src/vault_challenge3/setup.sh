#!/usr/bin/env bash

set -e

export VAULT_ADDR=http://vaultserver:8200/
export MOUNTED_VOL="/mount"

# Insert secret for challenge
vault login root
vault kv put secret/iam/groot/nova key="pS3px4F2UI9k4QX1tduWLZIi"
vault kv get -wrap-ttl=3600 -format=json secret/iam/groot/nova | jq -r ".wrap_info.token" > wraptoken
vault kv put secret/galaxy/raone/yondu pathtogalaxysavior=$(cat wraptoken)

vault policy write darex /opt/c3_policy.hcl
vault token create -policy=darex -format json | jq -r ".auth.client_token" > ${MOUNTED_VOL}/breadcrumb

#TODO Find a way to provide this initial key to solve as initial
# May be create a shared volume and copy the key and expose it

# Dummy keys
vault kv put secret/galaxy/raone/key key=deadend
vault kv put secret/galaxy/raone/key1 key=nosecrethere

#For debugging
tail -f /dev/null



# Delete the traces now
rm /opt/c3_policy.hcl wraptoken

# cheatsheet user need to login with the policy token written in file clueforlord
# need to access the secret lying at secret/galaxy/raone/yondu
# The secret is used to unwrap the flag to the challenge
#
