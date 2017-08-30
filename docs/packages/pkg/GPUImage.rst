.. spelling::

    GPUImage

.. index:: concurrency ; GPUImage

.. _pkg.GPUImage:

GPUImage
========

-  `Official <https://github.com/BradLarson/GPUImage>`__
-  `Hunterized <https://github.com/hunter-packages/GPUImage/tree/hunter>`__

.. code-block:: cmake

    hunter_add_package(GPUImage)
    find_package(GPUImage CONFIG)

    target_link_libraries(... PUBLIC GPUImage::gpuimage)

Example
-------

A self contained test application can be run in the hunterized GPUImage
fork using the following `polly <https://github.com/ruslo/polly>`__
build command (CMake build script):

.. code-block:: bash

    wget https://github.com/hunter-packages/GPUImage/archive/v0.1.6-p2.tar.gz
    tar zxvf v0.1.6-p2.tar.gz
    cd GPUImage/examples/iOS/CubeExample
    build.py --toolchain ios-8-2 --verbose --jobs 8 --open

-  TODO: move to Travis CI config of `hunterized
   repo <https://github.com/hunter-packages/GPUImage>`__
