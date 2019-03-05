.. spelling::

  vs
  devenv

error.vs.devenv
===============

What happens
------------

- CMake fatal error:

    - *version <= v0.23.95*: with message ``[hunter ** FATAL ERROR **] Incorrect CMAKE_VS_DEVENV_COMMAND ...``
    - *version >= v0.23.96*: with message ``[hunter ** FATAL ERROR **] Incorrect MSVC setup ...``

Explanation
-----------

These paths can be used to determine tools which needed to build non-CMake projects (like Boost).
- `CMAKE_VS_DEVENV_COMMAND <https://cmake.org/cmake/help/v3.0/variable/CMAKE_VS_DEVENV_COMMAND.html>`_ contains full path to ``devenv.com`` tool when using full versions of Visual Studio.
- `CMAKE_VS_MSBUILD_COMMAND <https://cmake.org/cmake/help/v3.0/variable/CMAKE_VS_MSBUILD_COMMAND.html?highlight=cmake_vs_msbuild_command>`_ contains full path to ``MSBuild.exe`` tool.

What to do
----------

- For some reason the CMake version that came with Visual Studio doesn't define this variable (see `issue 751 <https://github.com/ruslo/hunter/issues/751>`_). As a workaround, use standard CMake version from https://cmake.org/download/
- If you are using Microsoft Build Tools, or a similar non-full Visual Studio installation, and Hunter version <= v0.23.95 then ``CMAKE_VS_DEVENV_COMMAND`` may not be available. Please try updating Hunter, which will also check ``CMAKE_VS_MSBUILD_COMMAND``.
- ``CMAKE_VS_DEVENV_COMMAND`` will be used only if there is no ``VS*COMNTOOLS`` environment added after Visual Studio installation (this "feature" introduced since Visual Studio 15 2017). You can add such variable manually, e.g. for Visual Studio 15 2017 set environment variable ``VS150COMNTOOLS`` to value ``C:\...\ide\msvc\2017\Common7\Tools``
