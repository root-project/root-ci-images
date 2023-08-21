
FROM ubuntu:23.04

# RUN useradd -s /bin/bash sftnight

ENV LANG=C.UTF-8



COPY packages.txt packages.txt

RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime  \
 && apt-get -y install $(cat packages.txt) --no-install-recommends \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm packages.txt



ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN mkdir -p /py-venv && python3 -m venv /py-venv/ROOT-CI && /py-venv/ROOT-CI/bin/pip install --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install -r requirements-root.txt -r requirements-roottest.txt openstacksdk \
 && rm -f requirements-root.txt requirements-roottest.txt

RUN update-ca-certificates

#RUN yes | unminimize \
# && apt-get autoremove -y \
# && apt-get clean -y \
# && rm -rf /var/cache/apt/archives/* \
# && rm -rf /var/lib/apt/lists/*

