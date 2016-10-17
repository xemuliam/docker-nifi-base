FROM	centos:centos7

MAINTAINER	Viacheslav Kalashnikov <xemuliam@gmail.com>

ENV	DIST_MIRROR=http://public-repo-1.hortonworks.com \
	HDF_HOME=/opt/hdf \
	VERSION=2.0.0.0 \
	REVISION=579 \
	BANNER_TEXT=Docker-HDF-2.0 \
	INSTANCE_ROLE=single-node \
	NODES_LIST=localhost:2181,localhost:2182,localhost:2183 \
	MYID=1

RUN	yum update -y && \
	yum install -y java-1.8.0-openjdk-devel tar && \
	mkdir -p ${HDF_HOME} && \
	curl ${DIST_MIRROR}/HDF/${VERSION}/HDF-${VERSION}-${REVISION}.tar.gz | tar xvz -C ${HDF_HOME} --strip-components=2 && \
	sed -i '/java.arg.1/a java.arg.15=-Djava.security.egd=file:/dev/./urandom' ${HDF_HOME}/conf/bootstrap.conf && \
	sed -i '/nifi.flow/s#conf/#flow/#g' ${HDF_HOME}/conf/nifi.properties && \
	mkdir ${HDF_HOME}/flow && \
	yum clean all

COPY start_hdf.sh /${HDF_HOME}/
COPY zookeeper.properties /${HDF_HOME}/conf/

EXPOSE 8080 8081 8082 8083

VOLUME ["/opt/datafiles","/opt/scriptfiles","/opt/certs", "${HDF_HOME}/logs","${HDF_HOME}/flowfile_repository", "${HDF_HOME}/database_repository", "${HDF_HOME}/content_repository", "${HDF_HOME}/provenance_repository"]

WORKDIR ${HDF_HOME}
RUN chmod +x ./start_hdf.sh
CMD ["./start_hdf.sh"]
