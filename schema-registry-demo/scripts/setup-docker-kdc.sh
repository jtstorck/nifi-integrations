#!/bin/bash

# get directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $SCRIPT_DIR || return

git clone https://github.com/jtstorck/docker-kdc ../work/docker-kdc
cd ../work/docker-kdc || return
git checkout specify-network

cp ${SCRIPT_DIR}/../resources/kdc.json ${SCRIPT_DIR}/../work/docker-kdc/kdc.json
KDC_NETWORK=schema-registry-demo-network

./kdc build

