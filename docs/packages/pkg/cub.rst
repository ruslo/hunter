.. spelling::

    cub

.. index:: unsorted ; cub

.. _pkg.cub:

cub
===

-  `Official <https://github.com/NVlabs/cub>`__
-  `Hunterized <https://github.com/hunter-packages/cub>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/cub/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1162 <https://github.com/ruslo/hunter/pull/1162>`__)

.. code-block:: cmake

    hunter_add_package(cub)
    find_package(cub CONFIG REQUIRED)
    target_link_libraries(foo cub::cub)
