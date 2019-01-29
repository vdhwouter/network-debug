#FROM registry.access.redhat.com/rhel7-minimal
FROM centos:latest
MAINTAINER Wouter Van den Heede <vandenheede.wouter96@gmail.com>

RUN yum update -y && \
    yum install -y \
        wget \
        nmap-ncat \
        curl \
        git \
        vim \
        tcpdump \
        net-tools \
        iproute \
        bind-utils && \
    chmod u+s /bin/ping

WORKDIR /opt/app-root/src

ADD docker-entrypoint.sh bin/

USER 1001


CMD /opt/app-root/src/bin/docker-entrypoint.sh
