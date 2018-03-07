## Ubuntu 18.04 container with Caffe

The reason we chose Ubuntu 18.04 is because it comes with prebuilt Caffe.

We thus bootstrap base OS image, update (which brings in the repositories information), install a few packages, importantly, OpenBlas for faster BLAS, and then install caffe-cuda. This installs all its dependencies.

More info on the installation process is at [Caffe install page](http://caffe.berkeleyvision.org/install_apt.html).

We dont test the GPU installation as the %post section does not set up GPU stack.

To run the container, make sure to run on a machine with appropriate GPU and bring in the Nvidia stack, e.g. to shell:
```
singularity shell --nv -s /bin/bash ubuntu_caffe_gpu.simg
```

The container by default runs python3, which includes the Caffe, e.g.
```
singularity run --nv ubuntu_caffe_gpu.simg 
>>> import caffe
>>> caffe.set_device(0) 
>>> caffe.set_mode_gpu()
>>> ...
```

Included example, testcaffe.py, should run a small example that leverages Caffe source pulled from GitHub in the CHPC sys branch.
