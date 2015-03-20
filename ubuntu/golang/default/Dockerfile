# Version 1.0

FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

RUN mkdir /gopath /goroot

ENV GO_VERSION 1.4.2
ENV GOROOT /goroot
ENV GOPATH /gopath

RUN apt-get update && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    mercurial \
    git-core

RUN curl -s https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz | tar xvzf - -C ${GOROOT} --strip-components=1

ENV PATH $GOROOT/bin:$PATH

WORKDIR ${GOROOT}

echo "GOROOT=/goroot">> /etc/environment
echo "PATH=$GOROOT/bin:$PATH">> /etc/environment

echo "GOROOT=/goroot">> ~/.bashrc
echo "PATH=$GOROOT/bin:$PATH">> ~/.bashrc
source ~/.bashrc

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



