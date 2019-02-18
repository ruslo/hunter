error.no.toolchain.info
=======================

What happens
------------

- CMake fatal error with message: ``[hunter ** FATAL ERROR **] No toolchain info generated``

Explanation
-----------

- Hunter use `try_compile <https://cmake.org/cmake/help/v3.0/command/try_compile.html>`_ to calculate `toolchain-id <https://github.com/ruslo/hunter#toolchain-id>`_. Internally ``*.cpp`` file with ``#pragma message(...)`` directives used to print different system macros. This error occurs when no information printed on compilation step.

What to do
----------

- Error may occurs for old version of compilers without ``#pragma message`` support. E.g. minimal version of GCC is `4.4.7 <https://gcc.gnu.org/onlinedocs/gcc-4.4.7/gcc/Diagnostic-Pragmas.html#Diagnostic-Pragmas>`_. In this case you need to update your compiler.
- This approach is not working with compiler used in `Homebrew <https://brew.sh/>`_, reason is unclear (see `this question <https://discourse.brew.sh/t/c-homebrew-compiler-suppress-pragma-messages/1893>`_). As a workaround you can force standard ``clang++`` compiler (see `toolchain <https://github.com/forexample/brew-pragma/blob/68b278d34f4893ca7ea392a6f82d5ba0a111135f/toolchain.cmake>`_ and `CMakeLists.txt <https://github.com/forexample/brew-pragma/blob/68b278d34f4893ca7ea392a6f82d5ba0a111135f/CMakeLists.txt#L3-L9>`_) or disable Hunter by |HUNTER_ENABLED=OFF|_.
- This may happens because of wrongly created/unsupported toolchain. Please open `new issue <https://github.com/ruslo/hunter/issues/new>`_ with information about toolchain you're using.

.. |HUNTER_ENABLED=OFF| replace:: ``HUNTER_ENABLED=OFF``
.. _HUNTER_ENABLED=OFF: https://docs.hunter.sh/en/latest/reference/user-variables.html#hunter-enabled
