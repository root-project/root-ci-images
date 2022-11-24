
FROM ubuntu:18.04

RUN useradd -s /bin/bash sftnight

ENV LANG=C.UTF-8

COPY packages packages

RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime  \
 && apt-get -y install $(cat packages) --no-install-recommends \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm packages

COPY cmakepatch.sh /cmakepatch.sh

RUN chmod u+x /cmakepatch.sh \
&& /cmakepatch.sh \
&& rm /cmakepatch.sh

RUN update-ca-certificates

#RUN yes | unminimize \
# && apt-get autoremove -y \
# && apt-get clean -y \
# && rm -rf /var/cache/apt/archives/* \
# && rm -rf /var/lib/apt/lists/*

ENV OPTIONS -DCMAKE_CXX_STANDARD=17 \
            -Dgnuinstall=ON \
            -Dsoversion=ON \
            -Dbuiltin_tbb=OFF \
            -Dbuiltin_lzma=OFF \
            -Dxrootd=OFF

USER sftnight

