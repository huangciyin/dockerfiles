FROM ciyinhuang/ubuntu-jdk:7
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV CASSANDRA_VERSION 2.1.3

# Download and extract Cassandra
RUN \
  mkdir /opt/cassandra; \
  wget -O - http://www.us.apache.org/dist/cassandra/2.1.3/apache-cassandra-${CASSANDRA_VERSION}-bin.tar.gz \
  | tar xzf - --strip-components=1 -C "/opt/cassandra";

ADD	. /src

# Copy over daemons
RUN	\
	cp /src/cassandra.yaml /opt/cassandra/conf/; \
    mkdir -p /etc/service/cassandra; \
    cp /src/cassandra-run /etc/service/cassandra/run; \
    chmod +x /etc/service/cassandra/run

# Expose ports
EXPOSE 7199 7000 7001 9160 9042

WORKDIR /opt/cassandra

CMD ["/sbin/my_init"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
