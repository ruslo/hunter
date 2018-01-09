.. spelling::

    flatbuffers

.. index:: unsorted ; flatbuffers

.. _pkg.flatbuffers:

flatbuffers
===========

-  `Official GitHub <https://github.com/google/flatbuffers>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/flatbuffers/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(flatbuffers)
    find_package(Flatbuffers CONFIG REQUIRED)
    target_link_libraries(... flatbuffers::flatbuffers)

Version 1.3.0
-------------

-  `Hunterized <https://github.com/hunter-packages/flatbuffers>`__

When using flatbuffers version 1.3.0-p3, ``find_package`` argument must be in lowercase: ``flatbuffers``

.. code-block:: cmake

    hunter_add_package(flatbuffers)
    find_package(flatbuffers CONFIG REQUIRED)
    target_link_libraries(... flatbuffers::flatbuffers)
