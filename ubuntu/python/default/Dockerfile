# Version 1.0
FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

# Install Python & PIP
RUN \
    apt-get update; \
    apt-get install -y -qq python-dev python-setuptools; \
    easy_install pip; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]