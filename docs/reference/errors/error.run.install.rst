error.run.install
=================

What happens
------------

- CMake fatal error with message::

    [hunter ** FATAL ERROR **] Hunter not found in '...'
    [hunter ** FATAL ERROR **] Set HUNTER_RUN_INSTALL=ON to auto-install it from '...'

Explanation
-----------

- To avoid unintended buildings installation must be triggered only by user.

What to do
----------

- Check that Hunter root directory and archive version in error message is correct and set |HUNTER_RUN_INSTALL=ON|_
- Also if you're sure about the project you can set default value by ``option`` command:

  .. code-block:: cmake

     option(HUNTER_RUN_INSTALL "Run Hunter autoinstall" ON)
     HunterGate(
         URL "..."
         SHA1 "..."
     )


.. |HUNTER_RUN_INSTALL=ON| replace:: ``HUNTER_RUN_INSTALL=ON``
.. _HUNTER_RUN_INSTALL=ON: https://github.com/ruslo/hunter/wiki/CMake-Variables-%28User%29#hunter_run_install
