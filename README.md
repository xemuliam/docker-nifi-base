# NiFi-base

- ![Version](https://images.microbadger.com/badges/version/xemuliam/nifi-base:1.1.0.svg) ![Layers](https://images.microbadger.com/badges/image/xemuliam/nifi-base:1.1.0.svg)


Basic and clean [Docker](https://www.docker.com/what-docker) image for [Apache NiFi](http://nifi.apache.org), based on [Alpine](http://alpinelinux.org) and [OpenJDK](http://openjdk.java.net)

                        ##         .
                  ## ## ##        ==
               ## ## ## ## ##    ===
           /"""""""""""""""""\___/ ===
      ~~~ {~~ ~~~~ ~~~ ~~~~ ~~~ ~ /  ===- ~~~
           \______ o   NiFi    __/
             \    \   1.1.0 __/
              \____\_______/

# Overview

Dockerized single-host NiFi.

Deployment options out of the box:
- Standalone NiFi node


## Version 1.1.0
Version 1.1.0 of Apache NiFi is a feature and stability focused release which builds on the great improvements and community progress of the 1.0 release.
Release Date: November 29, 2016
There are many changes in the 1.1.0 release with some highlights including:
- Core Framework Improvements
 - Cluster Management logic has been stabilized and improved to better support zero-master clustering.  For example, recovery time is faster now as we're not having to always wait some artificial length of time to see if any new nodes will join and thus we should reconsider which flow is the golden copy.
 - The expression language capability now supports decimals, base64 and hex encoded values, and math functions.
 - The flowfile, provenance, and content repositories have been reworked to support rollback.  We've always been careful to ensure that upgrades would work well where existing flow state would be honored but what was harder was supporting the ability to rollback where state was written via a new version of NiFi but the user decided to rollback to an older version.  This is now supported.  This powerful feature also sets the stage for future work to enable rolling upgrades and automated rollbacks!
 - Startup times for flows that have large backlogs should be far faster as the swap files have been reworked to provide summaries and avoid the need for full scans.
 - For developers, they can now indicate that their processor should be given an instance isolated classloader.  Some libraries, like Hadoop client and scripting engines as an example, use static variables that can pollute instances of processors on the graph.  This feature allows those cases to be easily overcome by enabling isolation per instance of a processor.  This also makes it really easy to expose classloader extension for custom jars to users.
 - For developers, there is now an ability to migrate in-flight process session state to another process session.  This will yield higher efficiency and makes for a far easier programming model for aggregation type patterns as seen in MergeContent, for example.
- User Experience Improvements
 - We now provide visual indication of queue growth relative to back pressure settings and when back pressure is engaged.  This will make the concept of congestion and back pressure far more intuitive and frankly it is just fun to see in the UI.  Definitely check this out.
 - After the 1.0.0 release several members of the community expressed how much they love the new look and feel but wished we had kept some of the colors.  Better and more intuitive color contrast is back.
 - Validation of components is now limited to occur only for components which are not scheduled to execute.  This results in much faster UX behavior as many of the operations one could do through the UI and REST API would result in expensive validation operations that were unnecessary.
 - Users can now export images of the provenance graphs.
 - Users can now use cron-scheduling for components even on primary node only tasks.
- Updated Versions of Dependencies
 - We now leverage the Azure Event Hubs 0.9.0 client library.
 - We now interact with Apache Spark using the 2.0.1 libraries.
 - We now interact with HDFS using the Apache Hadoop 2.7.3 libraries.
- New or Improved Processors
 - New Fetch and Put processors to interact with ElasticSearch 5.0 and new processors to execute Query and Scroll operations against ElasticSearch.
 - New processors to parse CEF formatted logs
 - The Extract Email processors now support TNEF formatted attachments.
 - New processor to validate CSV files.
 - The Apache Solr processors have been updated to support SSL and Kerberos.
 - New processors to act as client and server for Websockets.
- New Utility
 - In upgrading from 0.x to 1.x we provided a lot of capabilities to make the process easy and automatic.  However, we didn't account for migrating from the embedded use of zookeeper to an external instance.  We've now provided a utility that helps you migrate NiFi state from one zookeeper cluster to another.
 - Previously it was difficult to change the sensitive property key which is used to encrypt all sensitive properties contained within an actual flow configuration.  A utility now exists to easily convert from an old key to a new key which is a valuable piece of an overall security process.
- Security Improvements
 - NiFi now supports the concept of restricted components.  These are processors, controller services, reporting tasks that allow an authorized user to execute unsanitized code or access and alter files accessible by the NiFi user on the system NiFi is running.  Therefore, these components are tagged by the developer as restricted and when running NiFi in secure mode only an administrator must grant each user access to the policy allowing restricted component access.
 - Site-to-Site now improved to be helpful even when port-forwarding is utilized.  Very helpful for cases where an administrator might run NiFi with lower privileges but want external interaction to use well known privileged ports.
 - The policy management user experience has been improved to make it more intuitive what is happening in certain cases.
 - The encrypted configuration feature now has been extended to cover the Login Identity Provider capability.  This is really helpful for example so you can have your LDAP password only stored in encrypted form in the login provider configuration file. Additional work is planned for these encrypted configurations to make interaction with a Hardware Security Module available as well.

A full list of issues that were resolved can be found at: https://issues.apache.org/jira/secure/ReleaseNote.jspa?projectId=12316020&version=12337875


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
4. Click `Create` button

Kitematic will assign all ports and you'll be able to run NiFi web-interface directly from Kitematic.


# How to use from Docker CLI

1. Start Docker Quickstart Terminal
2. Run command  `docker run -d -p 8080:8080 -p 8081:8081 -p 8443:8443 xemuliam/nifi-base`
3. Check Docker machine IP  `docker-machine ls`
4. Use IP from previous step in address bar of your favorite browser, e.g. ` http://192.168.99.100:8080/nifi`

# Enjoy! :)
