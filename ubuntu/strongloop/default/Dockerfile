FROM ciyinhuang/ubuntu-nodejs:latest
MAINTAINER ciyinhuang <ciyinhuang@gmail.com>

ENV STRONGLOOP_VERSION 1.0

RUN DEBIAN_FRONTEND=noninteractive && \
	sudo apt-get update \
	sudo apt-get install git

# Ensure git is installed (used by strong-pm)
# Create "strong-pm" user
RUN npm install --unsafe-perm --global strongloop pm2 grunt bower npm-check-updates gulp strongloop/strong-pm#production \
    && npm cache clean \
    && useradd -ms /bin/bash strong-pm && \
	npm cache clear && \
	slc --version


# Set up some semblance of an environment
WORKDIR /home/strong-pm
ENV HOME=/home/strong-pm PORT=3000

# Run as non-privileged user inside container
USER strong-pm

VOLUME ["/opt/strongloop"]

# pre-load node-gyp to speed up build time of apps pushed to strong-pm
# and remove need to download node source in production
RUN node-gyp install 2> /dev/null && npm cache clear

COPY run /etc/service/strongloop/

# Expose strong-pm port
EXPOSE 8701 3000

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*