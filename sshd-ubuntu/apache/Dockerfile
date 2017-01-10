FROM ubuntu:14.04

# 163源
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list


# ssh
RUN apt-get update
RUN sudo apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
ADD authorized_keys /root/.ssh/authorized_keys
EXPOSE 22

# pip
RUN apt-get install  -y python-pip python-dev build-essential

# git
RUN apt-get install -y git

# vim
RUN apt-get install -y vim

# supervisor
RUN apt-get install -y supervisor
RUN apt-get install -y libmysqlclient-dev

# python
RUN apt-get install -y python-dev
RUN apt-get install -y python3-dev

# apache
RUN apt-get install -yq apache2 && rm -rf /var/lib/apt/lists/*

RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /var/lock/apache2 && mkdir -p /vhost/app && rm -rf /var/www/html && ln -s /vhost/app /var/www/html

COPY sample/ /vhost/app

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_SERVERADMIN admin@localhost
ENV APACHE_SERVERNAME localhost
ENV APACHE_SERVERALIAS docker.localhost
ENV APACHE_DOCUMENTROOT /var/www

ADD run.sh /run.sh
RUN chmod 755 /run.sh

CMD ["/run.sh"]
