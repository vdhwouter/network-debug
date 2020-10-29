FROM centos:8
MAINTAINER Wouter Van den Heede <vandenheede.wouter96@gmail.com>

RUN dnf update -y && \
    dnf install -y \
        bind-utils \
        curl \
        git \
        iperf3 \
        iproute \
        net-tools \
        mariadb \
        nmap \
        nmap-ncat \
        tcpdump \
        telnet \
        traceroute \
        vim \
        wget && \
    rm -rf /var/cache/yum

WORKDIR /opt/app-root/src

ADD docker-entrypoint.sh bin/

USER 1001

CMD /opt/app-root/src/bin/docker-entrypoint.sh
