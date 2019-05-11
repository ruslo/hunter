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
    (use :ref:`HUNTER_BUILD_SHARED_LIBS=ON <hunter build shared libs>`)
    (**not tested!**) or build with :ref:`toolchain with PIC <simple toolchains>`.

Because of the
`LLVM + Xcode <https://github.com/ruslo/hunter/pull/943#issuecomment-321534754>`__
build issue, the next workaround should be applied:

.. literalinclude:: /../examples/tvm/config.cmake
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

By default CUDA used on Linux. Example of the ``travis.yml`` configuration:

- https://github.com/ingenue/hunter/blob/81c936a1e04df8f46b84c7eb22b931da5dcf4d7c/.travis.yml#L155-L163

On Android, iOS and Windows only ``tvm::tvm_runtime`` will be built.

.. literalinclude:: /../examples/tvm/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
