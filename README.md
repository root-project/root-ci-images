# Docker images that are ready to build ROOT

These docker images contain the dependencies needed to build [root](https://root.cern/) from source.

They also ensure that `cmake` will run a cmake with version >=3.16. The cmake arguments for building root are set to the environment variable `OPTIONS`.

These are used by ROOT's Github Actions based continuous integration system - so you can trust them :-)

## Install, build and run ROOT manually within an image

To install ROOT, pull the source code from the github repository and build it with cmake:
```sh
cd /tmp/

git clone -b $BRANCH --single-branch --depth 1 https://github.com/root-project/root.git

mkdir -p /tmp/build
cd /tmp/build

cmake /tmp/root/ $OPTIONS

cmake --build . --target install -- -j$(nproc)
```

To run it, just invoke `root`!
