.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. spelling::

  config

.. _hunter_config:

hunter_config
-------------

* `Usage example <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`__

This command will choose which version of package to build exactly:

.. code-block:: cmake

  hunter_config(
      ${package}

      # Version from "project/${package}/hunter.cmake"
      VERSION 1.2.8-hunter

      # Arguments that will be forwarded to CMake build command (optional)
      CMAKE_ARGS OPTION1=OFF OPTION2=ON
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

  hunter_config(${package} GIT_SUBMODULE "3rdparty/${package}")

Or packing
:doc:`Current Git repository itself </user-guides/hunter-user/git-self>`:

.. code-block:: cmake

  hunter_config(${package} GIT_SELF)

Or specifying ``URL``/``SHA1`` of package explicitly:

.. code-block:: cmake

  hunter_config(${package} URL "..." SHA1 "...")

All variants support specifying extra:

* ``VERSION`` (e.g. ``VERSION 4.5.6``)
* ``CMAKE_ARGS`` (e.g. ``CMAKE_ARGS A=4 "B=5;6"``)
* ``CONFIGURATION_TYPES`` (e.g. ``CONFIGURATION_TYPES Release MinSizeRel``)
* ``KEEP_PACKAGE_SOURCES``

.. _ExternalProject_Add: http://www.cmake.org/cmake/help/v3.0/module/ExternalProject.html
