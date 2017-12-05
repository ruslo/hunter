.. spelling::

    WTL

.. index:: unsorted ; WTL

.. _pkg.WTL:

WTL
===

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.49-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.49
  :alt: Hunter v0.12.49

-  `Official <https://github.com/alamaison/wtl>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/WTL/CMakeLists.txt>`__
- Available since |hunter|
-  Added by `Alexander Lamaison <https://github.com/alamaison>`__
   (`pr-329 <https://github.com/ruslo/hunter/pull/329>`__)

.. code-block:: cmake

    hunter_add_package(WTL)
    find_package(WTL CONFIG REQUIRED)
    target_link_libraries(... WTL::WTL)
