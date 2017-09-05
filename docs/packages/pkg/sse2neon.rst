.. spelling::

    sse

.. index:: cpu ; sse2neon

.. _pkg.sse2neon:

sse2neon
========

-  `Hunterized <https://github.com/hunter-packages/sse2neon>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/sse2neon/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(sse2neon)
    find_package(sse2neon CONFIG REQUIRED)
    target_link_libraries(... sse2neon::sse2neon)
