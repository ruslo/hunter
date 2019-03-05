.. spelling::

    Eigen

.. index:: math ; Eigen

.. _pkg.Eigen:

Eigen
=====

-  http://eigen.tuxfamily.org
-  `Official <https://bitbucket.org/eigen/eigen/>`__
-  `Official Git mirror on GitHub <https://github.com/eigenteam/eigen-git-mirror>`__
-  `Hunterized <https://github.com/hunter-packages/eigen>`__
-  Maintainer: https://github.com/NeroBurner

.. literalinclude:: /../examples/Eigen/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

For Hunter < `v0.17.15 <https://github.com/ruslo/hunter/releases/tag/v0.17.15>`__

.. code-block:: cmake

    hunter_add_package(Eigen)
    find_package(Eigen REQUIRED)
    target_link_libraries(... Eigen::eigen)
