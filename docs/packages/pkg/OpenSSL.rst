.. spelling::

    OpenSSL

.. index:: crypto ; OpenSSL

.. _pkg.OpenSSL:

OpenSSL
=======

-  `Official <http://www.openssl.org/>`__
-  `Dev branch <https://github.com/ruslo/hunter/tree/openssl>`__
-  `Versions <https://github.com/ruslo/hunter/blob/master/cmake/projects/OpenSSL/hunter.cmake>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/OpenSSL/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(OpenSSL)
    find_package(OpenSSL REQUIRED)

    target_link_libraries(foo OpenSSL::SSL OpenSSL::Crypto)

For backward compatibility:

.. code-block:: cmake

    hunter_add_package(OpenSSL)
    find_package(OpenSSL REQUIRED)

    include_directories("${OPENSSL_INCLUDE_DIR}")
    target_link_libraries(... ${OPENSSL_LIBRARIES})

Bugs
----

-  https://github.com/ruslo/hunter/issues/28
-  https://github.com/ruslo/hunter/issues/29
-  https://github.com/ruslo/hunter/issues/30

Fixed/workaround
----------------

-  `space in path <https://github.com/openssl/openssl/pull/185>`__,
   `related <https://github.com/ruslo/hunter/wiki/error.spaces.in.hunter.root>`__
-  Can't be build with ``make -jN``:
   https://github.com/ruslo/hunter/issues/87
