FROM fedora:43 AS image

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN dnf update -y \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

# Install torch directly from pytorch.org to avoid pulling in CUDA
RUN mkdir -p /py-venv \
 && python3 -m venv /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --index-url https://download.pytorch.org/whl/cpu torch \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root.txt openstacksdk \
 && rm -f requirements-root.txt

# Record the exact versions pip resolved to, so that CI can report them without
# having to pull the image (see the pip-freeze stage below).
RUN /py-venv/ROOT-CI/bin/pip freeze --local > /py-venv/ROOT-CI/pip-freeze.txt

FROM scratch AS pip-freeze
COPY --from=image /py-venv/ROOT-CI/pip-freeze.txt /
