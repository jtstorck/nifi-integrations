#!/bin/bash

sed -i -e "s|^nifi\.kerberos\.krb5\.file=.*$|nifi\.kerberos\.krb5\.file=\/demo-resources\/krb5\.conf|" /opt/nifi/nifi-current/conf/nifi.properties

source /opt/nifi/scripts/start.sh