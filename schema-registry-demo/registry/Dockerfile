FROM schema-registry-sr-demo:latest
VOLUME ["/keytabs"]
WORKDIR /schema-registry
EXPOSE 9090 9091
ENTRYPOINT ["sh", "/schema-registry/bin/registry-server-start.sh", "./conf/registry-dev-kerberos.yaml"]