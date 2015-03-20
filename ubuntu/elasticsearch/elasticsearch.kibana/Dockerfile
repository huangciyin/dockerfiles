# Version 1.1

FROM ciyinhuang/ubuntu-elasticsearch:latest

MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV KIBANA_VERSION 4.0.0

ENV DEBIAN_FRONTEND noninteractive

RUN \
	mkdir -p /opt/kibana /etc/service/kibana; \
	wget -O - https://download.elasticsearch.org/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz \
	| tar xzf - --strip-components=1 -C "/opt/kibana";

COPY run /etc/service/kibana/

WORKDIR /opt/kibana

EXPOSE 5601

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
