.. spelling::

    highwayhash

.. index:: unsorted ; highwayhash

.. _pkg.highwayhash:

highwayhash
===========

-  `Official <https://github.com/google/highwayhash>`__
-  `Hunterized <https://github.com/hunter-packages/highwayhash>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/highwayhash/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1151 <https://github.com/ruslo/hunter/pull/1151>`__)

.. code-block:: cmake

    hunter_add_package(highwayhash)
    find_package(highwayhash CONFIG REQUIRED)
    target_link_libraries(highwayhash highwayhash::highwayhash)
