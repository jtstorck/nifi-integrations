#!/bin/bash

# get directory of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

docker network create schema-registry-demo-network

# make directory for mounting in containers to share keytabs
mkdir -p $SCRIPT_DIR/../work/resources

source $SCRIPT_DIR/setup-docker-kdc.sh

# start docker-kdc
source $SCRIPT_DIR/../work/docker-kdc/kdc start

# copy the keytab to work/resources to make it available to other containers
docker cp kdc:/etc/docker-kdc/krb5.keytab $SCRIPT_DIR/../work/resources/schema-registry.keytab

# copy the kr5b.conf to build contexts that need it
cp $SCRIPT_DIR/../work/docker-kdc/krb5.conf $SCRIPT_DIR/../work/resources/krb5.conf

sed -i -e "s|127.0.0.1:48088|kdc:88|g" $SCRIPT_DIR/../work/resources/krb5.conf
cp $SCRIPT_DIR/../work/resources/krb5.conf $SCRIPT_DIR/../registry/setup/resources/krb5.conf

docker-compose -f $SCRIPT_DIR/../docker-compose.yml up --build -d
