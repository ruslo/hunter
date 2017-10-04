.. spelling::

    opentracing
    cpp

.. index:: frameworks ; opentracing-cpp

.. _pkg.opentracing-cpp:

opentracing-cpp
===============

-  `Official <https://github.com/opentracing/opentracing-cpp>`__
-  `Hunterized <https://github.com/hunter-packages/opentracing-cpp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/opentracing-cpp/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1070 <https://github.com/ruslo/hunter/pull/1070>`__)

.. code-block:: cmake

    hunter_add_package(opentracing-cpp)
    find_package(OpenTracing CONFIG REQUIRED)
    # Shared library
    target_link_libraries(... OpenTracing::opentracing)
    # Static library
    target_link_libraries(... OpenTracing::opentracing-static)
