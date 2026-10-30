FROM registry.cern.ch/root-ci/alma10:buildready

# NVIDIA CUDA repo (AlmaLinux 10 is officially supported as rhel10)
RUN dnf -y install dnf-plugins-core && \
    dnf config-manager --set-enabled crb && \
    dnf config-manager --add-repo \
      https://developer.download.nvidia.com/compute/cuda/repos/rhel10/x86_64/cuda-rhel10.repo && \
    dnf -y install cuda-toolkit-13 libcudnn9-devel-cuda-13 && \
    dnf clean all && \
    rm -rf /var/cache/dnf

ENV PATH=/usr/local/cuda/bin:${PATH}
ENV CUDACXX=/usr/local/cuda/bin/nvcc
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

