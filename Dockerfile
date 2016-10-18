FROM       openjdk:alpine

MAINTAINER Viacheslav Kalashnikov <xemuliam@gmail.com>

ENV        DIST_MIRROR=http://public-repo-1.hortonworks.com \
           HDF_HOME=/opt/hdf \
           VERSION=2.0.0.0 \
           REVISION=579

RUN        mkdir -p ${HDF_HOME} && \
           curl ${DIST_MIRROR}/HDF/${VERSION}/HDF-${VERSION}-${REVISION}.tar.gz | tar xvz -C ${HDF_HOME} --strip-components=2 && \
           sed -i '/java.arg.1/a java.arg.15=-Djava.security.egd=file:/dev/./urandom' ${HDF_HOME}/conf/bootstrap.conf && \
           sed -i '/nifi.flow/s#conf/#flow/#g' ${HDF_HOME}/conf/nifi.properties && \
           mkdir ${HDF_HOME}/flow

EXPOSE 8080 88443

VOLUME ["/opt/datafiles","/opt/scriptfiles","/opt/certs", "${HDF_HOME}/logs","${HDF_HOME}/flowfile_repository", "${HDF_HOME}/database_repository", "${HDF_HOME}/content_repository", "${HDF_HOME}/provenance_repository"]

WORKDIR ${HDF_HOME}
CMD ["./bin/nifi.sh"]
