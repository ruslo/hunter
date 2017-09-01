.. spelling::

    SuiteSparse

.. index:: math ; SuiteSparse

.. _pkg.SuiteSparse:

SuiteSparse
===========

-  `Official <https://github.com/jlblancoc/suitesparse-metis-for-windows>`__
-  `Hunterized <https://github.com/hunter-packages/suitesparse-metis-for-windows>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/SuiteSparse/CMakeLists.txt>`__
-  Available since `v0.19.31 <https://github.com/ruslo/hunter/releases/tag/v0.19.31>`__
-  Added by `Neroburner <https://github.com/NeroBurner>`__ (`pr-861 <https://github.com/ruslo/hunter/pull/861>`__)
-  Dependencies:

  - :ref:`pkg.LAPACK`

.. code-block:: cmake

    hunter_add_package(SuiteSparse)
    find_package(SuiteSparse CONFIG REQUIRED)
    target_link_libraries(foo SuiteSparse::cholmod)

The following targets are available:

- ``SuiteSparse::suitesparseconfig``
- ``SuiteSparse::amd``
- ``SuiteSparse::btf``
- ``SuiteSparse::camd``
- ``SuiteSparse::ccolamd``
- ``SuiteSparse::colamd``
- ``SuiteSparse::cholmod``
- ``SuiteSparse::cxsparse``
- ``SuiteSparse::klu``
- ``SuiteSparse::ldl``
- ``SuiteSparse::umfpack``
- ``SuiteSparse::spqr``
