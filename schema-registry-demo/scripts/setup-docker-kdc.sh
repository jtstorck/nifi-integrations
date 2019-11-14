#!/bin/bash

# get directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd $SCRIPT_DIR || return

# make directory for mounting in containers to share keytabs
mkdir -p ../work/keytabs

git clone https://github.com/tillt/docker-kdc ../work/docker-kdc
cd ../work/docker-kdc || return
git fetch origin pull/10/head:docker-kdc-mac
git checkout docker-kdc-mac


KDC_CONFIG=$SCRIPT_DIR/../resources/kdc.json

./kdc build

