
FROM quay.io/centos/centos:centos8 AS centos

LABEL org.opencontainers.image.source="https://github.com/olemorud/root-baseimages"

# migrate to centos8 stream
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* \
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* \
 && dnf install centos-release-stream -y \
 && dnf swap centos-{linux,stream}-repos -y \
 && dnf distro-sync -y \
 && dnf update -q -y \
 && dnf autoremove \
 && dnf clean all

COPY packages /packages

RUN dnf update -q -y \
 && dnf install -y epel-release yum-utils \
 && dnf install -y yum-utils \
 && dnf config-manager --set-enabled powertools \
 && dnf install -y $(cat packages) \
 && rm -f /packages \
 && dnf clean all \
 && rm -rf /var/cache/yum
