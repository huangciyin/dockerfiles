#!/bin/sh

#groupadd -r atlassian && useradd -r -g atlassian atlassian

CONFLUENCE_HOME="/opt/atlassian/confluence"

mv /data/install/mysql-connector-java-5.1.31-bin.jar ${CONFLUENCE_HOME}/confluence/WEB-INF/lib/mysql-connector-java-5.1.31-bin.jar
#mv ${CONFLUENCE_HOME}/confluence/WEB-INF/lib/atlassian-extras-2.4.jar ${CONFLUENCE_HOME}/confluence/WEB-INF/lib/atlassian-extras-2.4.init.jar
#mv /data/install/atlassian-extras-2.4.jar ${CONFLUENCE_HOME}/confluence/WEB-INF/lib/atlassian-extras-2.4.jar

# mv /data/install/confluence.conf /etc/supervisor/conf.d/

#service supervisor start
