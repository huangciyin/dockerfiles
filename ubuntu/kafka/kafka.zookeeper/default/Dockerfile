# Version 1.1

FROM ciyinhuang/ubuntu-jdk:7
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV KAFKA_VERSION 0.8.2.1

RUN \
    mkdir /etc/service/kafka /etc/service/zookeeper /opt/kafka; \
    wget -O - http://mirror.csclub.uwaterloo.ca/apache/kafka/${KAFKA_VERSION}/kafka_2.11-${KAFKA_VERSION}.tgz \
    | tar xzf - --strip-components=1 -C "/opt/kafka"

COPY zk-run /etc/service/zookeeper/run
RUN chmod +x /etc/service/zookeeper/run

COPY kafka-run /etc/service/kafka/run
RUN chmod +x /etc/service/kafka/run

WORKDIR /opt/kafka

# Expose Zookeeper port & Kafka port
EXPOSE 2181 9092 

CMD ["/sbin/my_init"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
