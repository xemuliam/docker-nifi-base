FROM		centos:centos7

MAINTAINER	Viacheslav Kalashnikov <xemuliam@gmail.com>

ENV		DIST_MIRROR http://public-repo-1.hortonworks.com
ENV		HDF_HOME /opt/hdf
ENV		VERSION 2.0.0.0
ENV		REVISION 579
ENV		BANNER_TEXT Docker-HDF-2.0
ENV		INSTANCE_ROLE single-node
ENV		NODES_LIST NA
ENV		MYID NA

RUN yum update -y &&\
  yum install -y java-1.8.0-openjdk-devel tar && \
  mkdir -p /opt/nifi && \
  curl ${DIST_MIRROR}/HDF/${VERSION}/HDF-${VERSION}-${REVISION}.tar.gz | tar xvz -C ${HDF_HOME} --strip-components=1 && \
  sed -i '/java.arg.1/a java.arg.15=-Djava.security.egd=file:/dev/./urandom' ${HDF_HOME}/nifi/conf/bootstrap.conf && \
  sed -i '/nifi.flow/s#conf/#flow/#g' ${HDF_HOME}/nifi/conf/nifi.properties && \
  mkdir ${HDF_HOME}/nifi/flow && \
  yum clean all

COPY start_hdf.sh /${HDF_HOME}/nifi/
COPY zookeeper.properties /${HDF_HOME}/nifi/conf/

EXPOSE 8080 8081

VOLUME ["/opt/datafiles","/opt/scriptfiles","/opt/certs", "${NIFI_HOME}/logs","${NIFI_HOME}/flowfile_repository", "${NIFI_HOME}/database_repository", "${NIFI_HOME}/content_repository", "${NIFI_HOME}/provenance_repository"]

WORKDIR ${NIFI_HOME}/nifi
RUN chmod +x ./start_hdf.sh
CMD ["./start_hdf.sh"]
