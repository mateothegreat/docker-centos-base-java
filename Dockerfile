#
# docker build -t yomateo/centos-base-java:testing .
#
FROM centos:7

#
# http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html
#
ENV JAVA_VERSION 8u60
ENV BUILD_VERSION b27

RUN yum -y install wget which net-tools unzip supervisor && \
    wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm && \
    yum -y install /tmp/jdk-8-linux-x64.rpm && \
    yum -y clean all
    
RUN /bin/dbus-uuidgen > /etc/machine-id
