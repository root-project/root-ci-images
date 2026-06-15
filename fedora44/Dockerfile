FROM fedora:44

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN dnf update -y \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

 # install CEF
RUN mkdir -p /opt/cef \
    && cd /opt/cef \
    && curl -L https://cef-builds.spotifycdn.com/cef_binary_148.0.10%2Bg7ee53f5%2Bchromium-148.0.7778.218_linux64_minimal.tar.bz2 -o cef.tar.bz2 \
    && curl -L https://cef-builds.spotifycdn.com/cef_binary_148.0.10%2Bg7ee53f5%2Bchromium-148.0.7778.218_linux64_minimal.tar.bz2.sha1 -o cef.tar.bz2.sha1 \
    && [ "$(cat cef.tar.bz2.sha1)" = "$(sha1sum cef.tar.bz2 | awk '{print $1}')" ] \
    && tar xjf cef.tar.bz2 \
    && mv 'cef_binary_148.0.10+g7ee53f5+chromium-148.0.7778.218_linux64_minimal' cef_binary_148 \
    && cd cef_binary_148 \
    && mkdir build \
    && cd build \
    && cmake .. \
    && cmake --build . --target libcef_dll_wrapper -j4

# set shell variable for ROOT build
ENV CEF_ROOT=/opt/cef/cef_binary_148

# Install torch directly from pytorch.org to avoid pulling in CUDA
RUN mkdir -p /py-venv \
 && python3 -m venv /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt openstacksdk \
 && rm -f requirements-root.txt
