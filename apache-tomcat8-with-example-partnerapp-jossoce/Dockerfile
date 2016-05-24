FROM atricore/josso:apache-tomcat8

MAINTAINER Gianluca Brigandi <gianluca@atricore.com>

# Install JOSSO CE in 'passive' mode intended to allow activation from the real JOSSO CE Server
ADD josso-ce-2.4.1.options /tmp/
RUN wget --no-cookies http://sourceforge.net/projects/josso/files/JOSSO%202/JOSSO-2.4.1/josso-ce-2.4.1-unix.jar -O /tmp/josso-ce-2.4.1-unix.jar
RUN java -jar /tmp/josso-ce-2.4.1-unix.jar -options /tmp/josso-ce-2.4.1.options
EXPOSE 8081

RUN chmod 700 /opt/atricore/josso-ce-2.4.1/bin/atricore
RUN chmod 700 /opt/atricore/josso-ce-2.4.1/bin/start

# Launch JOSSO CE and Tomcat
CMD /opt/atricore/josso-ce-2.4.1/bin/start && /opt/tomcat/bin/catalina.sh run
