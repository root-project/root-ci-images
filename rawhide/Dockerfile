FROM fedora:rawhide

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN dnf update -y \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

RUN mkdir -p /py-venv-3.14t \
 && python3.14t -m venv /py-venv-3.14t/ROOT-CI \
 && /py-venv-3.14t/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv-3.14t/ROOT-CI/bin/pip install --no-cache-dir numpy pytest setuptools

RUN mkdir -p /py-venv \
 && python3-debug -m venv --system-site-packages /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir uhi nbconvert ipython ipykernel metakernel

RUN rm -f requirements-root.txt
