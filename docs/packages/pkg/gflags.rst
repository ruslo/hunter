.. spelling::

    gflags

.. index:: commandline tools ; gflags

.. _pkg.gflags:

gflags
======

-  `Official <https://github.com/gflags/gflags>`__
-  `Hunterized <https://github.com/hunter-packages/gflags>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/gflags/foo.cpp>`__
-  Available since
   `v0.16.3 <https://github.com/ruslo/hunter/releases/tag/v0.16.3>`__

.. code-block:: cmake

    hunter_add_package(gflags)
    find_package(gflags CONFIG REQUIRED)
    target_link_libraries(... gflags-static)
