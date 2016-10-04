#
# JOSSO CE 2.4.2
#

# Pull base image.
FROM atricore/josso:oracle-java8

MAINTAINER Gianluca Brigandi <gianluca@atricore.com>

ADD josso-ce-2.4.2.options /tmp/

RUN wget -q --no-cookies --no-check-certificate http://sourceforge.net/projects/josso/files/JOSSO%202/JOSSO-2.4.2/josso-ce-2.4.2-unix.jar -O /tmp/josso-ce-2.4.2-unix.jar

RUN java -jar /tmp/josso-ce-2.4.2-unix.jar -options /tmp/josso-ce-2.4.2.options

EXPOSE 1099
EXPOSE 1527
EXPOSE 8081
EXPOSE 8101
EXPOSE 41041
EXPOSE 44444
EXPOSE 52416

RUN chmod 700 /opt/atricore/josso-ce-2.4.2/bin/atricore
RUN chmod 700 /opt/atricore/josso-ce-2.4.2/bin/start

ENV JAVA_OPTS -Djava.security.egd=file:/dev/urandom

CMD /opt/atricore/josso-ce-2.4.2/bin/atricore
