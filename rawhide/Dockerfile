FROM fedora:rawhide AS image

COPY packages.txt packages.txt

RUN dnf update -y \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

RUN mkdir -p /py-venv-3.14t \
 && python3.14t -m venv /py-venv-3.14t/ROOT-CI \
 && /py-venv-3.14t/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv-3.14t/ROOT-CI/bin/pip install --no-cache-dir numpy pandas pytest requests setuptools openstacksdk

RUN mkdir -p /py-venv-3.14td \
 && python3.14td -m venv /py-venv-3.14td/ROOT-CI \
 && /py-venv-3.14td/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv-3.14td/ROOT-CI/bin/pip install --no-cache-dir numpy pandas pytest requests setuptools openstacksdk

RUN mkdir -p /py-venv-3.15t \
 && python3.15t -m venv /py-venv-3.15t/ROOT-CI \
 && /py-venv-3.15t/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv-3.15t/ROOT-CI/bin/pip install --no-cache-dir numpy pandas pytest requests setuptools openstacksdk

RUN mkdir -p /py-venv-3.15td \
 && python3.15td -m venv /py-venv-3.15td/ROOT-CI \
 && /py-venv-3.15td/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv-3.15td/ROOT-CI/bin/pip install --no-cache-dir numpy pandas pytest requests setuptools openstacksdk

RUN mkdir -p /py-venv \
 && python3-debug -m venv --system-site-packages /py-venv/ROOT-CI \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip \
 && /py-venv/ROOT-CI/bin/pip install --no-cache-dir uhi nbconvert ipython ipykernel metakernel

# Record the exact versions pip resolved to in each venv, so that CI can report
# them without having to pull the image (see the pip-freeze stage below).
RUN for venv in /py-venv /py-venv-3.14t /py-venv-3.14td /py-venv-3.15t /py-venv-3.15td; do \
        "$venv/ROOT-CI/bin/pip" freeze --local > "$venv/ROOT-CI/pip-freeze.txt"; \
    done

FROM scratch AS pip-freeze
COPY --from=image /py-venv/ROOT-CI/pip-freeze.txt        /pip-freeze.txt
COPY --from=image /py-venv-3.14t/ROOT-CI/pip-freeze.txt  /pip-freeze-3.14t.txt
COPY --from=image /py-venv-3.14td/ROOT-CI/pip-freeze.txt /pip-freeze-3.14td.txt
COPY --from=image /py-venv-3.15t/ROOT-CI/pip-freeze.txt  /pip-freeze-3.15t.txt
COPY --from=image /py-venv-3.15td/ROOT-CI/pip-freeze.txt /pip-freeze-3.15td.txt
