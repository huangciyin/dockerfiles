FROM        ciyinhuang/ubuntu-dev
MAINTAINER  ciyinhuang  <ciyinhuang@gmail.com>


RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends libssl-dev man && \
    curl --location https://raw.github.com/creationix/nvm/master/install.sh | sh && \
    echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh" >> /etc/profile.d/npm.sh && \
    echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh" >> $HOME/.bashrc

ENV PATH $HOME/.nvm/bin:$PATH
RUN /bin/bash -c "source $HOME/.bashrc" && \
	sh $HOME/.nvm/nvm.sh && \
	echo `whereis nvm` && \
    NODEVERSION='v0.10.32' && nvm install $NODEVERSION && nvm use $NODEVERSION


VOLUME ["/data"]
WORKDIR /data

EXPOSE 22

# Clean up for smaller image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

