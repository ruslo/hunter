.. spelling::

    libsodium

.. index:: unsorted ; libsodium

.. _pkg.libsodium:

libsodium
=========

-  `Official Repository <https://github.com/jedisct1/libsodium>`__

.. code-block:: cmake

    hunter_add_package(libsodium)
    find_package(libsodium CONFIG REQUIRED)
    #...
    target_link_libraries(... libsodium::libsodium)
