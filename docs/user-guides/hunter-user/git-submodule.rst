.. Copyright (c) 2017, Ruslan Baratov
.. All rights reserved.

.. spelling::

  Submodule
  subdirectory
  submodule

Use version from Git submodule
------------------------------

Hunter allows creation of archive with sources on the fly by getting it from
Git submodule.

Example:

.. code-block:: none

  > git clone https://github.com/hunter-test-cases/git-submodule-integration
  > cd git-submodule-integration
  [git-submodule-integration]> git submodule update --init .

Submodule set in local config file:

.. code-block:: cmake
  :emphasize-lines: 9

  # CMakeLists.txt

  cmake_minimum_required(VERSION 3.0)

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.18.58.tar.gz"
      SHA1 "3b39effc5ee1af4ef7487eabb1b0a7a7e10a7b3e"
      LOCAL # <----- load cmake/Hunter/config.cmake
  )

.. code-block:: cmake

  # cmake/Hunter/config.cmake
  hunter_config(fruits GIT_SUBMODULE "3rdParty/fruits")

Path to submodule is the same as in ``.gitmodules`` file:

.. code-block:: none
  :emphasize-lines: 3

  [git-submodule-integration]> cat .gitmodules
  [submodule "3rdParty/fruits"]
    path = 3rdParty/fruits
    url = https://github.com/cgold-examples/fruits

On configure step Hunter will run ``git archive`` command to pack sources:

.. code-block:: none

  [git-submodule-integration]> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
  ...
  -- [hunter *** DEBUG *** ...] Creating archive '/.../git-submodule-integration/_builds/_3rdParty/Hunter/git-archives/fruits.tar'
  ...

Let's build project and run tests:

.. code-block:: none

  [git-submodule-integration]> cmake --build _builds
  [git-submodule-integration]> (cd _builds && ctest -VV)
  ...
  1: Quick meal:
  1:   plum x 2
  1:   pear x 1
  ...

If you want to make changes to dependent project and test them you have
to **commit** patches first:

.. code-block:: none
  :emphasize-lines: 3, 6, 8

  [git-submodule-integration]> cd 3rdParty/fruits
  [fruits]> grep return lib/fruits/rosaceae/Plum.cpp
  return "plum";
  [fruits]> vim lib/fruits/rosaceae/Plum.cpp
  [fruits]> grep return lib/fruits/rosaceae/Plum.cpp
  return "plum-v2";
  [fruits]> git add lib/fruits/rosaceae/Plum.cpp
  [fruits]> git commit -m 'Update'

Go back to parent directory and run build. There is no need to run configure
again, corresponding Git files watched by CMake hence configure will start
automatically on build step:

.. code-block:: none

  [fruits]> cd ../..
  [git-submodule-integration]> cmake --build _builds

Run tests to see changes:

.. code-block:: none
  :emphasize-lines: 3

  [git-submodule-integration]> (cd _builds && ctest -VV)
  1: Quick meal:
  1:   plum-v2 x 2
  1:   pear x 1

GIT_SUBMODULE vs add_subdirectory
=================================

Note that we can achieve the same by adding sources with ``add_subdirectory``:

.. code-block:: cmake

  # top level CMakeLists.txt
  # ...

  add_subdirectory(3rdParty/fruits)

The only pros of ``add_subdirectory`` approach is that build artifacts of the
``fruits`` will live in our ``_builds`` directory.  ``GIT_SUBMODULE`` will add
new package in the same way as regular release-based packages added, meaning
that after installation all build artifacts will be removed. Every new version
start build from scratch.

Next cons of using ``add_subdirectory``:

* Dependent project ``fruits`` is not installed, hence CMake API usage may
  be different. If package has target ``fruits_rosaceae`` internally then after
  installation it can be ``fruits::fruits_rosaceae``

* For the same reason C++ API may be different, e.g. ``#include`` directives

* It's not two separate projects now - it's one big project. Hence they will
  share same cache which may lead to options conflicts, targets name conflicts,
  targets from both projects will be installed, tests from both projects will
  be run

* Correctness. Note that ``add_subdirectory`` can be used only for dependencies
  which is not used by other packages in Hunter. If current project use package
  ``zoo`` which depends on ``fruits`` we can't do ``add_subdirectory(fruits)``
  since ``hunter_add_package(zoo)`` will build and use ``fruits`` from Hunter.
  See next chapter for details

Injection
=========

``GIT_SUBMODULE`` allow you to correctly inject new version of package into
existent hierarchy of packages.

For example let's take a look at the project which use TIFF, TIFF depends on
ZLIB:

.. code-block:: none

  > git clone https://github.com/hunter-test-cases/git-submodule-integration-deps
  > cd git-submodule-integration-deps
  [git-submodule-integration-deps]> git submodule update --init .

First let's remove ``LOCAL`` config and build standard TIFF with standard ZLIB:

.. code-block:: cmake
  :emphasize-lines: 5-8

  # CMakeLists.txt
  cmake_minimum_required(VERSION 3.0)

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.18.58.tar.gz"
      SHA1 "3b39effc5ee1af4ef7487eabb1b0a7a7e10a7b3e"
  )

  project(foo)

  hunter_add_package(TIFF)
  find_package(TIFF CONFIG REQUIRED)

Config-ID is ``f743b0b``:

.. code-block:: none
  :emphasize-lines: 6, 8

  [git-submodule-integration-deps]> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
  ...
  -- Downloading...
     dst='~/.hunter/_Base/Download/ZLIB/1.2.8-p3/573dc28/v1.2.8-p3.tar.gz'
     timeout='none'
  -- Using src='https://github.com/hunter-packages/zlib/archive/v1.2.8-p3.tar.gz'
  ...
  /usr/bin/cc ... -isystem ~/.hunter/_Base/3b39eff/f743b0b/e1266bb/Install/include ... /.../tif_zip.c

Now let's add ``LOCAL`` back and run build again:

.. code-block:: cmake
  :emphasize-lines: 9

  # CMakeLists.txt

  cmake_minimum_required(VERSION 3.0)

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.18.58.tar.gz"
      SHA1 "3b39effc5ee1af4ef7487eabb1b0a7a7e10a7b3e"
      LOCAL
  )

  project(foo)

  hunter_add_package(TIFF)
  find_package(TIFF CONFIG REQUIRED)

.. code-block:: cmake
  :emphasize-lines: 2

  # cmake/Hunter/config.cmake
  hunter_config(ZLIB GIT_SUBMODULE "3rdparty/zlib")

.. code-block:: none

  [git-submodule-integration-deps]> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON

Now we are getting sources from locally created ``ZLIB.tar`` archive:

.. code-block:: none
  :emphasize-lines: 3

  ...
  -- verifying file...
       file='/.../_builds/_3rdParty/Hunter/git-archives/ZLIB.tar'
  ...

And **rebuilding** TIFF with newly installed ZLIB, Config-ID changed from
``f743b0b`` to ``817c9cb``:

.. code-block:: none

  /usr/bin/cc ... -isystem ~/.hunter/_Base/3b39eff/817c9cb/e1266bb/Install/include ... /.../tif_zip.c

To achieve the same with ``add_subdirectory`` you have to clone TIFF package too.
Then you have to be sure that TIFF supports external ZLIB targets configuration,
call ``add_subdirectory(3rdparty/zlib)`` first, then ``add_subdirectory(3rdparty/TIFF)``.
Note that if you **don't know** that TIFF depends on ZLIB and you just call
``add_subdirectory(3rdparty/zlib)`` you will end up with incorrect configuration!
