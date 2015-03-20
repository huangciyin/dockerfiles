FROM ciyinhuang/ubuntu-golang
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV DOCKERUI_VERSION 1.0

ADD dockerui /dockerui/

WORKDIR /dockerui/

RUN go build /dockerui/dockerui.go && mkdir -p /etc/service/dockerui

COPY run /etc/service/dockerui/

EXPOSE 9000

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*