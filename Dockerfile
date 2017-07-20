FROM ubuntu:17.04
MAINTAINER Chris Q

# Update repository source list
RUN apt-get update

# ubuntu contains zookeeper, build zookeeper into this image
RUN apt-get install -y zookeeper

# verification of image


# clear cache and delete folders with unnecessary files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# change Zookeeper log destination from file to console
# sed (stream editor) scripts and writes to output
# -i ???
RUN sed -i 's/ROLLINGFILE/CONSOLE/' /etc/zookeeper/conf/environment

# start zookeeper with single node
CMD [“/usr/share/zookeeper/bin/zkServer.sh”, “start-foreground”]

# Deploy Kafka
