FROM ubuntu:14.04
MAINTAINER Sven Dowideit <SvenDowideit@docker.com>

ADD soft/ /opt/soft
RUN mv /opt/soft/sources.list sources.list && \
    apt-get update

RUN  apt-get install -y --no-install-recommends vsftpd 
RUN apt-get clean

# add user add change passwd
RUN adduser --disabled-password --gecos '' zhouzheng
RUN echo "zhouzheng:zsz123" | chpasswd

#etc
RUN echo "userlist_deny=NO" >> /etc/vsftpd.conf
RUN echo "userlist_enable=YES" >> /etc/vsftpd.conf
RUN echo "userlist_file=/etc/allowed_users" >> /etc/vsftpd.conf
RUN echo "seccomp_sandbox=NO" >> /etc/vsftpd.conf
RUN echo "local_enable=YES" >> /etc/vsftpd.conf
RUN echo "chroot_local_user=NO" >> /etc/vsftpd.conf
RUN echo "write_enable=YES" >> /etc/vsftpd.conf
RUN echo "local_umask=022" >> /etc/vsftpd.conf
RUN sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd.conf

RUN echo "zhouzheng" >> /etc/allowed_users

RUN mkdir -p /var/run/vsftpd/empty

EXPOSE 20 21
CMD /usr/sbin/vsftpd
