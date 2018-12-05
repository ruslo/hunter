.. spelling::

    corrade

.. index::
  single: graphics ; corrade

.. _pkg.corrade:

corrade
=======

-  `Official <https://github.com/mosra/corrade>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/corrade/CMakeLists.txt>`__
-  Developed by `Vladimír Vondruš <https://github.com/mosra>`__
-  Added by `Pascal Thomet <https://github.com/pthom>`__ (`pr-1646 <https://github.com/ruslo/hunter/pull/1646>`__)

usage
-----

.. literalinclude:: /../examples/corrade/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

About
-----

corrade is a C++11/C++14 multiplatform utility library.

Known issues
------------

Cross compilation to iOS and Android might fail since the build require to find ``corrade-rc`` (native executable)
in your path. In order to build an iOS or Android package, first compile ``corrade-rc`` natively, and add it to your path.
