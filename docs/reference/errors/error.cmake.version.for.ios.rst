.. spelling::

  ios
  cmake

error.cmake.version.for.ios
===========================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] Using non-patched CMake version for iOS build``

What to do
----------

- You need to build `patched <https://github.com/ruslo/CMake/releases>`_ version of CMake and use it. See `README <https://github.com/ruslo/hunter#notes-about-version-of-cmake>`_.

.. code-block:: bash

    CMAKE_VERSION="3.2.1-ruslo"
    wget "https://github.com/ruslo/CMake/archive/v${CMAKE_VERSION}.tar.gz"
    tar xf "v${CMAKE_VERSION}.tar.gz"
    cd "CMake-${CMAKE_VERSION}"
    build.py --install --toolchain default --config Release --fwd "CMAKE_USE_SYSTEM_CURL=YES"
    export PATH="`pwd`/_install/default/bin:${PATH}"
