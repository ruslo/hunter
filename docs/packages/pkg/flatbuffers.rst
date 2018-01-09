.. spelling::

    flatbuffers

.. index:: unsorted ; flatbuffers

.. _pkg.flatbuffers:

flatbuffers
===========

-  `Official GitHub <https://github.com/google/flatbuffers>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/flatbuffers/foo.cpp>`__

.. literalinclude:: /../examples/flatbuffers/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

Old version
-----------

When using flatbuffers version 1.3.0-p3, ``find_package`` argument must be
in lowercase ``flatbuffers``:

.. code-block:: cmake

    hunter_add_package(flatbuffers)
    find_package(flatbuffers CONFIG REQUIRED)
    target_link_libraries(... flatbuffers::flatbuffers)

-  `Hunterized <https://github.com/hunter-packages/flatbuffers>`__
