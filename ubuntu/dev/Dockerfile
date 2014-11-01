FROM ubuntu:latest

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
# make sure things are pretty
ENV TERM xterm-256color

# normal build deps
RUN export LANGUAGE=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8 && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    apt-get update && apt-get install -y \
        supervisor \
        bash-completion curl less rsync vim wget \
        build-essential \
        devscripts \
        dh-make \
        dput-ng \
        equivs \
        git openssh-server \
        git-buildpackage \
        libcrypt-ssleay-perl \
        libdistro-info-perl \
        libfile-fcntllock-perl \
        libwww-perl \
        lintian \
        openssh-client \
        python-distro-info \
	python-dev python-pip \
	python-virtualenv virtualenvwrapper python-coverage \
        quilt \
        --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf && \
    pip install pip-autoremove && \
    # need deb-src for compiling packages
    find /etc/apt/sources.list* -type f -exec sed -i 'p; s/^deb /deb-src /' '{}' + && \
    cp /etc/skel/.bashrc ~/ && \
    sed -ri 's/^#(force_color_prompt=yes)/\1/' ~/.bashrc


# tianon is _really_ lazy, and likes a preseeded bash history
ENV HOME /root
RUN { \
    echo "export DEBFULLNAME='' DEBEMAIL=''"; \
    echo 'dch -i'; \
    echo 'lintian --ftp-master-rejects'; \
    echo 'uscan --force-download --verbose --download-current-version'; \
} >> ~/.bash_history

# for ssh to debian hosts, let's make sure we know their fingerprints <3
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh 
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 644 /root/.ssh/authorized_keys
#    && wget -O ~/.ssh/known_hosts https://db.debian.org/debian_known_hosts \
#    && chmod 644 ~/.ssh/known_hosts

RUN mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    apt-get autoremove && apt-get autoclean && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# quilt is much amaze: https://wiki.debian.org/UsingQuilt#Using_quilt_with_Debian_source_packages
ENV QUILT_PATCHES debian/patches
ENV QUILT_REFRESH_ARGS -p ab --no-timestamps --no-index


# Define mountable directories.
VOLUME ["/etc/supervisor/conf.d"]
# Define working directory.
WORKDIR /etc/supervisor/conf.d

# Add files
ADD files /

EXPOSE 22

# Define default command.
CMD ["/config/bootstrap.sh"]

