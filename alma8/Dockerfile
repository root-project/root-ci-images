FROM gitlab-registry.cern.ch/linuxsupport/alma8-base

COPY packages.txt packages.txt

RUN dnf update -q -y \
 && dnf install -y epel-release \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && dnf autoremove \
 && dnf clean all \
 && rm -f packages.txt \
 && curl -O -L https://github.com/Kitware/CMake/releases/download/v3.26.2/cmake-3.26.2-linux-x86_64.sh \
 && chmod a+x cmake-*.sh \
 && ./cmake-*.sh \
 && rm ./cmake-*.sh


ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install -r requirements-root.txt -r requirements-roottest.txt openstacksdk \
 && rm -f requirements-root.txt requirements-roottest.txt
