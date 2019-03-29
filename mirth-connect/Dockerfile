# https://hub.docker.com/r/brandonstevens/mirth-connect/
FROM openjdk:8

ENV MIRTH_CONNECT_VERSION 3.7.1.b243

# Mirth Connect is run with user `connect`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN useradd -u 1000 mirth

# update and install requirements
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget 

# grab gosu for easy step-down from root
RUN set -eux; \
	apt-get install -y gosu; \
	rm -rf /var/lib/apt/lists/*; \
# verify that the binary works
	gosu nobody true

VOLUME /opt/mirth-connect/appdata

RUN \
  cd /tmp && \
  wget http://downloads.mirthcorp.com/connect/$MIRTH_CONNECT_VERSION/mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  tar xvzf mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  rm -f mirthconnect-$MIRTH_CONNECT_VERSION-unix.tar.gz && \
  mv Mirth\ Connect/* /opt/mirth-connect/ && \
  chown -R mirth /opt/mirth-connect

WORKDIR /opt/mirth-connect

# set spool volume for messages exchange with Docker host ----
RUN mkdir /var/spool/mirth
RUN chown -R mirth /var/spool/mirth
VOLUME /var/spool/mirth
# ----

EXPOSE 8080 8443

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["java", "-jar", "mirth-server-launcher.jar"]
