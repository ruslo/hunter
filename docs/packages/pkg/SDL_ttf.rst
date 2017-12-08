.. spelling::

    SDL_ttf

.. index:: unsorted ; SDL_ttf

.. _pkg.SDL_ttf:

SDL_ttf
=======

.. |hunter| image:: https://img.shields.io/badge/hunter-v0.19.180-blue.svg
  :target: https://github.com/ruslo/hunter/releases/tag/v0.19.180
  :alt: Hunter v0.12.35

-  `Official <https://www.libsdl.org/projects/SDL_ttf/>`__
-  `Hunterized <https://github.com/hunter-packages/SDL_ttf>`__
-  `Example <https://github.com/ruslo/hunter/blob/master/examples/SDL_ttf/CMakeLists.txt>`__
-  Added by `Dennis Biber <https://github.com/db-tech>`__ (`pr-1251 <https://github.com/ruslo/hunter/pull/1251>`__)

.. code-block:: cmake

    hunter_add_package(SDL_ttf)
    find_package(SDL_ttf CONFIG REQUIRED)
    target_link_libraries(... SDL_ttf::SDL_ttf)
