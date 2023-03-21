
FROM quay.io/centos/centos:centos8 AS centos

# RUN useradd -s /bin/bash sftnight

# migrate to centos8 stream
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* \
 && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* \
 && dnf install centos-release-stream -y \
 && dnf swap centos-{linux,stream}-repos -y \
 && dnf distro-sync -y \
 && dnf install -y epel-release yum-utils \
 && dnf config-manager --set-enabled powertools \
 && dnf update -q -y \
 && dnf autoremove \
 && dnf clean all

COPY packages.txt packages.txt

RUN dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && dnf autoremove \
 && dnf clean all \
 && rm -f packages.txt

COPY requirements.txt requirements.txt

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install -r requirements.txt \
 && rm -f requirements.txt

