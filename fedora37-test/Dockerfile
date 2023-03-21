
FROM registry.cern.ch/docker.io/library/fedora:37

# RUN useradd -s /bin/bash sftnight

RUN dnf update -y \
 && dnf clean all \
 && rm -rf /var/cache/dnf

COPY packages.txt packages.txt

RUN dnf install $(cat packages.txt) -y --setopt=install_weak_deps=False \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install -r requirements-root.txt -r requirements-roottest.txt openstacksdk \
 && rm -f requirements-root.txt requirements-roottest.txt

