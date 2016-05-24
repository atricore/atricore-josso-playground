FROM atricore/josso:oracle-java8

MAINTAINER Gianluca Brigandi <gianluca@atricore.com>

ENV TOMCAT_VERSION 8.0.33
ENV JOSSO_VERSION 2.4.1

# Set locales
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_CTYPE en_GB.UTF-8

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update
RUN apt-get install -y git build-essential curl wget software-properties-common

# Get Tomcat
RUN wget --no-check-certificate --no-cookies http://apache.mirror.iphh.net/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz

# Uncompress
RUN tar xzvf /tmp/tomcat.tgz -C /opt
RUN mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat
RUN rm /tmp/tomcat.tgz

# Remove garbage
RUN rm -rf /opt/tomcat/webapps/examples
RUN rm -rf /opt/tomcat/webapps/docs
RUN rm -rf /opt/tomcat/webapps/ROOT

# Add admin/admin user
ADD tomcat-users.xml /opt/tomcat/conf/

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# Install JOSSO CE in 'passive' mode intended to handle activation requests
ADD josso-ce-${JOSSO_VERSION}.options /tmp/
RUN wget --no-check-certificate --no-cookies http://sourceforge.net/projects/josso/files/JOSSO%202/JOSSO-${JOSSO_VERSION}/josso-ce-${JOSSO_VERSION}-unix.jar -O /tmp/josso-ce-${JOSSO_VERSION}-unix.jar
RUN java -jar /tmp/josso-ce-${JOSSO_VERSION}-unix.jar -options /tmp/josso-ce-${JOSSO_VERSION}.options
RUN chmod 700 /opt/atricore/josso-ce-${JOSSO_VERSION}/bin/atricore
RUN chmod 700 /opt/atricore/josso-ce-${JOSSO_VERSION}/bin/start
EXPOSE 8081

ENV JAVA_OPTS -Djava.security.egd=file:/dev/urandom

# Launch JOSSO CE and Tomcat
CMD /opt/atricore/josso-ce-${JOSSO_VERSION}/bin/start && /opt/tomcat/bin/catalina.sh run
