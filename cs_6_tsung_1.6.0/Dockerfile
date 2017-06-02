#选择一个已有的os镜像作为基础  
FROM centos:6
   
# 镜像的作者  
MAINTAINER prozhou 

RUN yum update -y
RUN rpm -Uvh "http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm"
RUN yum -y install perl-Log-Log4perl-RRDs.noarch gnuplot perl-Template-Toolkit firefox \
           tar jq erlang openssh-server sudo openssh-clients



# until EPEL gets tsung 1.6.0 we're compiling it again, taking advantage of the dependencies that were installed with the previous tsung version
# Yes, this is the lazy version of upgrading tsung ...
RUN curl http://tsung.erlang-projects.org/dist/tsung-1.6.0.tar.gz --output /tmp/tsung-1.6.0.tar.gz \
    && cd /tmp/ \
    && tar -xvf ./tsung-1.6.0.tar.gz \
    && cd tsung-1.6.0 \
    && ./configure \
    && make debug \
    && make install \
    && rm -rf /tmp/tsung*
   

RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config  
#告诉ssh 允许 ssh-agent 转发
RUN echo "ForwardAgent yes" >> /etc/ssh/ssh_config
# 添加测试用户root，密码root，并且将此用户添加到sudoers里  
RUN echo "root:root" | chpasswd  
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers
# 下面这两句比较特殊，在centos6上必须要有，否则创建出来的容器sshd不能登录  
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key  
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key

RUN mkdir -p /data/www/wwwroot
VOLUME ["/data"]
# 启动sshd服务并且暴露22端口  
RUN mkdir /var/run/sshd  
EXPOSE 22  
CMD ["/usr/sbin/sshd", "-D"]
