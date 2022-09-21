
FROM fedora:34

LABEL org.opencontainers.image.source="https://github.com/olemorud/root-baseimages"

RUN yum update -y \
 && yum clean all \
 && rm -rf /var/cache/yum

COPY packages packages

RUN yum install $(cat packages) -y --setopt=install_weak_deps=False \
 && rm -f packages \
 && yum clean all \
 && rm -rf /var/cache/yum

wORKDIR /rootinstall

