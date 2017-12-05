.. spelling::

    half

.. index:: math ; half

.. _pkg.half:

half
====

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.31-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.31
  :alt: Hunter v0.12.31

-  `Official <http://half.sourceforge.net>`__
-  `Hunterized <https://github.com/headupinclouds/half/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/half/CMakeLists.txt>`__
- Available since |hunter|
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__
   (`pr-286 <https://github.com/ruslo/hunter/pull/286>`__)

.. code-block:: cmake

    hunter_add_package(half)
    find_package(half CONFIG REQUIRED)
    target_link_libraries(... half::half)
