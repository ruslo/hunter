.. spelling::

    Eigen

.. index:: math ; Eigen

.. _pkg.Eigen:

Eigen
=====

-  `Official <https://bitbucket.org/eigen/eigen/>`__
-  `Hunterized <https://github.com/hunter-packages/eigen>`__
-  Maintainer: https://github.com/NeroBurner

.. code-block:: cmake

    hunter_add_package(Eigen)
    find_package(Eigen REQUIRED)
    target_link_libraries(... Eigen::eigen)

For Hunter >= `v0.17.15 <https://github.com/ruslo/hunter/releases/tag/v0.17.15>`__

.. code-block:: cmake

    hunter_add_package(Eigen)
    find_package(Eigen3 CONFIG REQUIRED)
    target_link_libraries(... Eigen3::Eigen)
