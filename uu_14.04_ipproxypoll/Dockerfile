FROM ubuntu:14.04
MAINTAINER prozhou <zhoushengzheng@gmail.com>

WORKDIR /etc/apt
ADD  soft /opt/soft
RUN mv /opt/soft/sources.list sources.list && \
    apt-get update

RUN   usermod -u 1000 www-data

RUN   sudo apt-get install  curl wget software-properties-common python-software-properties make \
	libxml2 libxml2-dev libevent-1.4-2 libevent-dev bzip2 libbz2-dev \
	libcurl3-gnutls libcurl4-gnutls-dev  python3-lxml  sqlite3 git unzip \
	libmcrypt4 libmcrypt-dev  \
	libssl-dev openssl autoconf cron vim build-essential \
	libxslt1-dev zlib1g-dev \
	  python3-dev   python3-pip uwsgi-plugin-python3 uwsgi-plugin-python3 -y \
	&& sudo apt-get autoremove && sudo apt-get autoclean && \
	 rm -rf /var/lib/apt/lists/*
     

COPY soft/requirements.txt requirements.txt

RUN   pip3 install -r requirements.txt
    
RUN   wget https://codeload.github.com/webpy/webpy/zip/py3 && unzip py3 && cd webpy-py3 && python3 setup.py install


WORKDIR /
RUN echo '#!/bin/bash' > /init.sh && \
    echo 'cd /data/www/wwwroot && if [ -f IPProxy.py ]; then python3 IPProxy.py; fi && while true; do sleep 1000; done ' >> /init.sh && \
    chmod +x /init.sh
CMD ["/init.sh"]


EXPOSE 8080

   
