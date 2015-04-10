# Version 1.1
FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV MONGODB_VERSION 3.0.2

# install mongodb and start it
RUN DEBIAN_FRONTEND=noninteractive && \ 
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

RUN apt-get update  \ 
    && apt-get install -y mongodb-org=${MONGODB_VERSION} \ 
             mongodb-org-server=${MONGODB_VERSION} \ 
             mongodb-org-shell=${MONGODB_VERSION} \ 
             mongodb-org-mongos=${MONGODB_VERSION} \
             mongodb-org-tools=${MONGODB_VERSION} \
    && service mongod stop

ENV AUTH no

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
