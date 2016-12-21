.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Creating new package
--------------------

.. _creating new:

This is a guide for adding new package to Hunter. We start with the simple
one (CMake based, no dependencies), then cover "hunterization" (CMake based,
depends on other packages). Final is a most complex one (non-CMake packages,
creating custom build scheme).

.. toctree::
   :maxdepth: 1

   /creating-new/cmake
   /creating-new/cmake-dependencies
   /creating-new/custom
