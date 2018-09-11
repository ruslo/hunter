.. spelling::

    ctti

.. index:: compiler ; ctti

.. _pkg.ctti:

ctti
====

-  `Official <https://github.com/Manu343726/ctti>`__
-  `Hunterized <https://github.com/hunter-packages/ctti>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ctti/CMakeLists.txt>`__
-  Added by `Casey <https://github.com/caseymcc>`__ (`pr-1518 <https://github.com/ruslo/hunter/pull/1518>`__)

Compile Time Type Information for the C++ programming language.

- Compilers: VS15, Clang >= 3.6.2
- Does not support GCC with optimizations (https://github.com/Manu343726/ctti/issues/19)
- Does not support VS17, bug in compiler

.. literalinclude:: /../examples/ctti/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END } 
