FROM apache/nifi:1.11.0-SNAPSHOT-dockermaven
ADD scripts/custom-start.sh /opt/nifi/scripts/custom-start.sh
ENTRYPOINT ["/opt/nifi/scripts/custom-start.sh"]