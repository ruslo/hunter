.. spelling::

    stormlib

.. index:: unsorted ; stormlib

.. _pkg.stormlib:

stormlib
========

-  `Official <https://github.com/ladislav-zezula/StormLib>`__
-  `Hunterized <https://github.com/hunter-packages/StormLib>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/stormlib/CMakeLists.txt>`__
-  Available since `v0.19.83 <https://github.com/ruslo/hunter/releases/tag/v0.19.83>`__
-  Added by `wheybags <https://github.com/wheybags>`__ (`pr-877 <https://github.com/ruslo/hunter/pull/877>`__)

.. code-block:: cmake

    hunter_add_package(stormlib)
    find_package(stormlib CONFIG REQUIRED)
    #...
    target_link_libraries(foo stormlib::stormlib)
