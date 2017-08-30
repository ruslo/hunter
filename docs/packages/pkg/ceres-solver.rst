.. spelling::

    ceres-solver

.. index:: unsorted ; ceres-solver

.. _pkg.ceres-solver:

ceres-solver
============

-  `Official <http://ceres-solver.org/>`__
-  `Hunterized <https://github.com/hunter-packages/ceres-solver/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ceres-solver/CMakeLists.txt>`__
-  Available since
   `v0.18.30 <https://github.com/ruslo/hunter/releases/tag/v0.18.30>`__
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

    hunter_add_package(ceeres-solver)
    find_package(Ceres CONFIG REQUIRED)

    target_link_libraries(... PRIVATE ceres)
