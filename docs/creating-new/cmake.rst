.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

CMake (no dependencies)
-----------------------

If package is CMake project without third party dependencies which installed
using ``cmake --build <dir> --target install`` then integration is pretty easy.
Here is a step-by-step tutorial for a tiny package
`example-A <https://github.com/forexample/example-A>`__.

Test it manually
================

Install/verify project using Wget, OpenSSL and CMake:

.. code-block:: bash
  :emphasize-lines: 1,3,7

  > wget https://github.com/forexample/example-A/archive/v1.0.1.tar.gz
  > openssl sha1 v1.0.1.tar.gz
  SHA1(v1.0.1.tar.gz)= 48179067d11828dc347f98fc148654f88766529d
  > tar xf v1.0.1.tar.gz
  > cd example-A-1.0.1/
  > cmake -H. -B_builds -DCMAKE_INSTALL_PREFIX=`pwd`/_install
  > cmake --build _builds/ --target install
  > ls _install/*
  _install/libexample_A.a

  _install/example_A:
  foo.hpp

Test it using ExternalProject_Add
=================================

.. code-block:: bash
  :emphasize-lines: 6-12

  > cat CMakeLists.txt
  cmake_minimum_required(VERSION 2.8)

  include(ExternalProject) # ExternalProject_Add

  ExternalProject_Add(
      Example
      URL https://github.com/forexample/example-A/archive/v1.0.1.tar.gz
      URL_HASH SHA1=48179067d11828dc347f98fc148654f88766529d
      CMAKE_ARGS
      "-DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_LIST_DIR}/_install"
  )
  > cmake -H. -B_builds
  > cmake --build _builds/
  > ls _install/*
  _install/libexample_A.a

  _install/example_A:
  foo.hpp

Add new package
===============

First, new ``hunter.cmake`` file need to be add to ``projects`` directory

.. code-block:: bash

  > git clone https://github.com/ruslo/hunter
  > export HUNTER_ROOT="`pwd`/hunter"
  > cd ${HUNTER_ROOT}
  > mkdir cmake/projects/Example

Content of ``hunter.cmake``:

.. code-block:: cmake

  # cmake/projects/Example/hunter.cmake

  # !!! DO NOT PLACE HEADER GUARDS HERE !!!

  # Load used modules
  include(hunter_add_version)
  include(hunter_download)
  include(hunter_pick_scheme)

  # List of versions here...
  hunter_add_version(
      PACKAGE_NAME
      Example
      VERSION
      "1.0.1"
      URL
      "https://github.com/forexample/example-A/archive/v1.0.1.tar.gz"
      SHA1
      48179067d11828dc347f98fc148654f88766529d
  )

  hunter_add_version(
      PACKAGE_NAME
      Example
      VERSION
      "1.0.0"
      URL
      "https://github.com/forexample/example-A/archive/v1.0.0.tar.gz"
      SHA1
      d9b25aeadde5a5b1b60ba2dd39ed1a7a4846589a
  )

  # Probably more versions for real packages...

  # Pick a download scheme
  hunter_pick_scheme(DEFAULT url_sha1_cmake) # use scheme for cmake projects

  # Download package.
  # Two versions of library will be build by default:
  #     * libexample_A.a
  #     * libexample_Ad.a
  hunter_download(PACKAGE_NAME Example)

Second, specify version in default config:

.. code-block:: bash
  :emphasize-lines: 2

  > grep Example cmake/config/default.cmake
  hunter_config(Example VERSION 1.0.1)

Note
====

Package configuration can also be performed at a project level,
e.g. customization can be performed within
``${CMAKE_CURRENT_LIST_DIR}/cmake/Hunter/config.cmake``.
See `customizing external packages <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`__
for more detailed information.

Using
=====

That's all! Now package can be used (see next section for testing):

.. code-block:: cmake
  :emphasize-lines: 9-10, 15

  # CMakeLists.txt
  cmake_minimum_required(VERSION 3.0)

  include("cmake/HunterGate.cmake")

  # If Hunter is cloned this line will not
  # be used if fact. See 'testing' section for me info
  HunterGate(
      URL "https://url/to/your/hunter-archive.tar.gz"
      SHA1 "put-archive-sha1-here"
  )

  project(TestExampleDownload)

  hunter_add_package(Example)

Library can be found by ``EXAMPLE_ROOT`` CMake variable:

.. code-block:: cmake

  find_library(
      example_release
      example_A
      ${EXAMPLE_ROOT}
  )

  find_library(
      example_debug
      example_A${CMAKE_DEBUG_POSTFIX}
      ${EXAMPLE_ROOT}
  )

  message("Release: ${example_release}")
  message("Debug: ${example_debug}")

``EXAMPLE_ROOT`` variable assembled by moving package name to upper case and
adding ``_ROOT``. For the packages containing ``-`` char the "snake case"
variant also available. E.g. for package ``foo-bar-boo`` both
``FOO-BAR-BOO_ROOT`` and ``FOO_BAR_BOO_ROOT`` can be used.

Note that for real packages there will be more code like searching for
``EXAMPLE_INCLUDE_DIR`` or setting ``EXAMPLE_COMPILE_DEFINITIONS``.

Important!
~~~~~~~~~~

Note that CMake modern-style packages can automatically produce and install
CMake configs for ``find_package`` commands. This helps to avoid manually
writing/supporting and distributing endless list of ``Find<Package>.cmake``
modules. Also, what is very important for Hunter, it's the one of the painless
ways to support relocation. I.e. only config-mode packages (native or emulated)
with imported targets can be cached and downloaded as prebuilt binary archive
from build servers. Plus only imported targets works nicely with non standard
build types like MinSizeRel or RelWithDebInfo. It is highly recommended to have
such feature. Read
`this overview <https://github.com/ruslo/hunter/wiki/example.find_package.config>`__
if you want to have code:

.. code-block:: cmake

  find_package(Example CONFIG REQUIRED)

Instead of bunch of ``find_library`` in snipped from previous paragraph.

If your package is already relocatable use command
:doc:`hunter_cacheable </reference/user-modules/hunter_cacheable>`
to allow caching.

Test
====

Let's test it (see `how to do it nicely <https://github.com/ruslo/hunter/wiki/dev.hunter.root>`__):

.. code-block:: none

  > cmake -H. -B_builds
  -- [hunter] HUNTER_ROOT: /.../Hunter
  -- [hunter] [ Hunter-ID: 7912489 | Toolchain-ID: f8714ae | Config-ID: f1ec619 ]
  ...
  -- [hunter] EXAMPLE_ROOT: /.../Hunter/_Base/7912489/f8714ae/f1ec619/Install (ver.: 1.0.1)
  -- [hunter] Building Example
  ...
  -- downloading...
  ...
       src='https://github.com/forexample/example-A/archive/v1.0.1.tar.gz'
  -- [download 100% complete]
  Install the project...
  -- Install configuration: "Release"
  ...
  -- Install configuration: "Debug"
  ...
  Release: /.../Hunter/_Base/7912489/f8714ae/f1ec619/Install/libexample_A.a
  Debug: /.../Hunter/_Base/7912489/f8714ae/f1ec619/Install/libexample_Ad.a

Extra
=====

Package defaults
~~~~~~~~~~~~~~~~

CMake options
+++++++++++++

Note that it doesn't make sense to include in build such stuff like examples,
tests or documentation. Please check that your package has CMake option to
disable it and apply extra variables to all versions  (if options is not
disabled by default) using ``hunter_cmake_args`` function:

.. code-block:: cmake
  :emphasize-lines: 3, 6-8

  # bottom of cmake/projects/Foo/hunter.cmake

  hunter_cmake_args(
      Foo
      CMAKE_ARGS
          FOO_BUILD_EXAMPLES=OFF
          FOO_BUILD_TESTS=OFF
          FOO_BUILD_DOCUMENTATION=OFF
  )

  hunter_pick_scheme(DEFAULT url_sha1_cmake)
  hunter_download(PACKAGE_NAME Foo)

Options set by ``hunter_cmake_args`` have lower precedence than options set
by ``hunter_config(... CMAKE_ARGS ...)`` (see
`order <https://github.com/ruslo/hunter/wiki/example.custom.config.id#order>`__).

Build types
+++++++++++

Default build type(s) can be set by ``hunter_configuration_types``:

.. code-block:: cmake

  hunter_configuration_types(Foo CONFIGURATION_TYPES Release)
  hunter_download(PACKAGE_NAME Foo)

User can overwrite this default by using
`custom <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`__
``hunter_config`` parameters.

Default behavior
~~~~~~~~~~~~~~~~

Please check that your package respect (i.e. doesn't rewrite) such CMake variables like:

* `CMAKE_INSTALL_PREFIX <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_INSTALL_PREFIX.html>`__ (**critical**)
* `CMAKE_{C,CXX}_FLAGS + variations <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`__ (**critical**)
* `CMAKE_{C,CXX}_COMPILER + friends <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`__ (**critical**)
* `CMAKE_BUILD_TYPE <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_BUILD_TYPE.html>`__ (not critical, but recommended)
* `CMAKE_CONFIGURATION_TYPES <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_CONFIGURATION_TYPES.html>`__ (not critical, but recommended)
* `BUILD_SHARED_LIBS <http://www.cmake.org/cmake/help/v3.2/variable/BUILD_SHARED_LIBS.html>`__ (not critical, but may result some errors)

Environment
~~~~~~~~~~~

Configuration of the package should be predictable.

For example it should not depend on the fact that some package already installed
or not:

.. code-block:: cmake
  :emphasize-lines: 2

  find_package(OpenSSL)
  if(OPENSSL_FOUND)
    target_compile_definitions(... PUBLIC FOO_WITH_OPENSSL=1)
  endif()

If package is optional then control behavior explicitly:

.. code-block:: cmake
  :emphasize-lines: 1, 5

  option(FOO_WITH_OPENSSL "Build with OpenSSL" ON)

  if(FOO_WITH_OPENSSL)
    find_package(OpenSSL REQUIRED) # fatal error if not found!
    target_compile_definitions(... PUBLIC FOO_WITH_OPENSSL=1)
  endif()

Same with the programs:

.. code-block:: cmake
  :emphasize-lines: 2

  find_program(PYTHON_EXE python) # Use 'find_package(PythonInterp)' in real code
  if(PYTHON_EXE)
    # generate some extra code
  endif()

Use this code instead:

.. code-block:: cmake
  :emphasize-lines: 1, 4, 6

  option(FOO_WITH_PYTHON "Build with Python" ON)

  if(FOO_WITH_PYTHON)
    find_program(PYTHON_EXE python)
    if(NOT PYTHON_EXE)
      message(FATAL_ERROR "Python not found")
    endif()
  endif()

Environment variable example:

.. code-block:: cmake
  :emphasize-lines: 1

  if(EXISTS "$ENV{FOO_EXTRA_CODE}")
    # add some code
  endif()

Solution:

.. code-block:: cmake
  :emphasize-lines: 1, 4

  option(FOO_WITH_EXTRA_CODE "Use extra code" ON)

  if(FOO_WITH_EXTRA_CODE)
    if(NOT EXISTS "$ENV{FOO_EXTRA_CODE}")
      message(FATAL_ERROR "...")
    endif()
  endif()

Note that this is kind of a natural limitation because otherwise Hunter have
to save the whole outside environment like default paths, environment
variables, etc. This is not doable on practice.

Exception is the variables related to compiler/toolchain like compiler version,
compiler id, platforms, generators, architectures: ``WIN32``, ``IOS``,
``ANDROID``, etc. Number of such traits is limited and forms
:doc:`toolchain-id </overview/customization/toolchain-id>`.

.. admonition:: CGold

  * `Depending on environment variable <http://cgold.readthedocs.io/en/latest/tutorials/variables/environment.html#no-tracking>`__
