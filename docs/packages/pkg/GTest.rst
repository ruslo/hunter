.. spelling::

    GTest
    GMock

.. index:: testing ; GTest

.. _pkg.GTest:

GTest
=====

-  `Official <https://code.google.com/p/googletest/>`__
-  `Hunterized <https://github.com/hunter-packages/googletest>`__ (`old
   repo <https://github.com/hunter-packages/gtest>`__)
-  `Dev branch <https://github.com/ruslo/hunter/tree/gtest>`__
-  `Versions <https://github.com/ruslo/hunter/blob/master/cmake/projects/GTest/hunter.cmake>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/GTest/CMakeLists.txt>`__
-  Added by `Knitschi <https://github.com/Knitschi>`__
   (`pr-306 <https://github.com/ruslo/hunter/pull/306>`__)

.. code-block:: cmake

    hunter_add_package(GTest)
    find_package(GTest CONFIG REQUIRED)

    target_link_libraries(foo GTest::main) # GTest::gtest will be linked automatically
    target_link_libraries(boo GTest::gtest)

Bugs
----

-  Cygwin GCC build failed with ``c++11`` flag

.. index:: testing ; GMock

.. _pkg.GMock:

GMock
=====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.42-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.42
  :alt: Hunter v0.12.42

- Available since |hunter|

For package versions 1.8.0-hunter-p1 and higher the package also
includes GMock. When finding the GMock package GTest is automatically
included. Note that package version 1.8.0-hunter-p1 does **not** support
the **MinGW** and **Visual Studio 2005** toolchains, so GMock is not
available in these cases.

.. code-block:: cmake

    hunter_add_package(GTest)
    find_package(GMock CONFIG REQUIRED)

    # GMock::gmock and GTest::main will be linked automatically
    target_link_libraries(foo GMock::main)
