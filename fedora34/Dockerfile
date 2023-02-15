
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

COPY requirements.txt requirements.txt

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install -r requirements.txt \
 && rm -f requirements.txt

