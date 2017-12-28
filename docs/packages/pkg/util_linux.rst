.. spelling::

    util
    linux

.. index:: system ; util_linux

.. _pkg.util_linux:

util_linux
==========

-  `Official <https://www.kernel.org/pub/linux/utils/util-linux/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/util_linux/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(util_linux)

    find_package(blkid CONFIG REQUIRED)
    find_package(fdisk CONFIG REQUIRED)
    find_package(mount CONFIG REQUIRED)
    find_package(smartcols CONFIG REQUIRED)
    find_package(uuid CONFIG REQUIRED)

    target_link_libraries(
        ...
        PkgConfig::blkid
        PkgConfig::fdisk
        PkgConfig::mount
        PkgConfig::smartcols
        PkgConfig::uuid
    )
