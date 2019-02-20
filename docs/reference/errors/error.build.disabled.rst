error.build.disabled
====================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] Building package from source is disabled ...``

Explanation
-----------

- It means that |HUNTER_DISABLE_BUILDS|_ variable is set. When this variables is set expected that no builds will be triggered, i.e. all dependencies will be loaded from cache

.. |HUNTER_DISABLE_BUILDS| replace:: ``HUNTER_DISABLE_BUILDS``
.. _HUNTER_DISABLE_BUILDS: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_disable_builds

What to do
----------

- Package is missing in cache => set ``HUNTER_DISABLE_BUILDS=NO`` to build and save package to cache (note that package and all dependencies should be `cacheable <https://github.com/ruslo/hunter/wiki/usr.adding.new.package#important>`_)
