FROM fedora:43

COPY packages.txt packages.txt
ADD https://raw.githubusercontent.com/root-project/root/master/requirements.txt requirements-root.txt

RUN dnf update -y \
 && dnf install -y --setopt=install_weak_deps=False $(cat packages.txt) \
 && rm -f packages.txt \
 && dnf clean all \
 && rm -rf /var/cache/dnf

RUN mkdir -p /py-venv
RUN cat > forbidden.txt <<'EOF'
numba
onnx
scikit-learn
tensorflow
torch
xgboost
EOF
RUN grep -v -x -F -f forbidden.txt requirements-root.txt > requirements-root-cleaned.txt && \
    python3 -m venv /py-venv/ROOT-CI && \
    /py-venv/ROOT-CI/bin/pip install --no-cache-dir --upgrade pip && \
    /py-venv/ROOT-CI/bin/pip install --no-cache-dir -r requirements-root-cleaned.txt openstacksdk && \
    rm -f requirements-root.txt forbidden.txt requirements-root-cleaned.txt
