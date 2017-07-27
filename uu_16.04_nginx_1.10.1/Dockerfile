FROM ubuntu:14.04
MAINTAINER prozhou <zhoushengzheng@gmail.com>

WORKDIR /etc/apt

RUN  usermod -u 1000 www-data
RUN apt-get update && apt-get clean

RUN    apt-get install  curl wget software-properties-common python-software-properties make \
	libxml2 libxml2-dev libevent-1.4-2 libevent-dev bzip2 libbz2-dev \
	libcurl3-gnutls libcurl4-gnutls-dev  \
	libmcrypt4 libmcrypt-dev  \
	libssl-dev openssl autoconf cron vim build-essential -y &&  apt-get autoremove &&  apt-get autoclean

RUN  wget https://ftp.pcre.org/pub/pcre/pcre-8.39.tar.gz &&  \
     wget	http://zlib.net/zlib-1.2.11.tar.xz && \
     wget http://nginx.org/download/nginx-1.10.1.tar.gz && \
     mkdir -p /opt/build && \
     tar zxf nginx-1.10.1.tar.gz -C /opt/build && \
     tar xzvf pcre-8.39.tar.gz -C /opt/build && \
     tar Jxf zlib-1.2.11.tar.xz -C /opt/build && \
     cd /opt/build/nginx-1.10.1 && \
     ./configure  \
    --sbin-path=/data/server/nginx/nginx \
    --conf-path=/data/server/nginx/nginx.conf \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module \
    --with-pcre=/opt/build/pcre-8.39 \
    --with-zlib=/opt/build/zlib-1.2.11 && \
     make && make install && \
     mv /opt/soft/nginx.conf      /data/server/nginx/nginx.conf  && \
     mkdir -p /data/server/nginx/conf.d/ && \
     mv  /opt/soft/sites-enabled/*   /data/server/nginx/conf.d/ && \
     mkdir /opt/htdocs && mkdir /opt/log && mkdir /opt/log/nginx && \
     chown -R www-data.www-data /opt/htdocs /opt/log && \
      rm -rf /opt/soft  /opt/build

WORKDIR /
RUN echo '#!/bin/bash' > /init.sh && \
    echo '/data/server/nginx/nginx -g "daemon off;"' >> /init.sh && \
    chmod +x /init.sh
CMD ["/init.sh"]
EXPOSE 80
VOLUME ["/opt"]

