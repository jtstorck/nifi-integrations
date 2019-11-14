#!/bin/bash

# get directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source $SCRIPT_DIR/setup-docker-kdc.sh

docker-compose -f $SCRIPT_DIR/../docker-compose.yml up --build -d
