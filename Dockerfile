 FROM dockerregistry.westermo.com:443/base-image:1.2
 MAINTAINER mattias.walstrom@westermo.se
 RUN echo "nameserver 192.168.130.100" > /etc/resolv.conf && apt-get -y install wget bash && \
     apt-get -y install wmo-toolchains wmo-build-essential module-init-tools &&  \
     apt-get clean autoremove &&                                                            \
     mv /usr/local/x86-64-unknown-linux-gnu-5.3-1  /usr/local/x86_64-unknown-linux-gnu-5.3-1  && \
     echo "ALL	ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers && \
     echo "Defaults !env_reset" >> /etc/sudoers
 RUN echo "nameserver 192.168.130.100" > /etc/resolv.conf && apt-get -y install wmo-mgmt-guide-essential
 RUN apt-get -y install bash-completion && \
     sed -i '/^#if !.*$/,/^#fi$/s/#//g' /etc/bash.bashrc
 RUN apt-get install -y bear syslinux dosfstools mtools libssl-dev
