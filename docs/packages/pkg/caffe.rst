.. spelling::

    caffe

.. index:: computer-vision ; caffe

.. _pkg.caffe:

caffe
=====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.16.5-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.16.5
  :alt: Hunter v0.16.5

-  `Official <https://github.com/BVLC/caffe>`__
-  `Hunterized <https://github.com/hunter-packages/caffe>`__
- Available since |hunter|
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/caffe/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(caffe)
    find_package(Caffe CONFIG REQUIRED)
    target_link_libraries(... caffe)

Notes
-----

-  Works only on Linux with minimal set of dependencies (e.g. no CUDA)
-  Android port: https://github.com/sh1r0/caffe-android-lib
