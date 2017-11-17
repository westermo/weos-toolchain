 FROM ubuntu:16.04.3
 MAINTAINER mattias.walstrom@westermo.se
 RUN apt-get update && \
     apt-get -y install wget bash && \
     echo "deb http://deb.labs.westermo.se/ wmo main" >> /etc/apt/sources.list && \
     echo "nameserver 192.168.130.3" > /etc/resolv.conf &&      \
     wget http://deb.labs.westermo.se/conf/wmo.gpg.key &&       \
     apt-key add wmo.gpg.key &&                                 \
     apt-get update &&                                          \
     apt-get -y install wmo-build-essential module-init-tools &&  \
     apt-get clean autoremove &&                                                            \
     mv /usr/local/x86-64-unknown-linux-gnu-5.3-1  /usr/local/x86_64-unknown-linux-gnu-5.3-1  && \
     echo "ALL	ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers && \
     echo "Defaults !env_reset" >> /etc/sudoers
 RUN echo "nameserver 192.168.130.100" > /etc/resolv.conf && apt-get -y install wmo-mgmt-guide-essential
 RUN apt-get install bash-completion
 RUN apt-get -y install bash-completion && \
     sed -i '/^#if !.*$/,/^#fi$/s/#//g' /etc/bash.bashrc
 RUN apt-get install -y bear