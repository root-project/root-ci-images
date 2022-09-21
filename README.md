# root-baseimages
These docker images contain the dependencies needed to build [root](https://root.cern/) from source.

They also ensure that `cmake` will run a cmake with version >=3. The cmake arguments for building root are set to the environment variable `OPTIONS`.

These are used by a Jenkins pipeline that eventually runs `cmake /tmp/root/ -DCMAKE_INSTALL_PREFIX=/usr $OPTIONS`
