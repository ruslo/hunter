.. spelling::

    SDL2

.. index:: graphics ; SDL2

.. _pkg.SDL2:

SDL2
====

-  `Official <https://www.libsdl.org>`__
-  `Hunterized <https://github.com/hunter-packages/SDL2>`__

-  `Example <https://github.com/ruslo/hunter/blob/master/examples/SDL2/CMakeLists.txt>`__
-  Available since `v0.14.29 <https://github.com/ruslo/hunter/releases/tag/v0.14.29>`__
-  Added by `Cyberunner23 <https://github.com/Cyberunner23>`__ (`pr-451 <https://github.com/ruslo/hunter/pull/451>`__)

.. code-block:: cmake

    hunter_add_package(SDL2)
    find_package(SDL2 CONFIG REQUIRED)
    #...
    target_link_libraries(... SDL2::SDL2)

Available targets: ``SDL2::SDL2``, ``SDL2::SDL2main``
