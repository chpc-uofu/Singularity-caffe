# Ubuntu 17.10 
# !!! Update to 18.04 when released in April 2018
#

#
#
# If you use this to create a container inside a virtual machine with no access to
# a GPU, comment out the final test.
# need Ubuntu 17.10, 17.04 does not have caffe-cuda

BootStrap:docker
From: ubuntu:18.04
#From:nvidia/cuda:9.1-runtime-ubuntu17.04

%runscript
  exec python3 "$@" 

%post
  apt-get update && apt-get install -y --no-install-recommends \
        apt-utils \
        build-essential \
        curl \
        git \
        libopenblas-dev \
        libcurl4-openssl-dev \
        libfreetype6-dev \
        libpng-dev \
        libzmq3-dev \
        locales \
        python-pip \
        pkg-config \
        python-dev \
        python-setuptools \
        rsync \
        software-properties-common \
        unzip \
        vim \
        zip \
        zlib1g-dev
  apt-get clean

  locale-gen "en_US.UTF-8"
  dpkg-reconfigure locales
  export LANGUAGE="en_US.UTF-8"
  echo 'LANGUAGE="en_US.UTF-8"' >> /etc/default/locale
  echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale

  apt install -y caffe-cuda
  # need to create mount point for home dir, scratch
  mkdir /uufs /scratch

  # need to create mount point for nvidia-smi - it complains when trying to launch writable image
  touch /bin/nvidia-smi

%test
  # Sanity check that the container is operating

  # Test numpy 
  /usr/bin/python3 -c "import numpy as np;np.__config__.show()"
  # Ensure that TensorFlow can be imported and session started (session start touches GPU)
  # 2.4 - no GPU seems to be imported during test so skip
  # /usr/bin/python3 -c "import caffe;caffe.set_device(0);caffe.set_mode_gpu()"



