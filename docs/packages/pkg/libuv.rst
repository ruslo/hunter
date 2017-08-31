.. spelling::

    libuv

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
