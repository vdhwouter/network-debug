FROM centos:latest
MAINTAINER Wouter Van den Heede <vandenheede.wouter96@gmail.com>

RUN yum update -y && \
    yum install -y \
        bind-utils \
        curl \
        git \
        iproute \
        net-tools \
        nmap \
        nmap-ncat \
        tcpdump \
        telnet \
        traceroute \
        vim \
        wget && \
    chmod u+s /bin/ping

WORKDIR /opt/app-root/src

ADD docker-entrypoint.sh bin/

USER 1001

CMD /opt/app-root/src/bin/docker-entrypoint.sh
