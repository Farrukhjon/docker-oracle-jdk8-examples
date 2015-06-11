FROM ubuntu:latest

MAINTAINER farrukhjon SATTOROV firedandy@gmail.com

# Install wget
RUN apt-get --quiet update && \
    apt-get --quiet --yes install wget && \
    apt-get clean

# Install JDK 8 
RUN wget --quiet \
         --output-document=/jdk-8.tar.gz \
         --no-check-certificate \
         --no-cookies \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz && \
    mkdir -p /usr/lib/jvm && \
    tar --gunzip --extract --verbose --file /jdk-8.tar.gz --directory /usr/lib/jvm && \
    rm -f /jdk-8.tar.gz && \
    chown -R root:root /usr/lib/jvm

# set the environment variables 
ENV JDK_HOME /usr/lib/jvm/jdk1.8.0_45 
ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_45
ENV PATH $PATH:$JAVA_HOME/bin

# export meta-data about this container
ENV FARRUKH_JAVA_VENDOR Oracle 
ENV FARRUKH_JAVA_VERSION 1.8.0_45 
