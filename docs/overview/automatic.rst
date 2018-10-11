.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. spelling::

  txt

Automatic builds
----------------

No dependencies in README
=========================

Build instructions from the Hunter archive are triggered automatically when
the ``hunter_add_package`` function called, hence there is no need to specify
dependencies in a raw ``README`` file like:

.. code-block:: none
  :emphasize-lines: 2, 5

  For OSX please do:
  > brew install foo boo

  For Ubuntu please do:
  > sudo apt-get install foo boo

  Then run build:
  > cmake -H. -B_builds
  > cmake --build _builds

Now it's simply:

.. code-block:: none
  :emphasize-lines: 2

  Just run build:
  > cmake -H. -B_builds # dependencies installed automatically
  > cmake --build _builds

Optional dependencies
=====================

Optional dependency? No problem, optional dependencies are expressed in a straightforward way:

.. code-block:: cmake
  :emphasize-lines: 4

  # required dependencies
  hunter_add_package(foo)
  hunter_add_package(boo)
  if(BUILD_WITH_BAR)
    hunter_add_package(bar)
  endif()

Now instead of:

.. code-block:: none
  :emphasize-lines: 2, 3, 6

  Additionally if you want bar support please run:
  > brew install bar # OSX
  > sudo apt-get install bar # Ubuntu

  Then run build:
  > cmake -H. -B_builds -DBUILD_WITH_BAR=YES

It's simply:

::

  > cmake -H. -B_builds -DBUILD_WITH_BAR=YES # + install bar

Compared to a 'requirements.txt' style approach
===============================================

Note that Hunter's approach differs from a
`requirements.txt-like approach <https://pip.readthedocs.org/en/1.1/requirements.html>`__
(i.e. when external packages are specified in a separate file). This allows Hunter to avoid
duplication of logic in many cases, even if the ``requirements.txt`` style approach also automatically downloads
dependencies too.

Imagine that we have to specify dependencies in some kind of ``requirements.cmake``
file and there is a user option ``BUILD_WITH_BAR``:

.. code-block:: cmake
  :emphasize-lines: 3

  # requirements.cmake

  if(WIN32 AND BUILD_WITH_BAR)
    command_to_install(Bar)
  endif()

Or, in the case that it isn't CMake code, this might by something fancy like ``requirements.json``:

.. code-block:: json

  {
    "dependencies":
    {
      "package": "Bar",
      "platform": "windows",
      "cmake option": "BUILD_WITH_BAR"
    }
  }

You would have to repeat the same condition in the ``CMakeLists.txt`` file:

.. code-block:: cmake
  :emphasize-lines: 3

  # requirements.cmake

  if(WIN32 AND BUILD_WITH_BAR)
    command_to_install(Bar)
  endif()

.. code-block:: cmake
  :emphasize-lines: 3

  # CMakeLists.txt

  if(WIN32 AND BUILD_WITH_BAR)
    find_package(Bar CONFIG REQUIRED)
    target_compile_definitions(... PUBLIC "WITH_BAR")
  endif()

Later, when you need to change this dependency in ``CMakeLists.txt``, you'd better not forget to also modify ``requirements.cmake``
accordingly. Remember real world libraries can have nontrivial chain of conditions, e.g.
`OpenCV components <https://github.com/Itseez/opencv/blob/ec63343f34658d9b0ec94dc15e1b71e8f7d1d553/CMakeLists.txt#L170>`__.

.. admonition:: Stackoverflow

  * `Pip: optional dependencies <http://stackoverflow.com/questions/3664478>`__
