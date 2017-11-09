.. spelling::

    hdf

.. index:: filesystem ; hdf5

.. _pkg.hdf5:

hdf5
====

-  `Hunterized <https://github.com/hunter-packages/hdf5>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/hdf5/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(hdf5)

    find_package(ZLIB CONFIG REQUIRED)
    find_package(szip CONFIG REQUIRED)
    find_package(hdf5 CONFIG REQUIRED)

    target_link_libraries(... hdf5)
