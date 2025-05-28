FROM ubuntu:25.10

ENV LANG=C.UTF-8

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime  \
 && apt-get -y install $(cat packages.txt) --no-install-recommends \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm packages.txt

RUN update-ca-certificates

RUN mkdir -p /py-venv \
 && python3 -m venv --system-site-packages /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt -r requirements-roottest.txt openstacksdk \
 && rm -f requirements-root.txt requirements-roottest.txt
