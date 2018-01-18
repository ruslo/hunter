.. spelling::

    Urho3D
    Urho

.. index:: graphics ; Urho3D

.. _pkg.Urho3D:

Urho3D
======

-  https://urho3d.github.io
-  `Official GitHub <https://github.com/urho3d/Urho3D>`__
-  `Hunterized <https://github.com/hunter-packages/Urho3D>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Urho3D/CMakeLists.txt>`__
-  `Stand-alone example (includes configuration for iOS and Android) <https://github.com/forexample/urho3d-with-hunter>`__

You have to explicitly switch to these versions of dependencies:

.. literalinclude:: /../examples/Urho3D/config.cmake
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

Because Urho3D is using custom version of :ref:`pkg.SDL2` which is not fully
compatible with upstream official API and :ref:`pkg.toluapp` is not working with
default :ref:`pkg.Lua` version.

.. code-block:: cmake

    hunter_add_package(Urho3D)
    find_package(Urho3D CONFIG REQUIRED)
    target_link_libraries(boo PUBLIC Urho3D::Urho3D)

Customization
~~~~~~~~~~~~~

* Option ``URHO3D_DATABASE_ODBC`` is ``OFF`` by default.
  Package ``ODBC`` is not implemented in Hunter.
  ``URHO3D_DATABASE_SQLITE=ON`` will enable database support
  using :ref:`pkg.sqlite3` (this is a default).
