.. spelling::

    recastnavigation

.. index:: unsorted ; recastnavigation

.. _pkg.recastnavigation:

recastnavigation
================

-  `Official GitHub <https://github.com/recastnavigation/recastnavigation>`__
-  `Hunterized <https://github.com/hunter-packages/recastnavigation>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/recastnavigation/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(recastnavigation)
    find_package(recastnavigation CONFIG REQUIRED)
    target_link_libraries(
        boo
        PUBLIC
        recastnavigation::detour
        recastnavigation::detour_crowd
        recastnavigation::detour_tile_cache
        recastnavigation::recast
    )
