.. Copyright (c) 2017, Ruslan Baratov
.. All rights reserved.

Create package
--------------

This is a guide for adding new package to Hunter. We start with the simple
one (CMake based, no dependencies), then cover "hunterization" (CMake based,
depends on other packages). Final is a most complex one (non-CMake packages,
creating custom build scheme).

.. toctree::
   :maxdepth: 1

   /creating-new/create/cmake
   /creating-new/create/cmake-dependencies
   /creating-new/create/autotools
   /creating-new/create/custom
