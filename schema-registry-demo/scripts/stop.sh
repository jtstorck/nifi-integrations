#!/bin/bash

# get directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker-compose -f $SCRIPT_DIR/../docker-compose.yml down

# stop docker-kdc
source $SCRIPT_DIR/../work/docker-kdc/kdc stop

docker network rm schema-registry-network