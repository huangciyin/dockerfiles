FROM ciyinhuang/ubuntu-jdk:7
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV CASSANDRA_VERSION 2.1.3
ENV AGENT_VERSION 5.1.0

# Download and extract Cassandra
RUN \
  mkdir /opt/cassandra; \
  wget -O - http://www.us.apache.org/dist/cassandra/${CASSANDRA_VERSION}/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
  | tar xzf - --strip-components=1 -C "/opt/cassandra";

# Download and extract DataStax OpsCenter Agent
RUN \
  mkdir /opt/agent; \
  wget -O - http://downloads.datastax.com/community/datastax-agent-${AGENT_VERSION}.tar.gz \
  | tar xzf - --strip-components=1 -C "/opt/agent";

ADD	. /src

# Copy over daemons
RUN	\
	cp /src/cassandra.yaml /opt/cassandra/conf/; \
    mkdir -p /etc/service/cassandra; \
    cp /src/cassandra-run /etc/service/cassandra/run; \
    mkdir -p /etc/service/agent; \
    cp /src/agent-run /etc/service/agent/run

# Expose ports
EXPOSE 7199 7000 7001 9160 9042

WORKDIR /opt/cassandra

CMD ["/sbin/my_init"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
