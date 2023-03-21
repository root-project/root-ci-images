
FROM ubuntu:20.04

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
 && rm packages.txt \
 && update-ca-certificates



COPY requirements.txt requirements.txt

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install -r requirements.txt \
 && rm -f requirements.txt




#RUN yes | unminimize \
# && apt-get autoremove -y \
# && apt-get clean -y \
# && rm -rf /var/cache/apt/archives/* \
# && rm -rf /var/lib/apt/lists/*

