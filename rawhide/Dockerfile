FROM fedora:rawhide

COPY packages.txt packages.txt

RUN dnf update -y \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

RUN mkdir -p /py-venv \
 && python3-debug -m venv --system-site-packages /py-venv/ROOT-CI
