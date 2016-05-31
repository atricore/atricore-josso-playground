FROM java:8

MAINTAINER Gianluca Brigandi <gianluca@atricore.com>

# Set locales
ENV LANG en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Copy the JOSSified Tomcat instance
COPY tomcat2.tgz /tmp/tomcat2.tgz

# Uncompress
RUN tar xzvf /tmp/tomcat2.tgz -C /opt
RUN mv /opt/tomcat2  /opt/tomcat
RUN rm /tmp/tomcat2.tgz

# Remove garbage
RUN rm -rf /opt/tomcat/webapps/examples
RUN rm -rf /opt/tomcat/webapps/docs
RUN rm -rf /opt/tomcat/webapps/ROOT

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
EXPOSE 8009
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
