.. spelling::

    msgpack

.. index:: unsorted ; msgpack

.. _pkg.msgpack:

msgpack
=======

-  `Hunterized <https://github.com/msgpack/msgpack-c>`__
-  `Example <https://github.com/ruslo/hunter/blob/develop/examples/msgpack/CMakeLists.txt>`__
-  Added by `Antal Tátrai <https://github.com/tatraian>`__
   (`pr-406 <https://github.com/ruslo/hunter/pull/406>`__)
-  Available since
   `v0.14.19 <https://github.com/ruslo/hunter/releases/tag/v0.14.19>`__

.. code-block:: cmake

    hunter_add_package(msgpack)
    find_package(msgpack CONFIG REQUIRED)
    target_link_libraries(... msgpack::msgpack)
