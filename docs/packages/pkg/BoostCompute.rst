.. spelling::

    BoostCompute

.. index:: concurrency ; BoostCompute

.. _pkg.BoostCompute:

BoostCompute
============

-  `Official <https://github.com/boostorg/compute>`__
-  `Hunterized <https://github.com/hunter-packages/boost-compute>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/Boost-compute/CMakeLists.txt>`__
-  Available since
   `v0.12.45 <https://github.com/ruslo/hunter/releases/tag/v0.12.45>`__

.. code-block:: cmake

    hunter_add_package(BoostCompute)
    find_package(BoostCompute CONFIG REQUIRED)
    target_link_libraries(... BoostCompute::boost_compute)
