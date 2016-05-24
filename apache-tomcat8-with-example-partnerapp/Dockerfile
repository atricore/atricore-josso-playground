FROM atricore/josso:apache-tomcat8

MAINTAINER Gianluca Brigandi <gianluca@atricore.com>

# Add example partner application WAR
ADD partnerapp.war /opt/tomcat/webapps/

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
