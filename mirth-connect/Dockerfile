FROM openjdk:11-jre

ENV MIRTH_CONNECT_VERSION 4.4.1.b310

# Mirth Connect is run with user `connect`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN useradd -u 1000 mirth && \
  # then update and install requirements
  apt-get update && \
  apt-get install -y --no-install-recommends ca-certificates wget && \
  # grab gosu for easy step-down from root
  set -eux && \
	apt-get install -y gosu && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  # verify that the binary works
	gosu nobody true

VOLUME /opt/mirth-connect/appdata

# Install Mirth-Connect
RUN \
  cd /tmp && \
  wget https://s3.amazonaws.com/downloads.mirthcorp.com/connect/$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  tar xvzf mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  rm -f mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  mkdir -p /opt/mirth-connect && \
  mv Mirth\ Connect/* /opt/mirth-connect/ && \
  chown -R mirth /opt/mirth-connect

# remove unused client & set options and data volume
WORKDIR /opt/mirth-connect
RUN rm -rf cli-lib manager-lib && \
    rm mirth-cli-launcher.jar mirth-manager-launcher.jar mccommand mcmanager && \
    # set spool volume for messages exchange with Docker host ----
    mkdir /var/spool/mirth && \
    chown -R mirth /var/spool/mirth

VOLUME /var/spool/mirth
EXPOSE 8080 8443

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["java", "-jar", "mirth-server-launcher.jar"]
