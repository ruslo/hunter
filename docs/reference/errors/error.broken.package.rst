error.broken.package
====================

What happens
------------

- CMake fatal error with a message ``[hunter ** FATAL ERROR **] Broken package ...``

What to do
----------

- It seems that the package is broken for current configuration (version, toolchain, option, ...)
- Use ``HUNTER_IGNORE_BROKEN_PACKAGE_ERROR`` to ignore the message and try to build a package anyway
- If you know how to fix this build error, please submit a patch
