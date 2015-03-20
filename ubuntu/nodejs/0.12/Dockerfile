# Version 1.2

FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV NODEJS_VERSION 0.12.0

ENV NODE_HOME /usr/local/nodejs

# Install Python, git & node
RUN \
    apt-get update; \
    apt-get install -y -qq python git; \
    wget -O - http://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xzf - --strip-components=1 --exclude="README.md" --exclude="LICENSE" --exclude="ChangeLog" -C "/usr/local"; \
    npm install -g npm; \
    npm install --silent --quiet -g grunt-cli bower forever;

WORKDIR /usr/local/node;

RUN ls -lh /usr/local

ENV NODE_HOME /usr/local/node
ENV PATH /usr/local/node/bin:$PATH

echo "NODE_HOME=/usr/local/node">> /etc/environment
echo "PATH=$NODE_HOME/bin:$NODE_HOME/lib/node_modules/npm/bin/node-gyp-bin:$PATH">> /etc/environment

echo "NODE_HOME=/usr/local/node">> ~/.bashrc
echo "PATH=$NODE_HOME/bin:$NODE_HOME/lib/node_modules/npm/bin/node-gyp-bin:$PATH">> ~/.bashrc
source ~/.bashrc

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
