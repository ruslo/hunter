.. spelling::

    cpp

.. index:: concurrency ; thread-pool-cpp

.. _pkg.thread-pool-cpp:

thread-pool-cpp
===============

-  `GitHub official <https://github.com/inkooboo/thread-pool-cpp>`__
-  `Hunterized <https://github.com/hunter-packages/thread-pool-cpp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/thread-pool-cpp/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(thread-pool-cpp)
    find_package(thread-pool-cpp CONFIG REQUIRED)
    target_link_libraries(... thread-pool-cpp::thread-pool-cpp)
