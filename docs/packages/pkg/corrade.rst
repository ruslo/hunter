.. spelling::

    corrade

.. index::
  single: graphics ; corrade

.. _pkg.corrade:

corrade
===

-  `Official <https://github.com/mosra/corrade>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/corrade/CMakeLists.txt>`__
-  Developed by `Vladimír Vondruš<https://github.com/mosra>`
-  Added by `Pascal Thomet <https://github.com/pthom>`__ (`pr-N <https://github.com/ruslo/hunter/pull/N>`__)

usage
-----

.. code-block:: cmake

    hunter_add_package(corrade)
    find_package(corrade CONFIG REQUIRED TestSuite Utility PluginManager Containers)
    target_link_libraries(...
      Corrade::Containers Corrade::Interconnect Corrade::PluginManager
      Corrade::TestSuite Corrade::Utility
      )

About
-----

corrade is a C++11/C++14 multiplatform utility library, which is needed by `magnum<https://github.com/mosra/magnum>`.

magnum is a lightweight and modular C++11/C++14 graphics middleware for games and data visualization


Known issues
------------

Cross compilation to iOS and Androïd might fail since the build require to find `corrade-rc` (native executable)
in your path.

In order to build an iOS or Androïd package, first compile `corrade-rc` natively, and add it to your path.
