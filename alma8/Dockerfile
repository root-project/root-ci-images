FROM gitlab-registry.cern.ch/linuxsupport/alma8-base

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN dnf update -y \
 && dnf install -y epel-release \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

# We request only Python 3.12 in our packages.txt file but the Alma8 image will
# present also Python3.6, probably there as a dependency of other packages. Make
# sure the OS recognizes our Python version as the main one.
RUN alternatives --set python3 /usr/bin/python3.12

# The PySpark tests require Java 17
# See https://developers.redhat.com/blog/2018/12/10/install-java-rhel8#switch_java_versions
RUN alternatives --set java $(alternatives --display java | grep 'family java-17-openjdk' | cut -d' ' -f1)
RUN alternatives --set javac $(alternatives --display javac | grep 'family java-17-openjdk' | cut -d' ' -f1)

# Install torch directly from pytorch.org to avoid pulling in CUDA
RUN mkdir -p /py-venv \
 && python3 -m venv /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt openstacksdk \
 && rm -f requirements-root.txt
