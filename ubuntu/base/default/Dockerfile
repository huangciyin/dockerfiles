# Version 1.0
FROM phusion/baseimage:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

RUN \
    apt-get update; apt-get upgrade -y -qq; \
    apt-get install -y -qq wget; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]