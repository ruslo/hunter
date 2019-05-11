error.cache.file.not.found
==========================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] Cache not found: ...``

What to do
----------

- This is a error while caching package. Seems that one of the package dependency is not `cacheable <https://github.com/ruslo/hunter/wiki/dev.modules#hunter_cacheable>`_. Check that package is relocatable and can be cached and add ``hunter_cacheable`` to the corresponding ``hunter.cmake`` file
