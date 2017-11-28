.. spelling::

    CapnProto

.. index:: messaging ; CapnProto

.. _pkg.CapnProto:

CapnProto
=========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.18.49-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.18.49
  :alt: Hunter v0.18.49

-  `Official <https://capnproto.org/>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/CapnProto/CMakeLists.txt>`__
- Available since |hunter|

.. code-block:: cmake

    hunter_add_package(CapnProto)

    find_package(CapnProto CONFIG REQUIRED)
    target_link_libraries(... CapnProto::capnp)
