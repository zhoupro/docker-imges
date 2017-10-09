FROM centos:6
MAINTAINER prozhou <zhoushengzheng@gmail.com>
RUN   useradd www && usermod -u 1000 www
#auth 
RUN  yum install git dos2unix -y  && mkdir -p /data/soft && cd /data/soft && \
    git clone git://github.com/zhouzheng12/lnmp_installer.git &&\
	yum clean all

WORKDIR /data/soft/lnmp_installer
RUN   bash install.sh -s -n 1 -d 1 && rm -rf /data/soft && yum clean all
# Define working directory.
WORKDIR /
ADD init.sh /init.sh
RUN dos2unix /init.sh

ENTRYPOINT source /etc/profile ; /init.sh

# Expose ports.
EXPOSE 9000
