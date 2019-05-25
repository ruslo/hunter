.. spelling::

    ZLIB

.. index:: compression ; ZLIB

.. _pkg.ZLIB:

ZLIB
====

-  `Official <https://github.com/madler/zlib>`__
-  `Hunterized <https://github.com/hunter-packages/zlib/tree/hunter>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/ZLIB/CMakeLists.txt>`__

.. literalinclude:: /../examples/ZLIB/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

For compatibility with
`FindZLIB <https://cmake.org/cmake/help/latest/module/FindZLIB.html>`__
module, the ``ALIAS`` target ``ZLIB::ZLIB`` can be used too:

.. literalinclude:: /../examples/ZLIB/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START_1 {
  :end-before: # DOCUMENTATION_END_1 }
