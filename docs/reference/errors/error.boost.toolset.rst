.. spelling::

  toolset
  rst
  bjam


error.boost.toolset
===================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] TODO: set toolset for boost``

What to do
----------

This is unimplemented part of boost download scheme, there are several alternatives:

- (**The best one**) Convert boost-bjam to CMake and integrate it into hunter. Here is a good start: *boost-cmake* [#]_
- If you know how to build this toolset you can try to patch the ``url_sha1_boost_library.cmake.in`` scheme
- Otherwise at least *file a bug* [#]_ please

.. [#] https://github.com/boost-cmake/boost-cmake
.. [#] https://github.com/ruslo/hunter/issues/new
