.. spelling::

    ZeroMQ

.. index:: messaging ; ZeroMQ

.. _pkg.ZeroMQ:

ZeroMQ
======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.52-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.52
  :alt: Hunter v0.12.52

-  `Official <https://github.com/zeromq/zeromq4-1>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ZeroMQ/CMakeLists.txt>`__
- Available since |hunter|
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

-  Tests does not work properly on Windows and OSX
