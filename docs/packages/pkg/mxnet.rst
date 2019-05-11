.. spelling::

    mxnet

.. index::
  single: unsorted ; mxnet

.. _pkg.mxnet:

mxnet
=====

-  https://mxnet.apache.org/
-  `Official GitHub <https://github.com/apache/incubator-mxnet>`__
-  `Hunterized <https://github.com/hunter-packages/mxnet>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/mxnet/CMakeLists.txt>`__

``mxnet`` is not compatible with OpenCV ``4.0``, you have to explicitly switch
to OpenCV ``3.4``:

.. literalinclude:: /../examples/mxnet/config.cmake
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

Please check :ref:`TVM documentation <pkg.tvm>` for additional requirements.

.. note::

  * Package was tested only on Linux and macOS
  * Library type is forced to be ``SHARED`` hence all dependencies should be
    shared libraries
    (use :ref:`HUNTER_BUILD_SHARED_LIBS=ON <hunter build shared libs>`) (**not tested!**)
    or build with :ref:`toolchain with PIC <simple toolchains>`.

.. note::

  It's highly recommended to use ``export OMP_NUM_THREADS=1`` while
  running code and compiling MXNet. Not using this variable can leads to
  random runtime errors and build freezes.

  - https://github.com/apache/incubator-mxnet/issues/10856

.. literalinclude:: /../examples/mxnet/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
