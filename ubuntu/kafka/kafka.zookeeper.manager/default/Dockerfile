FROM ciyinhuang/ubuntu-kafka.zookeeper
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV SBT_VERSION 0.13.7

RUN \
	cd /opt; \
	wget https://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb; \
	dpkg -i ${SBT_VERSION}.deb; \
	mkdir -p /etc/service/kafka-manager; \
	sudo apt-get update; \
	sudo apt-get install -y -qq unzip;

ADD . /src

RUN	\
	cd /src; \
	mv run /etc/service/kafka-manager; \
	chmod +x /etc/service/kafka-manager/run; \
	sbt clean dist; \
	cd target/universal; \
	unzip kafka-manager-1.0-SNAPSHOT.zip; \
	mv kafka-manager-1.0-SNAPSHOT /opt/kafka-manager; \
	cd /opt; \
	rm -Rf /src /root/.sbt /root/.ivy2 /root/.m2

WORKDIR /opt/kafka-manager

EXPOSE 2181 9000 9092

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*