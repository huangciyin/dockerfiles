FROM ciyinhuang/ubuntu-dev:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV POSTGRESQL_DB postgres
ENV POSTGRESQL_USER postgres
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main" > /etc/apt/sources.list.d/postgresql.list

RUN apt-get update
RUN apt-get install -y postgresql-9.3 	
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i -e "s/^#listen_addresses.*=.*/listen_addresses = '*'/" /etc/postgresql/9.3/main/postgresql.conf
RUN sed -i -e "s/^data_directory.*=.*$/data_directory = '\/data'/" /etc/postgresql/9.3/main/postgresql.conf

ADD init /config/init/postgresql.sh

ADD supervisord.conf /etc/supervisor/conf.d/postgresql.conf
EXPOSE 5432
