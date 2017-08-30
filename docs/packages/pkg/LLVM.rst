.. spelling::

    LLVM

.. index:: compiler ; LLVM

.. _pkg.LLVM:

LLVM
====

LLVM (Clang)

-  `Official <http://llvm.org/releases/download.html>`__

.. code-block:: cmake

    hunter_add_package(LLVM)
    message("Clang++: ${LLVM_ROOT}/bin/clang++")

Build issues
------------

-  Can't build with ``-stdlib=libstdc++ -std=c++11`` (Ubuntu Linux)
-  Can't build with ``-std=c++11`` (MinGW)

Usage issues
------------

-  Exceptions are not available, need to build with
   `_HAS_EXCEPTION=0 <http://stackoverflow.com/a/24750725/2288008>`__
   (Visual Studio)
-  Call to ``std::endl`` lead to crash (MinGW)
