
FROM fedora:37

# RUN useradd -s /bin/bash sftnight

RUN dnf update -y \
 && dnf clean all \
 && rm -rf /var/cache/dnf

COPY packages.txt packages.txt

RUN dnf install $(cat packages.txt) -y --setopt=install_weak_deps=False \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

COPY pip-packages.txt pip-packages.txt

RUN python3 -m pip install --upgrade pip \
 && python3 -m pip install $(cat pip-packages.txt) \
 && rm -f pip-packages.txt
