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

.. note::

  * Package was tested only on Linux
  * Library type is forced to be ``SHARED`` hence all dependencies should be
    shared libraries
    (use :ref:`HUNTER_BUILD_SHARED_LIBS=ON <hunter build shared libs>`) or
    build with :ref:`toolchain with PIC <simple toolchains>`.

.. literalinclude:: /../examples/mxnet/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }
