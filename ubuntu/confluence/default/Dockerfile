#version 1.1

FROM ciyinhuang/ubuntu-base
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV CONFLUENCE_VERSION 5.4.4
ENV CONFLUENCE_HOME /opt/atlassian/confluence

#RUN /usr/sbin/useradd --create-home --comment "Account for running Confluence" --shell /bin/bash confluence

ADD install /data/install
ADD http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${CONFLUENCE_VERSION}-x64.bin /data/install/atlassian-confluence-${CONFLUENCE_VERSION}-x64.bin
RUN chmod +x /data/install/atlassian-confluence-${CONFLUENCE_VERSION}-x64.bin

RUN /data/install/atlassian-confluence-${CONFLUENCE_VERSION}-x64.bin -q -varfile /data/install/response.varfile

RUN sh /data/install/install.sh; \
	rm -rf /data/install/atlassian-confluence-${CONFLUENCE_VERSION}-x64.bin

RUN mkdir -p /etc/service/confluence 
COPY run /etc/service/confluence/
RUN chmod +x /etc/service/confluence/run

# Use the default unprivileged account. This could be considered bad practice
# on systems where multiple processes end up being executed by 'daemon' but
# here we only ever run one process anyway.
USER root

# Expose default HTTP connector port.
EXPOSE 8090

# Set volume mount points for installation and home directory. Changes to the
# home directory needs to be persisted as well as parts of the installation
# directory due to eg. logs.
VOLUME ["/var/atlassian/application-data/confluence", "/opt/atlassian/confluence"]

# Set the default working directory as the installation directory.
WORKDIR ${CONFLUENCE_HOME}

CMD ["/sbin/my_init"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
