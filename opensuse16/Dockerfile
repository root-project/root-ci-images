FROM opensuse/leap:16.0

ENV LANG=C.UTF-8

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

# add science repository to get xrootd
RUN zypper --gpg-auto-import-keys addrepo --refresh https://download.opensuse.org/repositories/science/openSUSE_Leap_16.0/ science

RUN zypper --gpg-auto-import-keys -n ref \
    && zypper -n install --no-recommends $(cat packages.txt) \
    && rm -f packages.txt \
    && zypper -n clean -a \
    && rm -rf /var/cache/zypp

# Install torch directly from pytorch.org to avoid pulling in CUDA
RUN mkdir -p /py-venv \
    && python3 -m venv /py-venv/ROOT-CI \
    && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
    && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
    && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt openstacksdk \
    && rm -f requirements-root.txt
