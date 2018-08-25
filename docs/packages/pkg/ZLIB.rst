.. spelling::

    ZLIB

.. index:: compression ; ZLIB

.. _pkg.ZLIB:

ZLIB
====

-  `Official <https://github.com/madler/zlib>`__
-  `Hunterized <https://github.com/hunter-packages/zlib/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ZLIB/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(ZLIB)
    find_package(ZLIB CONFIG REQUIRED)
    target_link_libraries(... ZLIB::zlib)
