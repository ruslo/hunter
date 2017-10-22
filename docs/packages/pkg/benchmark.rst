.. spelling::

    benchmark

.. index:: serialization ; benchmark

.. _pkg.benchmark:

benchmark
=========

-  `Official <https://github.com/google/benchmark>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/benchmark/CMakeLists.txt>`__
-  Added by `Isaac Hier <https://github.com/isaachier>`__ (`pr-1088 <https://github.com/ruslo/hunter/pull/1088>`__)

.. code-block:: cmake

    hunter_add_package(benchmark)
    find_package(benchmark CONFIG REQUIRED)
    target_link_libraries(... benchmark::benchmark)
