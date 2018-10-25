.. spelling::

    qhull

.. index:: unsorted ; qhull

.. _pkg.qhull:

qhull
=====

-  `Official <https://github.com/qhull/qhull>`__
-  `Hunterized <https://github.com/hunter-packages/qhull>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/qhull/CMakeLists.txt>`__
-  Added by `qhull_developer <https://github.com/t0p4>`__ (`pr-1596 <https://github.com/ruslo/hunter/pull/1596>`__)

.. code-block:: cmake

    hunter_add_package(qhull)

    find_package(qhull CONFIG REQUIRED)

    target_link_libraries(... qhull::qhull)