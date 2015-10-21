FROM daocloud.io/library/ubuntu:latest
MAINTAINER xiongjun <fenynunxx@163.com> 

ADD sources.list /etc/apt/sources.list

# Install packages
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server pwgen byobu curl htop unzip unrar vim wget  && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**
ENV TZ "Asia/Shanghai"
ENV TERM xterm
ENV HOME /root

WORKDIR /root

EXPOSE 22

CMD ["/run.sh"]
