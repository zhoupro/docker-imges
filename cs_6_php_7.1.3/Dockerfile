FROM centos:6
MAINTAINER prozhou <zhoushengzheng@gmail.com>
RUN   useradd www && usermod -u 1000 www

#auth 
RUN mkdir -p /data/soft && cd /data/soft&& yum install git -y  && \
	git clone git://github.com/zhouzheng12/lnmp_installer.git && \
	yum clean all

WORKDIR /data/soft/lnmp_installer
RUN   bash install.sh -s -p 3 -d 1 && rm -rf /data/soft && yum clean all
# Define working directory.
WORKDIR /
ADD init.sh /init.sh
CMD ["/init.sh"]
# Expose ports.
EXPOSE 9000
