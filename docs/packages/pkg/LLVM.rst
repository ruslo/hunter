.. spelling::

    LLVM

.. index:: compiler ; LLVM

.. _pkg.LLVM:

LLVM
====

-  `Official <http://llvm.org/releases/download.html>`__
-  `Hunterized <https://github.com/hunter-packages/LLVM>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/LLVM/CMakeLists.txt>`__

.. literalinclude:: /../examples/LLVM/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

.. seealso::

  * http://llvm.org/docs/CMake.html#embedding-llvm-in-your-project

Usage issues
------------

-  Exceptions are not available, need to build with
   `_HAS_EXCEPTION=0 <http://stackoverflow.com/a/24750725/2288008>`__
   (Visual Studio)
