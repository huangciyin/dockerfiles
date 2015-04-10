FROM ciyinhuang/ubuntu-nodejs:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV STRONGLOOP_VERSION 1.0

RUN npm install -g strongloop

VOLUME ["/opt/strongloop"]

WORKDIR /opt/strongloop

COPY run /etc/service/strongloop/

EXPOSE 9000

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*