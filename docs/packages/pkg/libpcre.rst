.. spelling::

    libpcre

.. index:: regex ; libpcre

.. _pkg.libpcre:

libpcre
=======

-  `Official <http://www.pcre.org>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/libpcre/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(libpcre)
    find_package(libpcre CONFIG REQUIRED)
    target_link_libraries(... PkgConfig::libpcre)
