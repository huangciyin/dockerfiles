# Version 1.1
FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV REDIS_VERSION 3.0.0-rc1

# Install dependencies, build redis, copy binaries to /user/local/bin and clean up
# all in a single step to keep the image size low
RUN \
    apt-get update; \
    apt-get install -y -qq gcc make; \
    mkdir -p /opt/redis; \
    wget -O - http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz | tar xzf - --strip-components=1 -C "/opt/redis"; \
    cd /opt/redis; \
    make; \
    cp src/redis-server /usr/local/bin; \
    cd /root; \
    rm -Rf /opt/redis; \
    apt-get remove --purge -y -qq gcc make; \
    mkdir -p /etc/service/redis /var/lib/redis;

COPY redis.conf /etc/

COPY run /etc/service/redis/
RUN chmod +x /etc/service/redis/run

VOLUME ["/var/lib/redis"]

WORKDIR /opt/redis

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
