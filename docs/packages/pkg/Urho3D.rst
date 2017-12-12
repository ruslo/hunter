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
