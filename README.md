# NiFi-base

- ![Version](https://images.microbadger.com/badges/version/xemuliam/nifi-base:1.1.0.svg) ![Layers](https://images.microbadger.com/badges/image/xemuliam/nifi-base:1.1.0.svg)
- ![Version](https://images.microbadger.com/badges/version/xemuliam/nifi-base:1.0.0.svg) ![Layers](https://images.microbadger.com/badges/image/xemuliam/nifi-base:1.0.0.svg)
- ![Version](https://images.microbadger.com/badges/version/xemuliam/nifi-base:0.7.1.svg) ![Layers](https://images.microbadger.com/badges/image/xemuliam/nifi-base:0.7.1.svg)

Basic and clean [Docker](https://www.docker.com/what-docker) image for [Apache NiFi](http://nifi.apache.org), based on [Alpine](http://alpinelinux.org) and [OpenJDK](http://openjdk.java.net)

                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o           __/
             \    \         __/
              \____\_______/

# Overview

Dockerized single-host NiFi.

Deployment options out of the box:
- Standalone NiFi node


# Exposed ports

- 8080 - NiFi web application port
- 8081 - NiFi ListenHTTP processor port
- 8443 - NiFi web application secure port


# Volumes

All below volumes can be mounted to docker host machine folders or shared folders to easy maintain data inside them. 

NiFi-specific:
- /opt/nifi/logs
- /opt/nifi/flowfile_repository
- /opt/nifi/database_repository
- /opt/nifi/content_repository
- /opt/nifi/provenance_repository


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

Please use corresponding branches from this repo to play with code.


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
4. Click `Create` button

Kitematic will assign all ports and you'll be able to run NiFi web-interface directly from Kitematic.


# How to use from Docker CLI

1. Start Docker Quickstart Terminal
2. Run command  `docker run -d -p 8080:8080 -p 8081:8081 -p 8443:8443 xemuliam/nifi-base`
3. Check Docker machine IP  `docker-machine ls`
4. Use IP from previous step in address bar of your favorite browser, e.g. ` http://192.168.99.100:8080/nifi`

# Enjoy! :)
