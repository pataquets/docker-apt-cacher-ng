FROM pataquets/ubuntu:bionic

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      apt-cacher-ng \
      ca-certificates \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  mkdir -vp /var/log/apt-cacher-ng && \
  ln -vs /dev/stdout /var/log/apt-cacher-ng/apt-cacher.log && \
  ln -vs /dev/stderr /var/log/apt-cacher-ng/apt-cacher.err

ENTRYPOINT [ "apt-cacher-ng", "ForeGround=1", "LogDir=/var/log/apt-cacher-ng/" ]
