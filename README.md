# Docker images that are ready to build ROOT
These docker images contain the dependencies needed to build [root](https://root.cern/) from source.

They also ensure that `cmake` will run a cmake with version >=3. The cmake arguments for building root are set to the environment variable `OPTIONS`.

These are used by a Jenkins pipeline that eventually runs `cmake /tmp/root/ -DCMAKE_INSTALL_PREFIX=/usr $OPTIONS`

## Install, build and run ROOT manually within an image
To install ROOT, pull from the github repository and build it with cmake:
```sh
# INSTALL
cd /tmp/

for retry in {1..5}; do
    git clone -b $BRANCH --single-branch --depth 1 https://github.com/root-project/root.git \
    && ERR=false && break
done

mkdir -p /tmp/build
cd /tmp/build

# For ROOT version 6.26.00 set `-Druntime_cxxmodules=OFF` (https://github.com/root-project/root/pull/10198)
cmake /tmp/root/ -DCMAKE_INSTALL_PREFIX=/usr $OPTIONS

cmake --build . --target install -- -j$(nproc)
```

To run it, first source thisroot.sh and then run the executable (/usr/bin is in $PATH)
```sh
source /usr/bin/thisroot.sh
root
```
