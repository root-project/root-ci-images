
## Build
```sh
docker build -t ghcr.io/olemorud/centos7:buildready .
```

## Run
```sh
docker run \
  -it \
  --rm \
  --volume /cvmfs:/cvmfs:shared \
  ghcr.io/olemorud/centos7:buildready
```
