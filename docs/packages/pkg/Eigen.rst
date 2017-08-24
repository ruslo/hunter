.. spelling::

   Eigen

.. _pkg.Eigen:

Eigen
=====

- `Official <https://bitbucket.org/eigen/eigen/>`__
- `Hunterized <https://github.com/hunter-packages/eigen>`__
- Maintainer: `NeroBurner <https://github.com/NeroBurner>`__

.. code-block:: cmake

    hunter_add_package(Eigen)
    find_package(Eigen REQUIRED)
    target_link_libraries(... Eigen::eigen)


For Hunter >= v0.17.15
----------------------

.. code-block:: cmake

    hunter_add_package(Eigen)
    find_package(Eigen3 CONFIG REQUIRED)
    target_link_libraries(... Eigen3::Eigen)
