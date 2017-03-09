FROM       alpine
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
ARG        DIST_MIRROR=http://archive.apache.org/dist/nifi
ARG        VERSION=0.7.0
ENV        NIFI_HOME=/opt/nifi \
           JAVA_HOME=/usr/lib/jvm/java-1.7-openjdk \
           PATH=$PATH:/usr/lib/jvm/java-1.7-openjdk/jre/bin:/usr/lib/jvm/java-1.7-openjdk/bin
RUN        apk update && apk add --upgrade bash curl openjdk7 && \
           mkdir -p ${NIFI_HOME} && \
           curl ${DIST_MIRROR}/${VERSION}/nifi-${VERSION}-bin.tar.gz | tar xvz -C ${NIFI_HOME} && \
           mv ${NIFI_HOME}/nifi-${VERSION}/* ${NIFI_HOME} && \
           rm -rf ${NIFI_HOME}/nifi-${VERSION} && \
           rm -rf *.tar.gz && \
           rm -rf /var/cache/apk/*
EXPOSE     8080 8081 8443
VOLUME     ${NIFI_HOME}/logs \
           ${NIFI_HOME}/flowfile_repository \
           ${NIFI_HOME}/database_repository \
           ${NIFI_HOME}/content_repository \
           ${NIFI_HOME}/provenance_repository
WORKDIR    ${NIFI_HOME}
CMD        ./bin/nifi.sh run
