.. spelling::

    CapnProto

.. index:: messaging ; CapnProto

.. _pkg.CapnProto:

CapnProto
=========

-  `Official <https://capnproto.org/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/CapnProto/CMakeLists.txt>`__
-  Available since
   `v0.18.49 <https://github.com/ruslo/hunter/releases/tag/v0.18.49>`__

.. code-block:: cmake

    hunter_add_package(CapnProto)

    find_package(CapnProto CONFIG REQUIRED)
    target_link_libraries(... CapnProto::capnp)
