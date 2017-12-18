.. spelling::

    Protobuf

.. index:: unsorted ; Protobuf

.. _pkg.Protobuf:

Protobuf
========

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.12.54-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.12.54
  :alt: Hunter v0.12.54

-  `Official <https://github.com/google/protobuf>`__
-  `Hunterized <https://github.com/hunter-packages/protobuf>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Protobuf/CMakeLists.txt>`__
-  Available since |hunter|
-  Added by `Antal Tátrai <https://github.com/tatraian>`__
   (`pr-340 <https://github.com/ruslo/hunter/pull/340>`__)

.. code-block:: cmake

    hunter_add_package(Protobuf)
    find_package(Protobuf CONFIG REQUIRED)
    target_link_libraries(... protobuf::libprotobuf)

Mixing toolchains
-----------------

Example of mixing host and target toolchains in **one** CMake step (e.g.
build ``protoc`` executable for OSX host and use it to build
``libprotobuf`` for Android target):

* https://github.com/forexample/protobuf-toolchains-mix
