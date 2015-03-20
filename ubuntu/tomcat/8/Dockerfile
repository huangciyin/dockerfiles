FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

RUN apt-get update && \
    apt-get install -yq --no-install-recommends wget pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.20
ENV CATALINA_HOME /opt/tomcat

# INSTALL TOMCAT
RUN cd /opt; \
	mkdir -p /opt/script; \
	wget -O - https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz \
	| tar xzf - --strip-components=1 -C "/opt/tomcat";

ADD create_tomcat_admin_user.sh /opt/script/create_tomcat_admin_user.sh

COPY run /etc/service/tomcat/

EXPOSE 8080

CMD [ "/sbin/my_init" ]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
