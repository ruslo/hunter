.. spelling::

    libffi

.. index:: development ; libffi

.. _pkg.libffi:

libffi
======

-  `Official <https://sourceware.org/libffi>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/libffi/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(libffi)
    find_package(libffi CONFIG REQUIRED)
    target_link_libraries(... PkgConfig::libffi)
