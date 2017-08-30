.. spelling::

    Assimp

.. index:: graphics ; Assimp

.. _pkg.Assimp:

Assimp
======

-  http://assimp.org/
-  `Official GitHub repo <https://github.com/assimp/assimp>`__
-  `Hunterized <https://github.com/hunter-packages/assimp>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/Assimp/foo.cpp>`__

.. code-block:: cmake

    hunter_add_package(Assimp)
    find_package(Assimp CONFIG REQUIRED)
    target_link_libraries(... Assimp::assimp)
