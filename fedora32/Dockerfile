
FROM fedora:32

RUN useradd -s /bin/bash sftnight

RUN yum update -y \
 && yum clean all \
 && rm -rf /var/cache/yum

COPY packages packages

RUN yum install $(cat packages) -y --setopt=install_weak_deps=False \
 && rm -f packages \
 && yum clean all \
 && rm -rf /var/cache/yum

wORKDIR /rootinstall

USER sftnight

