FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

# Install RabbitMQ
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F7B8CEA6056E8E56; \
    echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y rabbitmq-server pwgen; \
    rabbitmq-plugins enable rabbitmq_management; \
    mkdir -p /etc/service/rabbitmq /var/lib/rabbitmq; \
    mkdir -p /opt/script;

RUN echo "ERLANGCOOKIE" > /var/lib/rabbitmq/.erlang.cookie
RUN chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
RUN chmod 400 /var/lib/rabbitmq/.erlang.cookie

# Add scripts
COPY run /etc/service/rabbitmq/

ADD set_rabbitmq_password.sh /opt/script/set_rabbitmq_password.sh
RUN chmod 755 /opt/script/*.sh

EXPOSE 5672 15672

VOLUME ["/var/lib/rabbitmq"]

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
