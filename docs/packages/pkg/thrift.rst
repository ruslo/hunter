.. spelling::

    thrift

.. index:: serialize ; thrift

.. _pkg.thrift:

thrift
======

-  `Official <https://thrift.apache.org>`__
-  `Hunterized <https://github.com/hunter-packages/thrift>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/thrift/CMakeLists.txt>`__
-  Added by `isaachier <https://github.com/isaachier>`__ (`pr-1064 <https://github.com/ruslo/hunter/pull/1064>`__)

.. code-block:: cmake

    hunter_add_package(thrift)
    find_package(thrift CONFIG REQUIRED)
    target_link_libraries(foo
        thrift::thrift            # Main thrift library, thrift_static for static library
        thrift::thriftz           # thrift ZLIB support
        thrift::thriftnb)         # thrift Libevent non-blocking support

    # If you just need the core C++ library, not the compiler or ZLIB/Libevent
    # support, use the libthrift package instead
    hunter_add_package(libthrift)
    find_package(thrift CONFIG REQUIRED)
    target_link_libraries(foo PUBLIC thrift::thrift)
