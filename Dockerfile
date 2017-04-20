 FROM ubuntu:xenial
 MAINTAINER mattias.walstrom@westermo.se
 RUN apt-get update && \
     apt-get -y install wget bash && \
     echo "deb http://deb.labs.westermo.se/ wmo main" >> /etc/apt/sources.list && \
     echo "nameserver 192.168.130.3" > /etc/resolv.conf &&      \
     wget http://deb.labs.westermo.se/conf/wmo.gpg.key &&       \
     apt-key add wmo.gpg.key &&                                 \
     apt-get update &&                                          \
     apt-get -y install wmo-build-essential module-init-tools wmo-mgmt-guide-essential &&  \
     apt-get clean autoremove &&                                                            \
     mv /usr/local/x86-64-unknown-linux-gnu-5.3-1  /usr/local/x86_64-unknown-linux-gnu-5.3-1 && \
     echo "ALL	ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers && \
     echo "Defaults !env_reset" >> /etc/sudoers
