.. spelling::

    cacheable
    SSL
    thrift
    Thrift
    toolchain

.. index:: serialize ; thrift

.. _pkg.thrift:

thrift
======

-  `Official <https://thrift.apache.org>`__
-  `Hunterized <https://github.com/hunter-packages/thrift>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/thrift/CMakeLists.txt>`__
-  Added by `isaachier <https://github.com/isaachier>`__ (`pr-1064 <https://github.com/ruslo/hunter/pull/1064>`__)

This package **does not** compile the Thrift compiler by default. Nor does it
compile the ``thriftz`` and ``thrifnb`` libraries. It just builds the basic ``thrift``
library, without SSL support. To compile the Thrift compiler, you must pass in
custom CMake arguments in your toolchain, namely ``BUILD_COMPILER=ON``.
Similarly, to build ``thriftz``, pass ``WITH_ZLIB=ON``. To build ``thriftnb``,
pass ``WITH_LIBEVENT=ON``. To compile with SSL support, pass ``WITH_OPENSSL=ON``.

.. code-block:: cmake

    hunter_add_package(thrift)
    find_package(thrift CONFIG REQUIRED)
    target_link_libraries(foo PUBLIC
        thrift::thrift            # Main thrift library, thrift_static for static library
        thrift::thriftz           # thrift ZLIB support
        thrift::thriftnb)         # thrift Libevent non-blocking support
