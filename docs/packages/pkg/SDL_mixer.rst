.. spelling::

    SDL_mixer

.. index:: media ; SDL_mixer

.. _pkg.SDL_mixer:

SDL_mixer
=========

-  `Official <https://www.libsdl.org/projects/SDL_mixer/>`__
-  `Hunterized <https://github.com/hunter-packages/SDL_mixer>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/SDL_mixer/CMakeLists.txt>`__
-  Available since `v0.19.56 <https://github.com/ruslo/hunter/releases/tag/v0.19.56>`__
-  Added by `wheybags <https://github.com/wheybags>`__ (`pr-924 <https://github.com/ruslo/hunter/pull/924>`__)

.. code-block:: cmake

    hunter_add_package(SDL_mixer)
    find_package(SDL_mixer CONFIG REQUIRED)
    #...
    target_link_libraries(foo SDL_mixer::SDL_mixer)
