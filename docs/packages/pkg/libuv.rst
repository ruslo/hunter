.. spelling::

    libuv
    uv
    ssize

.. index:: media ; libuv

.. _pkg.libuv:

libuv
=====

-  `Official <http://libuv.org/>`__
-  `Testing branch <https://github.com/ingenue/hunter/tree/pkg.libuv>`__
-  `Example
   CMakeLists.txt <https://github.com/ruslo/hunter/blob/master/examples/libuv/CMakeLists.txt>`__
-  `Example C
   file <https://github.com/ruslo/hunter/blob/master/examples/libuv/example.c>`__

.. code-block:: cmake

    hunter_add_package(libuv)
    find_package(libuv CONFIG REQUIRED)
    target_link_libraries(... libuv::uv)

uv_ssize_t
~~~~~~~~~~

Since libuv 1.14.0-p1 type ``uv_ssize_t`` should be used in API instead of
``ssize_t``. This is not a part of official ``1.x`` API but will be the part of
next official release. See for details:

* https://github.com/libuv/libuv/pull/1519
