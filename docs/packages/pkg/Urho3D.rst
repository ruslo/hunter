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

* Option ``URHO3D_LUA`` is ``OFF`` by default because it will turn
  dependency on :ref:`pkg.toluapp` which is not working with default
  :ref:`pkg.Lua` version. If you need Lua part you have to explicitly switch
  to Lua ``5.1.*``:

  .. literalinclude:: /../examples/Urho3D-Lua/config.cmake
    :language: cmake
    :start-after: # DOCUMENTATION_START {
    :end-before: # DOCUMENTATION_END }
