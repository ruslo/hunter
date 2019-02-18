.. spelling::

    OpenSSL

.. index:: crypto ; OpenSSL

.. _pkg.OpenSSL:

OpenSSL
=======

-  `Official <http://www.openssl.org/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/OpenSSL/CMakeLists.txt>`__

.. code-block:: cmake

    hunter_add_package(OpenSSL)
    find_package(OpenSSL REQUIRED)
    target_link_libraries(foo PUBLIC OpenSSL::SSL OpenSSL::Crypto)

Fixed/workaround
----------------

-  `space in path <https://github.com/openssl/openssl/pull/185>`__,
   `related <https://docs.hunter.sh/en/latest/reference/errors/error.spaces.in.hunter.root.html>`__
-  Can't be build with ``make -jN``:
   https://github.com/ruslo/hunter/issues/87

Using ASM optimization on Windows
---------------------------------

To be able to use ASM optimization on Windows,
you need to set the ``ASM_SUPPORT=ON`` option.
