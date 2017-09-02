.. spelling::

    LAPACK

.. index:: math ; LAPACK

.. _pkg.LAPACK:

LAPACK
======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.19.24-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.19.24
  :alt: Hunter v0.19.24

-  `Official <https://github.com/Reference-LAPACK/lapack>`__
-  `Hunterized <https://github.com/hunter-packages/lapack>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/LAPACK/CMakeLists.txt>`__
- Available since |hunter|
-  Added by `NeroBurner <https://github.com/NeroBurner>`__ (`pr-860 <https://github.com/ruslo/hunter/pull/860>`__)

.. code-block:: cmake

    hunter_add_package(LAPACK)
    find_package(LAPACK CONFIG REQUIRED)
    target_link_libraries(foo blas lapack)

