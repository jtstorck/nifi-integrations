FROM tillt/docker-kdc:latest
RUN mkdir /keytabs
RUN cp /etc/docker-kdc/krb5.keytab /keytabs/schema-registry.keytab
RUN ls -al /keytabs
VOLUME ["/keytabs"]
