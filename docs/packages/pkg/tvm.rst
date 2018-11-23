.. spelling::

    tvm

.. index::
  single: unsorted ; tvm

.. _pkg.tvm:

tvm
===

-  `Official GitHub <https://github.com/dmlc/tvm>`__
-  `Hunterized <https://github.com/hunter-packages/tvm>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/tvm/CMakeLists.txt>`__

.. note::

  * Library type is forced to be ``SHARED`` hence all dependencies should be
    shared libraries
    (use :ref:`HUNTER_BUILD_SHARED_LIBS=ON <hunter build shared libs>`) or
    build with :ref:`toolchain with PIC <simple toolchains>`.

.. literalinclude:: /../examples/tvm/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
