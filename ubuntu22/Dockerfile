
FROM ubuntu:22.04

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

#RUN yes | unminimize \
# && apt-get autoremove -y \
# && apt-get clean -y \
# && rm -rf /var/cache/apt/archives/* \
# && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

ENV OPTIONS -DCMAKE_CXX_STANDARD=17 \
            -Dgnuinstall=ON \
            -Dsoversion=ON \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_INSTALL_BINDIR=bin \
            -DCMAKE_INSTALL_CMAKEDIR=lib/x86_64-linux-gnu/cmake/ROOT \
            -DCMAKE_INSTALL_DATAROOTDIR=sha \
            -DCMAKE_INSTALL_DATADIR=share/root \
            -DCMAKE_INSTALL_DOCDIR=share/doc/root \
            -DCMAKE_INSTALL_ELISPDIR=share/emacs/site-lisp \
            -DCMAKE_INSTALL_FONTDIR=share/root/fonts \
            -DCMAKE_INSTALL_ICONDIR=share/root/icons \
            -DCMAKE_INSTALL_INCLUDEDIR=include/ROOT \
            -DCMAKE_INSTALL_JSROOTDIR=share/root/js \
            -DCMAKE_INSTALL_LIBDIR=lib/x86_64-linux-gnu \
            -DCMAKE_INSTALL_MACRODIR=share/root/macros \
            -DCMAKE_INSTALL_MANDIR=share/man \
            -DCMAKE_INSTALL_OPENUI5DIR=share/root/ui5 \
            -DCMAKE_INSTALL_PYTHONDIR=lib/python3/dist-packages \
            -DCMAKE_INSTALL_SRCDIR=/dev/null \
            -DCMAKE_INSTALL_SYSCONFDIR=/etc/root \
            -DCMAKE_INSTALL_TUTDIR=share/root/tutorials

USER sftnight

