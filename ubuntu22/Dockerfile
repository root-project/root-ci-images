FROM ubuntu:22.04

ARG PIP_COOLDOWN=--uploaded-prior-to=P7D

ENV LANG=C.UTF-8

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime  \
 && apt-get -y install $(cat packages.txt) --no-install-recommends \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/* \
 && rm packages.txt

RUN update-ca-certificates

# Install a newer CMake version (let's use 3.30.5 because it's the same as in RHEL 10)
RUN curl -LO https://github.com/Kitware/CMake/releases/download/v3.30.5/cmake-3.30.5-linux-x86_64.sh && \
    chmod +x cmake-3.30.5-linux-x86_64.sh && \
    ./cmake-3.30.5-linux-x86_64.sh --skip-license --prefix=/usr/local && \
    rm cmake-3.30.5-linux-x86_64.sh && \
    cmake --version

# Install torch directly from pytorch.org to avoid pulling in CUDA
RUN mkdir -p /py-venv \
 && python3 -m venv /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
 && /py-venv/ROOT-CI/bin/pip install ${PIP_COOLDOWN} --no-cache-dir -r requirements-root.txt openstacksdk

# The python3.11 package from the Ubuntu 22.04 archive is stuck at the
# 3.11.0rc1 pre-release, which is too old for the current Python ecosystem
# (torch requires sys.get_int_max_str_digits, added in Python 3.11.0rc2).
# Install Python 3.12 from the deadsnakes PPA instead.
# The PPA's signing key is fetched as ASCII-armored text, which apt accepts
# in trusted.gpg.d without needing gnupg in the image.
RUN curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xba6932366a755776" \
       -o /etc/apt/trusted.gpg.d/deadsnakes.asc \
 && echo "deb https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu jammy main" \
       > /etc/apt/sources.list.d/deadsnakes.list \
 && apt-get update -qq \
 && apt-get -y install python3.12 python3.12-dev python3.12-venv --no-install-recommends \
 && apt-get autoremove -y \
 && apt-get clean -y \
 && rm -rf /var/cache/apt/archives/* \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /py-venv-3.12 \
 && python3.12 -m venv /py-venv-3.12/ROOT-CI \
 && /py-venv-3.12/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv-3.12/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
 && /py-venv-3.12/ROOT-CI/bin/pip install ${PIP_COOLDOWN} --no-cache-dir -r requirements-root.txt openstacksdk \
 && rm -f requirements-root.txt
