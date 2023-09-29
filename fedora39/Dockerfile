FROM fedora:39

# RUN useradd -s /bin/bash sftnight

RUN dnf update -y \
 && dnf clean all \
 && rm -rf /var/cache/dnf

COPY packages.txt packages.txt

RUN dnf install $(cat packages.txt) -y --setopt=install_weak_deps=False \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt
ADD https://raw.githubusercontent.com/root-project/roottest/master/requirements.txt requirements-roottest.txt

RUN mkdir -p /py-venv && python3 -m venv /py-venv/ROOT-CI && /py-venv/ROOT-CI/bin/pip install --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install -r requirements-root.txt -r requirements-roottest.txt openstacksdk \
 && rm -f requirements-root.txt requirements-roottest.txt

# No numba for Python 3.12 yet, see https://github.com/numba/numba/issues/8841
ENV ROOTTEST_IGNORE_NUMBA_PY3=1
