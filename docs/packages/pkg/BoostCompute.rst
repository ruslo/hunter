.. spelling::

    BoostCompute

.. index:: concurrency ; BoostCompute

.. _pkg.BoostCompute:

BoostCompute
============

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.45-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.45
  :alt: Hunter v0.12.45

-  `Official <https://github.com/boostorg/compute>`__
-  `Hunterized <https://github.com/hunter-packages/boost-compute>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Boost-compute/CMakeLists.txt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(BoostCompute)
    find_package(BoostCompute CONFIG REQUIRED)
    target_link_libraries(... BoostCompute::boost_compute)
