.. spelling::

    ZeroMQ

.. index:: messaging ; ZeroMQ

.. _pkg.ZeroMQ:

ZeroMQ
======

-  `Official <https://github.com/zeromq/zeromq4-1>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/ZeroMQ/CMakeLists.txt>`__
-  Available since
   `v0.12.52 <https://github.com/ruslo/hunter/releases/tag/v0.12.52>`__
-  Added by `Antal Tátrai <https://github.com/tatraian>`__
   (`pr-334 <https://github.com/ruslo/hunter/pull/334>`__)
-  `Testing
   branch <https://github.com/ingenue/hunter/branches/all?utf8=%E2%9C%93&query=zeromq>`__

.. code-block:: cmake

    hunter_add_package(ZeroMQ)

    find_package(ZeroMQ CONFIG REQUIRED)

    # or ZeroMQ::libzmq-static
    target_link_libraries(... ZeroMQ::libzmq) 

Bugs
----

-  Tests doesn't work properly on Windows and OSX
