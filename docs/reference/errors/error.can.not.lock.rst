error.can.not.lock
==================

.. warning::
   This page is not longer relevant since CMake 3.2 is a requirement now:
     - https://docs.hunter.sh/en/latest/quick-start/cmake.html

What happens
------------

- CMake fatal error with message::

    [hunter ** FATAL ERROR **] Can't lock, upgrade to CMake 3.2 or use HUNTER_SKIP_LOCK

Explanation
-----------

- Since Hunter can be shared between several instances of CMake builds there must be some synchronization instrument to start downloads/builds correctly. This instrument is available since CMake 3.2: |file(LOCK ...)|_

.. |file(LOCK ...)| replace:: ``file(LOCK ...)``
.. _file(LOCK ...): http://www.cmake.org/cmake/help/v3.2/command/file.html

What to do
----------

- Upgrade to `CMake 3.2 <http://www.cmake.org/cmake/help/v3.2/release/3.2.html>`_ or higher
- Set |HUNTER_SKIP_LOCK=ON|_ (this is a workaround, now you're responsible for synchronization)

.. |HUNTER_SKIP_LOCK=ON| replace:: ``HUNTER_SKIP_LOCK=ON``
.. _HUNTER_SKIP_LOCK=ON: https://github.com/ruslo/hunter/wiki/CMake-Variables-%28Developer%29#hunter_skip_lock
