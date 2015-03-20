FROM ciyinhuang/ubuntu-base:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

USER root

ENV DEBIAN_FRONTEND noninteractive
ENV JDK_VERSION 9

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils && \
    apt-get -y install locales curl wget vim build-essential zip unzip \
  libc6 libstdc++6 libcups2 liblcms2-2 libjpeg8 libnss3 libfontconfig1 \
  libfreetype6 libglib2.0-0 libkrb5-3 libpcsclite1 zlib1g ttf-dejavu-extra
RUN (echo "en_US ISO-8859-1" && echo "en_US.UTF-8 UTF-8") > /etc/locale.gen && locale-gen

ENV LC_ALL en_US.UTF-8

# add community-maintained universe repository to sources
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list

# resynchronize package index files from their sources
RUN apt-get -qq update

# install software-properties-common (ubuntu >= 12.10) to be able to use add-apt-repository
RUN apt-get -qq -y install software-properties-common
# add PPA for java
RUN add-apt-repository ppa:webupd8team/java
# resynchronize package index files from their sources
RUN apt-get -qq update

# accept Oracle license
RUN echo oracle-java${JDK_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# install jdk
RUN apt-get -qq -y install oracle-java${JDK_VERSION}-installer && apt-get clean

RUN apt-get -y install oracle-java${JDK_VERSION}-set-default && apt-get clean

RUN ln -s /usr/lib/jvm/java-${JDK_VERSION}-oracle /usr/lib/jvm/default-java

RUN update-alternatives --display java

ENV JAVA_HOME /usr/lib/jvm/default-java

echo "JAVA_HOME=/usr/lib/jvm/default-java">> /etc/environment
echo "PATH=$JAVA_HOME/bin:$PATH">> /etc/environment
echo "JAVA_HOME=/usr/lib/jvm/default-java">> ~/.bashrc
echo "PATH=$JAVA_HOME/bin:$PATH">> ~/.bashrc
source ~/.bashrc

CMD ["/sbin/my_init"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*