FROM opensuse/leap:15

ENV LANG=C.UTF-8

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN zypper -n ref \
    && zypper -n install --no-recommends $(cat packages.txt) \
    && rm -f packages.txt \
    && zypper -n clean -a \
    && rm -rf /var/cache/zypp

# Install GCC 13 (Leap 15.x ships GCC 7.5 by default)
RUN zypper -n install --no-recommends gcc13 gcc13-c++ gcc13-fortran libstdc++6-devel-gcc13 \
    && zypper -n clean -a

ENV CC=gcc-13 CXX=g++-13 FC=gfortran-13

# Install torch directly from pytorch.org to avoid pulling in CUDA
RUN mkdir -p /py-venv \
    && python3.12 -m venv /py-venv/ROOT-CI \
    && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
    && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
    && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt openstacksdk \
    && rm -f requirements-root.txt
