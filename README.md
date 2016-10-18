# docker-hdf ![](https://images.microbadger.com/badges/version/xemuliam/docker-hdf:2.0.svg) ![](https://images.microbadger.com/badges/image/xemuliam/docker-hdf:2.0.svg)
Base and clean [Docker](https://www.docker.com/what-docker) image for [Hortonworks DataFlow](http://hortonworks.com/products/data-center/hdf/) based on Alpine and OpenJDK


                      ##           .
                  ## ## ##         ==
               ## ## ## ## ##     ===
           /"""""""""""""""""\____/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~~ /  ===- ~~~
           \______ o   HDF      __/
             \    \    2.0   __/
              \____\________/


# Overview

Dockerized single-host HDF.

Deployment options out of the box:
- Standalone NiFi node

Can work under Kitematic


# Exposed ports

- 8080 - HDF web application port
- 8443 - HDF web application secure port


# Official Apache NiFi Documentation and Guides

- [Overview](https://nifi.apache.org/docs.html)
- [User Guide](https://nifi.apache.org/docs/nifi-docs/html/user-guide.html)
- [Expression Language](https://nifi.apache.org/docs/nifi-docs/html/expression-language-guide.html)
- [Development Quickstart](https://nifi.apache.org/quickstart.html)
- [Developer's Guide](https://nifi.apache.org/developer-guide.html)
- [System Administrator](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html)


# Usage

This image can either be used as a base image for building on top of HDF or just to experiment with. I personally have not attempted to use this in a production use case.


# Pre-Requisites
Ensure the following pre-requisites are met (due to some blocker bugs in earlier versions). As of today, the latest Docker Toolbox and Homebrew are fine.

- Docker 1.10+
- Docker Machine 0.6.0+
- Kitematic 0.12

(all downloadable as a single [Docker Toolbox](https://www.docker.com/products/docker-toolbox) package as well)


# How to use

To try out NiFi on Docker:

1. Start Kitematic
2. Enter `xemuliam` in serach box
3. Choose `hdf-base` image
4. Click `Create` button

Kitematic will assign all ports and you'll be able to run HDF web-interface directly from Kitematic.


# Enjoy! :)

