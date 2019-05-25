.. spelling::

    freetype

.. index:: graphics ; freetype

.. _pkg.freetype:

freetype
========

-  `Official <http://www.freetype.org/download.html>`__
-  `Hunterized <https://github.com/hunter-packages/freetype>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/freetype/CMakeLists.txt>`__
-  Added by `Denis A. Kerzhemanov <https://github.com/Dinno>`__
   (`pr-284 <https://github.com/ruslo/hunter/pull/284>`__)

.. literalinclude:: /../examples/freetype/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

For compatibility with
`FindFreetype <https://cmake.org/cmake/help/latest/module/FindFreetype.html>`__
module, the ``ALIAS`` target ``Freetype::Freetype`` can be used too:

.. literalinclude:: /../examples/freetype/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START_1 {
  :end-before: # DOCUMENTATION_END_1 }
