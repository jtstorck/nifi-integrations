FROM openjdk:8-jdk-alpine
RUN apk --no-cache add curl
WORKDIR /tmp

# Download and decompress the Schema Registry archive
RUN curl -LO https://github.com/hortonworks/registry/releases/download/v0.8.1-rc1/hortonworks-registry-0.8.1.tar.gz
WORKDIR /schema-registry
RUN tar zxf /tmp/hortonworks-registry-0.8.1.tar.gz -C . --strip-components 1

# Copy the SR configuration for enabling kerberos in SR
ADD resources/registry-dev-kerberos.yaml /schema-registry/conf/registry-dev-kerberos.yaml
ADD resources/krb5.conf /etc/krb5.conf

ENTRYPOINT ["echo", "Schema Registry has been configured"]