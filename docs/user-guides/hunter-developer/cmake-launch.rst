.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

CMake launch
------------

Parameters that should be specified while launching new CMake instance
and ``ExternalProject_Add``.

CMAKE_TOOLCHAIN_FILE
====================

* `hunter_download <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/modules/hunter_download.cmake#L375-L380>`__
* `url_sha1_cmake <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/schemes/url_sha1_cmake.cmake.in#L155>`__
* `HunterGate <https://github.com/hunter-packages/gate/blob/master/cmake/HunterGate.cmake#L293-L302>`__

CMAKE_MAKE_PROGRAM
==================

* `hunter_download <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/modules/hunter_download.cmake#L553-L555>`__
* `url_sha1_cmake <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/schemes/url_sha1_cmake.cmake.in#L94-L99>`__
* `HunterGate <https://github.com/hunter-packages/gate/blob/master/cmake/HunterGate.cmake#L304-L310>`__

.. note::

  Use case: Ninja generator without adding Ninja executable to PATH

.. note::

  Test: Check NMake slash/backslash on Windows:

  * `hunter_finalize <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/modules/hunter_finalize.cmake#L161-L166>`__

CMAKE_GENERATOR
===============

* `hunter_download <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/modules/hunter_download.cmake#L546>`__
* `hunter_url_sha1 <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/schemes/url_sha1_cmake.cmake.in#L149>`__
* `HunterGate <https://github.com/hunter-packages/gate/blob/master/cmake/HunterGate.cmake#L317>`__

CMAKE_GENERATOR_TOOLSET
=======================

* `hunter_download <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/modules/hunter_download.cmake#L548-L551>`__

.. note::

  Not needed in ``ExternalProject_Add`` because it will be set by CMake:

  * `ExternalProject <https://gitlab.kitware.com/cmake/cmake/blob/v3.11.3/Modules/ExternalProject.cmake#L2805-2807>`__

CMAKE_GENERATOR_PLATFORM
========================

* `hunter_download <https://github.com/ruslo/hunter/blob/90f1c32fbb04a246ff4aba4a66750ab817ac1e2f/cmake/modules/hunter_download.cmake#L557-L560>`__

.. note::

  Not needed in ``ExternalProject_Add`` because it will be set by CMake:

  * `ExternalProject <https://gitlab.kitware.com/cmake/cmake/blob/v3.11.3/Modules/ExternalProject.cmake#L2799-2801>`__
