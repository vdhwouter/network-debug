FROM centos:8
MAINTAINER Wouter Van den Heede <vandenheede.wouter96@gmail.com>

ENV TZ=Europe/Brussels

RUN set -ue; \
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime; \
echo $TZ > /etc/timezone; \
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
    wget; \
rm -rf /var/cache/yum; \
wget https://downloads-openshift-console.apps.prod.axians-cloud.be/amd64/linux/oc -P /usr/local/bin; \
chmod +x /usr/local/bin/oc

WORKDIR /opt/app-root/src

ADD docker-entrypoint.sh bin/

USER 1001

CMD /opt/app-root/src/bin/docker-entrypoint.sh
