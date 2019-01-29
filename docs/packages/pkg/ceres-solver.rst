.. spelling::

    ceres
    performant

.. index:: unsorted ; ceres-solver

.. _pkg.ceres-solver:

ceres-solver
============

-  `Official <http://ceres-solver.org/>`__
-  `Hunterized <https://github.com/hunter-packages/ceres-solver/tree/hunter>`__
-  Examples:

  -  `Basic <https://github.com/ruslo/hunter/blob/master/examples/ceres-solver/CMakeLists.txt>`__
  -  `with SuiteSparse <https://github.com/ruslo/hunter/blob/master/examples/ceres-solver-suitesparse/CMakeLists.txt>`__
  -  `with SuiteSparse dyn LAPACK <https://github.com/ruslo/hunter/blob/master/examples/ceres-solver-suitesparse-dynLAPACK/CMakeLists.txt>`__

-  Available since
   `v0.18.30 <https://github.com/ruslo/hunter/releases/tag/v0.18.30>`__
-  Added by `NeroBurner <https://github.com/NeroBurner>`__ (`pr-648 <https://github.com/ruslo/hunter/pull/648>`__)
-  with SuiteSparse support

  -  Available since
     `v0.19.40 <https://github.com/ruslo/hunter/releases/tag/v0.19.40>`__
  -  Added by `NeroBurner <https://github.com/NeroBurner>`__ (`pr-898 <https://github.com/ruslo/hunter/pull/898>`__)

-  Maintainer: https://github.com/NeroBurner

Ceres Solver is an open source C++ library for modeling and solving
large, complicated optimization problems. It can be used to solve
Non-linear Least Squares problems with bounds constraints and general
unconstrained optimization problems. It is a mature, feature rich, and
performant library that has been used in production at Google since
2010. For more, see `official website <http://ceres-solver.org/>`__.


Usage
-----

.. code-block:: cmake

    hunter_add_package(ceres-solver)
    find_package(Ceres CONFIG REQUIRED)

    target_link_libraries(... PRIVATE ceres)

with SuiteSparse
^^^^^^^^^^^^^^^^

To get ``ceres-solver`` with ``SuiteSparse`` and static ``LAPACK``
add a local ``cmake/Hunter/config.cmake`` file with the following contents:

.. code-block:: cmake

    hunter_config(ceres-solver
      VERSION ${HUNTER_ceres-solver_VERSION} CMAKE_ARGS
        LAPACK=ON
        SUITESPARSE=ON
        CXSPARSE=ON # since 1.14.0-p1
    )

Don't forget to add ``enable_language(Fortran)`` in your projects ``CMakeLists.txt``.

with SuiteSparse and dynamic LAPACK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To get ``ceres-solver`` with ``SuiteSparse`` and dynamic ``LAPACK``
add a local ``cmake/Hunter/config.cmake`` file with the following contents:

.. code-block:: cmake

    hunter_config(ceres-solver
      VERSION ${HUNTER_ceres-solver_VERSION} CMAKE_ARGS
        LAPACK=ON
        SUITESPARSE=ON
        CXSPARSE=ON # since 1.14.0-p1
    )
    hunter_config(LAPACK
      VERSION ${HUNTER_LAPACK_VERSION}
      CMAKE_ARGS BUILD_SHARED_LIBS=ON
    )

With a dynamic ``LAPACK`` library the ``enable_language(Fortran)`` is not needed.
But when shipping your project one must also ship the shared ``LAPACK`` library.
