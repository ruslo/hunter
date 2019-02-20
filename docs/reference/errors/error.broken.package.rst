error.broken.package
====================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] Broken package ...``

What to do
----------

- Seems that the package is broken for current configuration (version, toolchain, option, ...)
- Set ``HUNTER_IGNORE_BROKEN_PACKAGE_ERROR`` [#]_ to ignore message and try to build package anyway
- If you know how to fix this build error please submit a patch

.. [#] https://github.com/ruslo/hunter/wiki/CMake-Variables-%28Developer%29#hunter_ignore_broken_package_error
