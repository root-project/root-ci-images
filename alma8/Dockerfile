FROM gitlab-registry.cern.ch/linuxsupport/alma8-base

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN dnf update -y \
 && dnf install -y epel-release \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

# We request only Python 3.8 in our packages.txt file but the Alma8 image will
# present also Python3.6, probably there as a dependency of other packages. Make
# sure the OS recognizes our Python version as the main one.
RUN alternatives --set python3 /usr/bin/python3.8

RUN mkdir -p /py-venv \
 && python3 -m venv /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt -r requirements-roottest.txt openstacksdk==1.4.0 \
 && rm -f requirements-root.txt requirements-roottest.txt
