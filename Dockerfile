FROM       openjdk:alpine
MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>
LABEL      VERSION="2.0" \
           RUN="docker run -d -p 8080:8080 -p 8443:8443 xemuliam/hdf-base"
ENV        DIST_MIRROR=http://public-repo-1.hortonworks.com \
           HDF_HOME=/opt/hdf \
           VERSION=2.0.0.0 \
           REVISION=579
RUN        apk update && apk add --upgrade curl && \
           mkdir -p ${HDF_HOME} && \
           curl ${DIST_MIRROR}/HDF/${VERSION}/HDF-${VERSION}-${REVISION}.tar.gz | tar xvz -C ${HDF_HOME} && \
           mv ${HDF_HOME}/HDF-${VERSION}/nifi/* ${HDF_HOME} && \
           rm -rf *.tar.gz && \
           apk del curl && \
           rm -rf /var/cache/apk/*
EXPOSE     8080 8443
VOLUME     ${HDF_HOME}/logs \
           ${HDF_HOME}/flowfile_repository \
           ${HDF_HOME}/database_repository \
           ${HDF_HOME}/content_repository \
           ${HDF_HOME}/provenance_repository
WORKDIR    ${HDF_HOME}
CMD        ./bin/nifi.sh run
