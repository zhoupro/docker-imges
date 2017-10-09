FROM ubuntu:16.04
MAINTAINER prozhou <zhoushengzheng@gmail.com>

WORKDIR /etc/apt
ADD soft/ /opt/soft

RUN mkdir -p /var/log/uwsgi/ && touch /var/log/uwsgi/htdocs.log

RUN  apt-get update

RUN   usermod -u 1000 www-data

RUN    apt-get install  curl wget software-properties-common python-software-properties make \
	libxml2 libxml2-dev libevent-1.4-2 libevent-dev bzip2 libbz2-dev \
	libcurl3-gnutls libcurl4-gnutls-dev  \
	libmcrypt4 libmcrypt-dev  \
	libssl-dev openssl autoconf cron vim build-essential \
	libxslt1-dev zlib1g-dev \
	  python3-dev   python3-pip uwsgi-plugin-python3 uwsgi-plugin-python3 -y \
	&&  apt-get autoremove &&  apt-get autoclean && \
	 rm -rf /var/lib/apt/lists/*
     

COPY soft/requirements.txt requirements.txt

RUN   pip3 install -r requirements.txt
    

WORKDIR /
RUN echo '#!/bin/bash' > /init.sh && \
    echo 'cd /opt/soft && uwsgi --ini uwsgi.ini && while true; do sleep 1000; done ' >> /init.sh && \
    chmod +x /init.sh
ENTRYPOINT source /etc/profile ; /init.sh


EXPOSE 9090

   
