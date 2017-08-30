.. spelling::

    OpenCL

.. index:: concurrency ; OpenCL

.. _pkg.OpenCL:

OpenCL
======

-  `Official <https://github.com/KhronosGroup/OpenCL-ICD-Loader>`__
-  `Hunterized <https://github.com/hunter-packages/OpenCL-ICD-Loader/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/OpenCL/CMakeLists.txt>`__
-  Available since
   `v0.17.3 <https://github.com/ruslo/hunter/releases/tag/v0.17.3>`__

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

or backwards compatible

.. code-block:: cmake

    hunter_add_package(OpenCL)
    find_package(OpenCL REQUIRED)

    include_directories(${OpenCL_INCLUDE_DIRS})
    target_link_libraries(... PRIVATE ${OpenCL_LIBRARIES})

Pitfalls
--------

-  Requirements for Ubuntu (see `issue
   853 <https://github.com/ruslo/hunter/issues/853>`__):

.. code::

       sudo apt-get install mesa-common-dev
