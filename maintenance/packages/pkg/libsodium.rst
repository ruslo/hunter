.. spelling::

    libsodium

.. _pkg.libsodium:

libsodium
=========

libsodium
=========

-  `Official Repository <https://github.com/jedisct1/libsodium>`__

Example
-------

.. code-block:: cmake

    hunter_add_package(libsodium)
    find_package(libsodium CONFIG REQUIRED)
    ...
    target_link_libraries(... libsodium::libsodium)
