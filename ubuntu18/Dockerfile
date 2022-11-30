
FROM ubuntu:18.04

# RUN useradd -s /bin/bash sftnight

ENV LANG=C.UTF-8

# Get cmake 3.24
COPY cmakepatch.sh /cmakepatch.sh

RUN chmod u+x /cmakepatch.sh \
&& /cmakepatch.sh \
&& rm /cmakepatch.sh

# Install ROOT dependencies
COPY packages.txt packages.txt

RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime  \
 && apt-get -y install $(cat packages.txt) --no-install-recommends \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm packages.txt

COPY pip-packages.txt pip-packages.txt

RUN pip3 install --upgrade pip \
 && pip3 install $(cat pip-packages.txt)

RUN update-ca-certificates

#RUN yes | unminimize \
# && apt-get autoremove -y \
# && apt-get clean -y \
# && rm -rf /var/cache/apt/archives/* \
# && rm -rf /var/lib/apt/lists/*

