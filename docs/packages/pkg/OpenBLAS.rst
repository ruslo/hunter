.. spelling::

    OpenBLAS

.. index:: math ; OpenBLAS

.. _pkg.OpenBLAS:

OpenBLAS
========

-  `Official <https://github.com/xianyi/OpenBLAS>`__
-  `Hunterized <https://github.com/hunter-packages/OpenBLAS>`__
-  Available since
   `v0.16.4 <https://github.com/ruslo/hunter/releases/tag/v0.16.4>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/OpenBLAS/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(OpenBLAS)
    find_package(OpenBLAS CONFIG REQUIRED)
    target_link_libraries(... OpenBLAS::OpenBLAS)
