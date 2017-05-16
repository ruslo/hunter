.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. spelling::

  config

hunter_config
-------------

* `Source <https://github.com/ruslo/hunter/blob/master/cmake/modules/hunter_config.cmake>`__
* `Example <https://github.com/ruslo/hunter/blob/master/cmake/configs/default.cmake>`__
* `Usage example <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`__

This command will choose which version of package to build exactly:

.. code-block:: cmake

  hunter_config(
      <PackageName>
      VERSION 1.2.8-hunter # Version from "project/<ProjectName>/hunter.cmake"
      CMAKE_ARGS OPTION1=OFF OPTION2=ON # Arguments that will be forwarded to CMake build command (optional)
  )

``OPTION1=OFF`` and ``OPTION2=ON`` will be used to build your third-party
package. This is similar to `ExternalProject_Add`_ command sub-option
``CMAKE_ARGS``. In the case above Hunter-engine will build this package
something like this:

.. code-block:: none

  > cmake -H. -B_builds -DOPTION1=OFF -DOPTION2=ON
  > cmake --build _builds --target install

Instead of using ``VERSION`` you can create source archive by packing
:doc:`Git submodule </user-guides/hunter-user/git-submodule>`:

.. code-block:: cmake

  hunter_config(<PackageName> GIT_SUBMODULE "3rdparty/<PackageName>")

.. _ExternalProject_Add: http://www.cmake.org/cmake/help/v3.0/module/ExternalProject.html
