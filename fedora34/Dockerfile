
FROM fedora:34

# RUN useradd -s /bin/bash sftnight

RUN yum update -y \
 && yum clean all \
 && rm -rf /var/cache/yum

COPY packages.txt packages.txt

RUN yum install $(cat packages.txt) -y --setopt=install_weak_deps=False \
 && rm -f packages.txt \
 && yum clean all \
 && rm -rf /var/cache/yum

COPY pip-packages.txt pip-packages.txt

RUN pip3 install --upgrade pip \
 && pip3 install $(cat pip-packages.txt) \
 && rm -f pip-packages.txt
