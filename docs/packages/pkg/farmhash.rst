.. spelling::

    farmhash

.. index:: unsorted ; farmhash

.. _pkg.farmhash:

farmhash
========

-  `Official <https://github.com/google/farmhash>`__
-  `Hunterized <https://github.com/hunter-packages/farmhash>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/farmhash/CMakeLists.txt>`__
-  Added by `David Hirvonen <https://github.com/headupinclouds>`__ (`pr-1150 <https://github.com/ruslo/hunter/pull/1150>`__)

.. code-block:: cmake

    hunter_add_package(farmhash)
    find_package(farmhash CONFIG REQUIRED)
    target_link_libraries(farmhash farmhash::farmhash)
