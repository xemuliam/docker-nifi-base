# NiFi-base ![](https://images.microbadger.com/badges/version/xemuliam/nifi-base:0.7.1.svg) ![](https://images.microbadger.com/badges/image/xemuliam/nifi-base:0.7.1.svg)
Basic and clean [Docker](https://www.docker.com/what-docker) image for [Apache NiFi](http://nifi.apache.org), based on [Alpine](http://alpinelinux.org) and [OpenJDK](http://openjdk.java.net)

                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o   NiFi    __/
             \    \   0.7.1 __/
              \____\_______/

# Overview

Dockerized single-host NiFi.

Deployment options out of the box:
- Standalone NiFi node

Can work under Kitematic


## Version 0.7.1
Version 0.7.1 of Apache NiFi focuses on addressing defects and security related improvements.

Release Date: October 20, 2016

Highlights of the 0.7.1 release include:
- Important stability improvements
 - Improved specific exception handling situations and synchronization in the content repository to avoid data loss.
 - Improved stability of provenance repository when handling exceptions during indexing of events.
- Improvements to existing capabilities
 - Added SSL/TLS support to Kafka processors.
 - Added features to ConsumeKafka to better align with features in GetKafka.
 - Improved ConsumeJMS to copy message properties into flowfile attributes, and to support more message  - acknowledgement modes.
 - Improved ConsumeJMS and PublishJMS for expression language support of destination name.
 - Various improvements to JoltTransformJSON, PutS3Object, ListS3, ListFile, ModifyBytes and PutEmail  -  - processors.
 - Deprecated some public API methods that were removed in the 1.0.0 release.
- Defects addressed
 - Fixed SiteToSiteReportingTask to not send duplicate events.
 - Fixed issue where controller services that reference other controller services could be disabled on NiFi restart.
 - Fixed issue with PublishKafka and PutKafka sending a flowfile to 'success' when it did not actually send the file to Kafka.
 - Fixed issue that multiple HDFS processors could not work with different HDFS clusters.
 - Fixed various issues with Kafka processors.
 - Fixed GetHTTP and PostHTTP to use the SSL/TLS Protocol property of its SSLContextService.
 - Fixed UnpackContent issues where it did not work with flowfile-stream or flowfile-tar content, and fixed concurrency issue.
 - Fixed ListenHTTP to avoid leaking threads when attempting to bind to an address already in use.

A full list of issues that were resolved can be found at https://issues.apache.org/jira/secure/ReleaseNote.jspa?projectId=12316020&version=12338025


# Exposed ports

- 8080 - NiFi web application port
- 8081 - NiFi ListenHTTP processor port
- 8443 - NiFi web application secure port


# Official Documentation and Guides

- [Overview](https://nifi.apache.org/docs.html)
- [User Guide](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html)
- [Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html)
- [Development Quickstart](https://nifi.apache.org/quickstart.html)
- [Developer's Guide](https://nifi.apache.org/developer-guide.html)
- [System Administrator](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html)


# ListenHTTP Processor

The standard library has a built-in processor for an HTTP endpoint listener. That processor is named [ListenHTTP](https://nifi.apache.org/docs/nifi-docs/components/org.apache.nifi.processors.standard.ListenHTTP/index.html). You should set the *Listening Port* of the instantiated processor to `8081` if you follow the instructions from above.


# Usage

This image can either be used as a base image for building on top of NiFi or just to experiment with. I personally have not attempted to use this in a production use case.


# Pre-Requisites
Ensure the following pre-requisites are met (due to some blocker bugs in earlier versions). As of today, the latest Docker Toolbox and Homebrew are fine.

- Docker 1.10+
- Docker Machine 0.6.0+
- Kitematic 0.12

(all downloadable as a single [Docker Toolbox](https://www.docker.com/products/docker-toolbox) package as well)


# How to use from Kitematic

1. Start Kitematic
2. Enter `xemuliam` in serach box
3. Choose `nifi-base` image
4. Choose tag `0.7.1`
5. Click `Create` button

Kitematic will assign all ports and you'll be able to run NiFi web-interface directly from Kitematic.


# How to use from Docker CLI

1. Start Docker Quickstart Terminal
2. Run command  `docker run -d -p 8080:8080 -p 8081:8081 -p 8443:8443 xemuliam/nifi-base:0.7.1`
3. Check Docker machine IP  `docker-machine ls`
4. Use IP from previous step in address bar of your favorite browser ` http://192.168.99.100:8080/nifi`

# Enjoy! :)
