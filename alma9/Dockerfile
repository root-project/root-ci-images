FROM gitlab-registry.cern.ch/linuxsupport/alma9-base

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN dnf update -y \
 && dnf install -y epel-release \
 && dnf install -y 'dnf-command(config-manager)' \
 && crb enable \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

# Make sure that Python 3.12 is the default Python
RUN ln -sf /usr/bin/python3.12 /usr/bin/python3

# Install torch directly from pytorch.org to avoid pulling in CUDA
RUN mkdir -p /py-venv \
 && python3 -m venv /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt openstacksdk \
 && rm -f requirements-root.txt
