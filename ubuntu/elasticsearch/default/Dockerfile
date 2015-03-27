# Version 1.1

FROM ciyinhuang/ubuntu-jdk:7
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV ELASTICSEARCH_VERSION 1.4.4

RUN \
	mkdir /etc/service/elasticsearch /opt/elasticsearch; \
	wget -O - https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz \
	| tar xzf - --strip-components=1 -C "/opt/elasticsearch";
	

COPY run /etc/service/elasticsearch/
RUN chmod +x /etc/service/kibana/run

WORKDIR /opt/elasticsearch

CMD ["/sbin/my_init"]

EXPOSE 9200 9300

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
