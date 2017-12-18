.. spelling::

    libcpuid

.. index:: unsorted ; libcpuid

.. _pkg.libcpuid:

libcpuid
========

-  http://libcpuid.sourceforge.net/
-  `Hunterized <https://github.com/hunter-packages/libcpuid>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/libcpuid/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(libcpuid)
    find_package(libcpuid CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC libcpuid::libcpuid)
