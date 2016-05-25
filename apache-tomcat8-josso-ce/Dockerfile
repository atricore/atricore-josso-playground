FROM atricore/josso:apache-tomcat8

MAINTAINER Gianluca Brigandi <gianluca@atricore.com>

ENV JOSSO_VERSION 2.4.1

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
