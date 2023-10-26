FROM gitlab-registry.cern.ch/linuxsupport/alma8-base

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN dnf update -y \
 && dnf install -y epel-release \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf \
 && curl -O -L https://github.com/Kitware/CMake/releases/download/v3.26.2/cmake-3.26.2-linux-x86_64.sh \
 && sh ./cmake-*.sh --skip-license --prefix=/usr/local/ \
 && rm ./cmake-*.sh

RUN mkdir -p /py-venv \
 && python3 -m venv /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install -r requirements-root.txt -r requirements-roottest.txt openstacksdk==1.4.0 \
 && rm -f requirements-root.txt requirements-roottest.txt
