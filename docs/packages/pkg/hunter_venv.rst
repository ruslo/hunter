.. spelling::

    venv

.. index::
  single: python ; hunter_venv

.. _pkg.hunter_venv:

hunter_venv
===========

- https://github.com/hunter-packages/hunter_venv
- `Example <https://github.com/ruslo/hunter/blob/master/examples/hunter_venv/CMakeLists.txt>`__

This package is used to create
`an isolated Python environment <https://virtualenv.pypa.io>`__ inside Hunter and
is a workaround for missing
`Python package <https://github.com/ruslo/hunter/issues/388>`__. It is designed
to be used with `FindPython <https://cmake.org/cmake/help/latest/module/FindPython.html>`__
module. `CMake 3.13 <https://cmake.org/cmake/help/v3.13/release/3.13.html#modules>`__
is a minimum required (see details below).

.. literalinclude:: /../examples/hunter_venv/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

Python version that will be used to create environment can be set by
``HUNTER_VENV_PYTHON_VERSION`` variable:

.. code-block:: cmake

  # local config.cmake

  hunter_config(
      hunter_venv
      VERSION ${HUNTER_hunter_venv_VERSION}
      CMAKE_ARGS HUNTER_VENV_PYTHON_VERSION=3.6.7
  )

Requested Python version and ``virtualenv`` should be installed in a system.

Default values for ``HUNTER_VENV_PYTHON_VERSION`` will match testing CI
environment of Travis/AppVeyor machines:

.. literalinclude:: /../cmake/projects/hunter_venv/hunter.cmake
  :language: cmake
  :start-after: # DOCUMENTATION_START {
  :end-before: # DOCUMENTATION_END }

At this moment the procedure of making a relocatable Python environment is not
robust (see `virtualenv issue #1169 <https://github.com/pypa/virtualenv/issues/1169>`__).
Because of that ``activate`` and ``deactivate`` scripts removed from the created
environment and for other scripts shebangs set to general ``#!/usr/bin/env python``
value. It means that before running a Python script, you will have to set the
``PATH`` environment variable accordingly. As a more convenient and less
error-prone approach, you can use the ``Python_EXECUTABLE`` variable:

.. literalinclude:: /../examples/hunter_venv/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START_1 {
  :end-before: # DOCUMENTATION_END_1 }

.. literalinclude:: /../examples/hunter_venv/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START_2 {
  :end-before: # DOCUMENTATION_END_2 }

.. literalinclude:: /../examples/hunter_venv/CMakeLists.txt
  :language: cmake
  :start-after: # DOCUMENTATION_START_3 {
  :end-before: # DOCUMENTATION_END_3 }

While calling ``find_package(hunter_venv CONFIG REQUIRED)`` variables
``Python*_FIND_REGISTRY`` and ``CMAKE_FIND_FRAMEWORK`` will be set to
``NEVER``. Otherwise, ``find_package(Python REQUIRED)`` will return Python
executable from the system instead of Python from created virtual environment:

- https://cmake.org/cmake/help/v3.13/module/FindPython.html#hints
- https://cmake.org/cmake/help/v3.13/module/FindPython2.html#hints
- https://cmake.org/cmake/help/v3.13/module/FindPython3.html#hints
