.. spelling::

    OpenCL

.. index:: concurrency ; OpenCL-cpp

.. _pkg.OpenCL-cpp:

OpenCL-cpp
==========

-  `Official <https://github.com/KhronosGroup/OpenCL-CLHPP>`__
-  `Hunterized <https://github.com/hunter-packages/OpenCL-CLHPP>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/OpenCL-cpp/CMakeLists.txt>`__

Adds c++ wrappers for OpenCL, http://github.khronos.org/OpenCL-CLHPP/

- Platforms: Windows VS12+/MSYS, Linux (limited by OpenCL package)


Usage
-----

.. code-block:: cmake

    hunter_add_package(OpenCL-cpp)
    find_package(OpenCL-cpp CONFIG REQUIRED)

    target_link_libraries(... PRIVATE OpenCL-cpp::OpenCL-cpp)
