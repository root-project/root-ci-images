FROM debian:10

# RUN useradd -s /bin/bash sftnight

ENV LANG=C.UTF-8

COPY packages.txt packages.txt

# Regarding the openjdk-??-jre-headless / ca-certificates-java:
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/2003822
RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime  \
 && apt-get install -y openjdk-11-jre-headless ca-certificates-java \
 && apt-get remove -y openjdk-11-jre-headless \
 && apt-get -y install $(cat packages.txt) --no-install-recommends \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm packages.txt \
 && update-ca-certificates \
 && curl -O -L https://github.com/Kitware/CMake/releases/download/v3.26.2/cmake-3.26.2-linux-x86_64.sh \
 && sh ./cmake-*.sh --skip-license --prefix=/usr/local/ \
 && rm ./cmake-*.sh


ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install -r requirements-root.txt -r requirements-roottest.txt openstacksdk \
 && rm -f requirements-root.txt requirements-roottest.txt



#RUN yes | unminimize \
# && apt-get autoremove -y \
# && apt-get clean -y \
# && rm -rf /var/cache/apt/archives/* \
# && rm -rf /var/lib/apt/lists/*

