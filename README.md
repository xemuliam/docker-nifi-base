# docker-hdf ![](https://images.microbadger.com/badges/version/xemuliam/docker-hdf:2.0.svg) ![](https://images.microbadger.com/badges/image/xemuliam/docker-hdf:2.0.svg)
[Docker](https://www.docker.com/what-docker) image for [Hortonworks DataFlow](http://hortonworks.com/products/data-center/hdf/) based on CentOs and OpenJDK


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
No SSL! No scaling!

Deployment options out of the box:
- Standalone NiFi node
- Single-host NiFi cluster which contains three NiFi nodes on different Docker containers

All above items can work under Kitematic


# Exposed ports

- 10101, 10102, 10103 - site to site communication port
- 10201, 10202, 10203 - cluster node protocol port
- 8080, 8081, 8082, 8083 - NiFi web application port


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
3. Choose `docker-hdf` image
4. Click `Create` button

Kitematic will assign all ports and you'll be able to run HDF web-interface directly from Kitematic.

By default you will get singe-node HDF instance.
If you need to play with cluster it is required to follow next steps:

1. Repeat steps from list above to create three containers
2. Go to each container settings and make above changes:
  - Change MYID parameter according to next rule: each container should have unique MYID number within range 1..3
  - Change INSTANCE_ROLE parameter to `cluster-node`
  - Change BANNER_TEXT to be able to recognize each node from first look
  - Click SAVE button to apply changes and reload of container content

# Enjoy! :)

