# Version 1.1
FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV MONGODB_VERSION 3.0

RUN echo "deb mirror://mirrors.ubuntu.com/mirrors.txt utopic main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt utopic-updates main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt utopic-backports main restricted universe multiverse \n\
deb mirror://mirrors.ubuntu.com/mirrors.txt utopic-security main restricted universe multiverse" > /etc/apt/sources.list.d/all-mirrors.list

RUN apt-get update && \
    apt-get install -y mongodb pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
ENV AUTH yes

# Add run scripts
COPY run /etc/service/mongodb/
RUN chmod +x /etc/service/mongodb/run

RUN mkdir -p /opt/script/
ADD set_mongodb_password.sh /opt/script/set_mongodb_password.sh
RUN chmod 755 /opt/script/*.sh

RUN mkdir -p /data/db
VOLUME ["/data/db"]

# Expose ports
EXPOSE 27017 28017

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
