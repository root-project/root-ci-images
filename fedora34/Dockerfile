
FROM fedora:34

RUN useradd -s /bin/bash sftnight

RUN yum update -y \
 && yum clean all \
 && rm -rf /var/cache/yum

COPY packages packages

RUN yum install $(cat packages) -y --setopt=install_weak_deps=False \
 && pip3 install --upgrade pip \
 && pip3 install openstacksdk \
 && rm -f packages \
 && yum clean all \
 && rm -rf /var/cache/yum

WORKDIR /rootinstall

USER sftnight

