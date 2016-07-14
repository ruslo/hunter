Automatic builds
----------------

No dependencies in README
=========================

Build instructions from Hunter archive triggered automatically when
``hunter_add_package`` function called. Hence there is no need to specify
dependencies in a raw ``README`` file like:

::

  For OSX please do:
  > brew install foo boo

  For Ubuntu please do:
  > sudo apt-get install foo boo

  Then run build:
  > cmake -H. -B_builds
  > cmake --build _builds

Now it's simply:

::

  Just run build:
  > cmake -H. -B_builds # dependencies installed automatically
  > cmake --build _builds

Optional dependencies
=====================

Optional dependency? No problems, expressed in a pretty clean way:

.. code-block:: cmake

  # required dependencies
  hunter_add_package(foo)
  hunter_add_package(boo)
  if(BUILD_WITH_BAR)
    hunter_add_package(bar)
  endif()

Same commands:

::

  > cmake -H. -B_builds -DBUILD_WITH_BAR=YES # + install bar

instead of:

::

  Additionally if you want bar support please run:
  > brew install bar # OSX
  > sudo apt-get install bar # Ubuntu

  Then run build:
  > cmake -H. -B_builds -DBUILD_WITH_BAR=YES

Vs. 'requirements.txt' style
============================

Note that such approach differs from
`requirements.txt-like approach <https://pip.readthedocs.org/en/1.1/requirements.html>`__
(i.e. when external packages specified by separate file). This allow to avoid
duplication of logic in many cases even if ``requirements.txt`` do downloads
automatically too.

Imagine we have to specify dependencies in ``requirements`` file and there is
user's option:

.. code-block:: cmake

  if(WIN32 AND BUILD_WITH_BAR)
    # install Bar
  endif()

In case it's not CMake code this will look even fancy:

.. code-block:: json

  {
    "dependencies":
    {
      "package": "Bar",
      "platform": "windows",
      "cmake option": "BUILD_WITH_BAR"
    }
  }

You have to repeat same condition in ``CMakeLists.txt`` file:

.. code-block:: cmake

  if(WIN32 AND BUILD_WITH_BAR)
    find_package(Bar CONFIG REQUIRED)
  endif()

In case this part change you must not to forget to modify ``requirements``
accordingly too. And real world libraries can have nontrivial chain of conditions, e.g.
`OpenCV components <https://github.com/Itseez/opencv/blob/ec63343f34658d9b0ec94dc15e1b71e8f7d1d553/CMakeLists.txt#L170>`__.

.. admonition:: Stackoverflow

  * `Pip: optional dependencies <http://stackoverflow.com/questions/3664478>`__
