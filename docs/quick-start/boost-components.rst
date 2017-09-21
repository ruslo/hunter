.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

First step
----------

.. spelling::

  kung fu

Set `HUNTER_ROOT`_ environment variable to **an empty directory**. This
directory will be used by ``HunterGate`` module for storing packages and
utility files.  Using environment variable is recommended but not mandatory,
see `other options`_.

Set minimum CMake version:

.. code-block:: cmake

  cmake_minimum_required(VERSION 3.0)

Copy `HunterGate`_ module to your project and include it:

.. code-block:: cmake

  include("cmake/HunterGate.cmake")

This module will download archive automatically from ``URL`` that you provide
to the ``HUNTER_ROOT`` directory (it means that there is **no need to clone
this repository** in general, see `notes`_):

.. code-block:: cmake
  :emphasize-lines: 2, 3

  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.16.15.tar.gz"
      SHA1 "6974c2150fc0d3b09de3ad1efcbf15d360647ffa"
  )

Now project can be started:

.. code-block:: cmake

  project(Foo)

Let's download and install ``boost.{regex,system,filesystem}``:

.. code-block:: cmake

  hunter_add_package(Boost COMPONENTS regex system filesystem)

Hunter part is done, now well known CMake-style kung fu (see :ref:`pkg.Boost`):

.. code-block:: cmake

  find_package(Boost CONFIG REQUIRED regex system filesystem)

  add_executable(foo foo.cpp)
  target_link_libraries(foo PUBLIC Boost::regex Boost::system Boost::filesystem)

Summarize:

.. code-block:: cmake
  :emphasize-lines: 5-6, 11

  cmake_minimum_required(VERSION 3.0)

  include("cmake/HunterGate.cmake")
  HunterGate(
      URL "https://github.com/ruslo/hunter/archive/v0.10.9.tar.gz"
      SHA1 "53b198e364dc7bc8360fc545f798563229bd7e20"
  )

  project(Foo)

  hunter_add_package(Boost COMPONENTS regex system filesystem)
  find_package(Boost CONFIG REQUIRED regex system filesystem)

  add_executable(foo foo.cpp)
  target_link_libraries(foo PUBLIC Boost::regex Boost::system Boost::filesystem)

Build it:

.. code-block:: shell

  > cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON -DCMAKE_BUILD_TYPE=Release
  > cmake --build _builds --config Release

.. _HUNTER_ROOT: https://github.com/ruslo/hunter/wiki/usr.variables#hunter_root
.. _other options: https://github.com/hunter-packages/gate#effects
.. _HunterGate: https://github.com/hunter-packages/gate
.. _notes: https://github.com/hunter-packages/gate#notes
