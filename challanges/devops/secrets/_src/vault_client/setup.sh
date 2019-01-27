#!/usr/bin/env sh

set -e

export VAULT_ADDR=http://vaultserver:8200/

if [ -z '/mount' ];then

    mkdir /mount

fi

tail -f /dev/null
