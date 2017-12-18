.. spelling::

    BoostProcess

.. index:: frameworks ; BoostProcess

.. _pkg.BoostProcess:

BoostProcess
============

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.50-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.50
  :alt: Hunter v0.12.50

-  `Official <https://github.com/BorisSchaeling/boost-process>`__
-  `Hunterized <https://github.com/alamaison/boost-process/tree/cmake>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Boost-process/CMakeLists.txt>`__
-  Added by `Alexander Lamaison <https://github.com/alamaison>`__
   (`pr-330 <https://github.com/ruslo/hunter/pull/330>`__)
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(BoostProcess)
    find_package(BoostProcess CONFIG REQUIRED)
    target_link_libraries(... BoostProcess::boost_process)
