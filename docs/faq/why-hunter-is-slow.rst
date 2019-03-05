.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

.. spelling::

  tl
  dr

Why Hunter is slow?
-------------------

tl;dr It's not.

General notes
=============

If package is already installed then overhead for each ``hunter_add_package``
call is a check of one ``DONE`` stamp file,
e.g. is equal to ``if(EXISTS "/path/to/DONE")``. Penalty for such action is
hardly measurable.

If package is not installed then an archive with binaries can be
:ref:`downloaded from server <uploading binaries>`. There will be no source
download step performed for package or dependencies, and of course there will be
no configure/build/install steps.

If binaries for the package are not available on server then we have to build
package from sources. Archive with sources will be downloaded once,
configure/build/install steps will be performed once too. Results will be
:doc:`shared between several local projects </overview/shareable>`.

By default :ref:`HUNTER_STATUS_DEBUG <hunter_status_debug>` option is ``OFF``
and you may not see some Hunter activity. If you think that Hunter hangs at
some point then this option is probably need to be set to ``ON``.

Variable :ref:`HUNTER_CONFIGURATION_TYPES <hunter configuration types>` by
default set to ``Release`` + ``Debug``, meaning that build time is longer about
twice compared to a single ``Release`` build. Final size of the package usually
will be more than twice.

Use latest
==========

Prefer latest Hunter version and default package version. E.g. Windows platform
is known to have performance issues while unpacking big archives. On Windows
with default anti-virus turned on Boost 1.66.0 archive took more than 4 minutes
to unpack, if anti-virus turned off it's about 30 (!) seconds (on Linux machine
with the weaker hardware it took less than 10 seconds). Hunter by default used
1.66.0-p0 patched archive with removed examples, tests and documentation. This
reduce the size from 70.7 MB to 17.7 MB, the unpack time dropped to 8 seconds.
As usual downloading from cache is the best option, e.g.  Boost.system Release
+ Debug archive has 154 KB size:

* https://github.com/ingenue/hunter-cache/releases/download/cache-234d975/234d9755a85b09bcd2f266d2620707ccd514020e.tar.bz2

.. _id calculation:

\*-ID calculation
=================

Each CMake configure step will trigger calculation of
``Hunter-ID``/``Config-ID``/``Toolchain-ID`` triple. While ``Hunter-ID`` and
``Config-ID`` have small overhead, the calculation of ``Toolchain-ID`` for
some generators can be noticeable. To calculate ``Toolchain-ID`` Hunter will
create isolated project with one C++ file, and for example with Xcode generator
it may take much longer then with Makefile generator:

.. code-block:: none

  > rm -rf _builds

.. code-block:: cmake

  # CMakeLists.txt

  cmake_minimum_required(VERSION 3.2)
  project(foo)

.. code-block:: none
  :emphasize-lines: 1, 8

  > time cmake -H. -B_builds -GXcode
  -- The C compiler identification is AppleClang ...
  -- The CXX compiler identification is AppleClang ...
  ...
  -- Configuring done
  -- Generating done
  -- Build files have been written to: /.../_builds
  cmake -H. -B_builds -GXcode ... 18.305 total

Same test but Makefile generator:

.. code-block:: none
  :emphasize-lines: 1, 8

  > time cmake -H. -B_builds
  -- The C compiler identification is AppleClang ...
  -- The CXX compiler identification is AppleClang ...
  ...
  -- Configuring done
  -- Generating done
  -- Build files have been written to: /.../_builds
  cmake -H. -B_builds ... 2.400 total

To skip ``Toolchain-ID`` calculation each time CMake code changed user can add
:ref:`HUNTER_NO_TOOLCHAIN_ID_RECALCULATION=ON <hunter no toolchain id recalculation>`
option:

.. code-block:: none

  > rm -rf _builds

.. code-block:: cmake
  :emphasize-lines: 5-9

  # CMakeLists.txt

  cmake_minimum_required(VERSION 3.2)

  option(
      HUNTER_NO_TOOLCHAIN_ID_RECALCULATION
      "No Toolchain-ID recalculation"
      ON
  )

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.22.22.tar.gz"
      SHA1 "83f7dd182930dee784fafd29745f55e7cd06ca34"
  )
  project(foo)

  hunter_add_package(md5)

Initial ``Toolchain-ID``:

.. code-block:: none
  :emphasize-lines: 3

  > cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
  ...
  -- [hunter] Calculating Toolchain-SHA1
  ...

Reuse:

.. code-block:: none
  :emphasize-lines: 3

  > cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
  ...
  -- [hunter *** DEBUG *** ...] Toolchain-ID recalculation will be skipped
  ...

When this option is ``ON`` user is responsible for correctness of
``Toolchain-ID`` value on updates of compiler and compiler flags. E.g. you have
to set this option to ``OFF`` explicitly for every local project when you do
change ``CXX`` environment variable, upgrade compiler, update or switch Xcode
version, when you change ``CMAKE_TOOLCHAIN_FILE`` path or content of CMake
toolchain. Violation of this rule can lead to invalid unrecoverable cache state.
Because of this it's highly recommended not to use this option on machine
which can be used to build and upload binaries. Note that Hunter will upload
all archives from ``Cache`` directory, not only packages build by current
local project.

As an example here are actions that can lead to incorrect cache state:

.. code-block:: cmake

  # CMakeLists.txt

  cmake_minimum_required(VERSION 3.2)

  option(
      HUNTER_NO_TOOLCHAIN_ID_RECALCULATION
      "No Toolchain-ID recalculation"
      ON
  )

  set(
      CMAKE_TOOLCHAIN_FILE
      "${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake"
      CACHE
      FILEPATH
      "Default toolchain"
  )

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.22.22.tar.gz"
      SHA1 "83f7dd182930dee784fafd29745f55e7cd06ca34"
  )
  project(foo)

  hunter_add_package(gflags)

.. code-block:: cmake

  # toolchain.cmake

  set(CMAKE_CXX_STANDARD 11)

Run configure stage to build ``gflags``:

.. code-block:: none

  > cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
  ...
  -- [hunter] [ Hunter-ID: 83f7dd1 | Toolchain-ID: 385a6e9 | Config-ID: 2b427be ]
  ...
  /usr/bin/g++-7 ... -std=gnu++11 -c /.../gflags_completions.cc

Toolchain with C++11 standard will have ID ``385a6e9``.

Now set standard to 14:

.. code-block:: cmake

  # toolchain.cmake

  set(CMAKE_CXX_STANDARD 14)

And add "GTest" to CMakeLists.txt:

.. code-block:: cmake
  :emphasize-lines: 27

  # CMakeLists.txt

  cmake_minimum_required(VERSION 3.2)

  option(
      HUNTER_NO_TOOLCHAIN_ID_RECALCULATION
      "No Toolchain-ID recalculation"
      ON
  )

  set(
      CMAKE_TOOLCHAIN_FILE
      "${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake"
      CACHE
      FILEPATH
      "Default toolchain"
  )

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.22.22.tar.gz"
      SHA1 "83f7dd182930dee784fafd29745f55e7cd06ca34"
  )
  project(foo)

  hunter_add_package(gflags)
  hunter_add_package(GTest)

Run build:

.. code-block:: none

  > cmake --build _builds
  ...
  -- [hunter *** DEBUG *** ...] Toolchain-ID recalculation will be skipped
  ...
  -- [hunter] [ Hunter-ID: 83f7dd1 | Toolchain-ID: 385a6e9 | Config-ID: 2b427be ]
  ...
  /usr/bin/g++-7 ... -std=gnu++14 -c /.../gtest-all.cc
  ...

As you can see C++14 flag used while building new package however
``Toolchain-ID`` remains the same, archive with invalid information saved
in cache now!

The real ``Toolchain-ID`` for C++14 flag is ``b92ba0d``:

.. code-block:: none

  > cmake -H. -B_builds -DHUNTER_NO_TOOLCHAIN_ID_RECALCULATION=OFF
  ...
  -- [hunter] Calculating Toolchain-SHA1
  ...
  -- [hunter] [ Hunter-ID: 83f7dd1 | Toolchain-ID: b92ba0d | Config-ID: 2b427be ]
  ...

Option can be limited only for problematic generators, e.g. apply it to
Xcode generator only:

.. code-block:: cmake
  :emphasize-lines: 3-9

  cmake_minimum_required(VERSION 3.2)

  if(CMAKE_GENERATOR STREQUAL "Xcode")
    option(
        HUNTER_NO_TOOLCHAIN_ID_RECALCULATION
        "No Toolchain-ID recalculation"
        ON
    )
  endif()

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.22.22.tar.gz"
      SHA1 "83f7dd182930dee784fafd29745f55e7cd06ca34"
  )
  project(foo)
