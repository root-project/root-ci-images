
FROM quay.io/centos/centos:centos8 AS centos

RUN useradd -s /bin/bash sftnight

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

RUN dnf install -y epel-release yum-utils \
 && dnf install -y yum-utils \
 && dnf config-manager --set-enabled powertools \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages) \
 && rm -f /packages \
 && dnf clean all \
 && rm -rf /var/cache/yum

USER sftnight

