.. spelling::

  abi
  rst


error.abi.detection.failure
===========================

What happens
------------

- CMake fatal error with message ``[hunter ** FATAL ERROR **] ABI not detected for C compiler``

Explanation
-----------

CMake failed to detect compiler ABI info::

    -- Detecting CXX compiler ABI info
    -- Detecting CXX compiler ABI info - failed

This indicates some compiler problems and may lead to incorrect builds, see `issue #121 <https://github.com/ruslo/hunter/issues/121>`_. Also such error occurs when your compiler is `forced <http://www.cmake.org/cmake/help/v3.2/module/CMakeForceCompiler.html>`_.

What to do
----------

- If you enabled a language for your project, like declaring a C++ project with |project(proj CXX)|_, try removing the *CXX*. See `issue #579 <https://github.com/ruslo/hunter/issues/579#issuecomment-372839469>`_.
- Else there may be other problems with your toolchain

.. |project(proj CXX)| replace:: ``project(proj CXX)``
.. _project(proj CXX): https://cmake.org/cmake/help/latest/command/project.html
