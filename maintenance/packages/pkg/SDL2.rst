.. spelling::

    SDL2

.. _pkg.SDL2:

    SDL2
    ====
SDL2
====

Officical website https://www.libsdl.org/

Hunterized repository: https://github.com/hunter-packages/SDL2

Example
-------

.. code:: cmake

    hunter_add_package(SDL2)
    find_package(SDL2 CONFIG REQUIRED)
    ...
    target_link_libraries(... SDL2::SDL2)

Available targets: SDL2::SDL2, SDL2::SDL2-static, SDL2::SDL2main
