FROM        ciyinhuang/ubuntu-python
MAINTAINER  ciyinhuang  <ciyinhuang@gmail.com>

# Get noninteractive frontend for Debian to avoid some problems:
#    debconf: unable to initialize frontend: Dialog
ENV DEBIAN_FRONTEND noninteractive

# Ensure we create the cluster with UTF-8 locale
# Bug: https://bugs.launchpad.net/ubuntu/+source/lxc/+bug/813398
RUN locale-gen en_US.UTF-8 && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale

# Set the locale
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US:en
ENV LC_ALL en_US.UTF-8

RUN echo udev hold | dpkg --set-selections; \
 echo initscripts hold | dpkg --set-selections; \
 echo upstart hold | dpkg --set-selections;
 #apt-get update; \
 #apt-get upgrade -y

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y python-pip python-dev build-essential libpq-dev \
    poppler-utils antiword libldap2-dev libsasl2-dev libssl-dev git \
    python-dateutil python-feedparser python-gdata python-ldap python-lxml \
    python-mako python-openid python-psycopg2 python-pychart python-pydot \
    python-pyparsing python-reportlab python-tz python-vatnumber python-vobject \
    python-webdav python-xlwt python-yaml python-zsi python-docutils python-unittest2 \
    python-mock python-jinja2 libevent-dev libxslt1-dev libfreetype6-dev libjpeg8-dev \
    python-werkzeug libjpeg-dev build-essential python-svn python-simplejson \
    python-babel python-decorator python-psutil python-pypdf \
    wget 
RUN pip install gdata passlib graphviz ghostscript gevent gevent_psycopg2 psycogreen 

# install wkhtmltopdf
RUN wget https://s3.amazonaws.com/akretion/packages/wkhtmltox-0.12.1_linux-trusty-amd64.deb && \
    dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb && rm wkhtmltox-0.12.1_linux-trusty-amd64.deb \
	&& ln -s /usr/local/bin/wkhtmltoimage /usr/bin/wkhtmltoimage \
	&& ln -s /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf

# Creating user
RUN addgroup --system odoo
RUN adduser --system --shell /bin/bash --gecos 'odoo' --disabled-password --home /home/odoo odoo
RUN adduser odoo odoo

RUN mkdir -p /etc/service/odoo
COPY run /etc/service/odoo/

VOLUME ["/opt/odoo"]

# Expose the odoo port
EXPOSE 8069 8070 8071 8072

WORKDIR /opt/odoo

CMD ["/sbin/my_init"]

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*