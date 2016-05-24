#
# Oracle Java 8 on Ubuntu 
#
FROM ubuntu:trusty

MAINTAINER Gianluca Brigandi <gianluca@atricore.com>

# Install Java.
RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update && \
  apt-get install -y wget && \
  wget --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73-linux-x64.tar.gz && \
  mkdir -p /opt/jdk && \
  tar -zxf jdk-8u73-linux-x64.tar.gz -C /opt/jdk && \
  update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_73/bin/java 100 && \
  update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_73/bin/javac 100

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /opt/jdk/jdk1.8.0_73

# Define default command.
CMD ["bash"]

