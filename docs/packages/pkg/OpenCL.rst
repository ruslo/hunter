.. spelling::

    OpenCL

.. index:: concurrency ; OpenCL

.. _pkg.OpenCL:

OpenCL
======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.17.3-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.17.3
  :alt: Hunter v0.17.3

-  `Official <https://github.com/KhronosGroup/OpenCL-ICD-Loader>`__
-  `Hunterized <https://github.com/hunter-packages/OpenCL-ICD-Loader/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/OpenCL/CMakeLists.txt>`__
- Available since |hunter|

Adds OpenCL headers and ICD (Installable Client Driver)
https://github.com/KhronosGroup/OpenCL-ICD-Loader

- Platforms: Windows VS12+/MSYS, Linux
- Version: currently OpenCL 2.1+

Usage
-----

.. code-block:: cmake

    hunter_add_package(OpenCL)
    find_package(OpenCL CONFIG REQUIRED)

    target_link_libraries(... PRIVATE OpenCL::OpenCL)

Pitfalls
--------

-  Requirements for Ubuntu (see `issue
   853 <https://github.com/ruslo/hunter/issues/853>`__):

.. code::

       sudo apt-get install mesa-common-dev
