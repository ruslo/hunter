.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Manage anything
---------------

.. _manage-anything:

You can manage anything that can be downloaded by ``URL`` and checked with
``SHA1`` hash:

* C/C++ packages

.. code-block:: cmake
  :emphasize-lines: 2, 5

  hunter_add_package(Boost)
  find_package(Boost CONFIG REQUIRED)

  hunter_add_package(OpenSSL)
  find_package(OpenSSL REQUIRED)

* CMake modules

.. code-block:: cmake
  :emphasize-lines: 4

  hunter_add_package(sugar)
  find_package(sugar CONFIG REQUIRED)

  sugar_files(...)

* Additional sources (`OpenCV example <https://github.com/hunter-packages/opencv/blob/e91796b4c52994fcec5a8eafeacc618d54d31d8d/CMakeLists.txt#L449>`__):

.. code-block:: cmake
  :emphasize-lines: 4

  set(OPENCV_EXTRA_MODULES_PATH "" CACHE PATH "Where to look for additional OpenCV modules")
  if(OPENCV_WITH_EXTRA_MODULES)
    hunter_add_package(OpenCV-Extra)
    set(OPENCV_EXTRA_MODULES_PATH "${OPENCV-EXTRA_ROOT}/modules")
  endif()

* Resources (pictures, data for testing, ...)

.. code-block:: cmake
  :emphasize-lines: 3-4

  hunter_add_package(MyData)

  add_test(NAME FooTest1 COMMAND foo --use-data "${MYDATA_ROOT}/case-1.png")
  add_test(NAME FooTest2 COMMAND foo --use-data "${MYDATA_ROOT}/case-2.png")
  # ...

.. note::

  * See :doc:`alternative approach </user-guides/cmake-user/private-data>`
