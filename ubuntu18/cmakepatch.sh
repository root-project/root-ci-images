
# This script builds and installs a newer version of CMake from scratch
# cmake >= 3.16 is needed to build ROOT, ubuntu18 repositories do have this

apt-get update
apt-get install -y build-essential libtool autoconf unzip wget libssl-dev
apt-get autoremove -y
apt-get clean -y
rm -rf /var/cache/apt/archives/*
rm -rf /var/lib/apt/lists/*

version=3.24
build=1
mkdir -p /tmp/cmake
cd /tmp/cmake
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz --no-check-certificate
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/

./bootstrap
make -j$(nproc)
make install
