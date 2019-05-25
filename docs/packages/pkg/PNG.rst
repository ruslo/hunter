.. spelling::

    PNG

.. index:: media ; PNG

.. _pkg.PNG:

PNG
===

-  `Official <http://libpng.sourceforge.net>`__
-  `Hunterized <https://github.com/hunter-packages/libpng>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/PNG/CMakeLists.txt>`__

.. literalinclude:: /../examples/PNG/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

For compatibility with
`FindPNG <https://cmake.org/cmake/help/latest/module/FindPNG.html>`__
module, the ``ALIAS`` target ``PNG::PNG`` can be used too:

.. literalinclude:: /../examples/PNG/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START_1 {
  :end-before: # DOCUMENTATION_END_1 }
