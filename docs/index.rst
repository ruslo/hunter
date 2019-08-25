.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Hunter: organize freedom
========================

Welcome to the Hunter package manager documentation!

Hunter is a CMake driven cross-platform package manager for C/C++ [1]_ projects.
With the help of Hunter you can organize builds for **Linux**, **Windows**,
**macOS**, **iOS**, **Android**, **Raspberry Pi** and other platforms.
Third-party external projects are highly customizable, effectively allowing you
to have myriad variants of directories with them based on combinations of
version to build, static/shared, CMake ``-D`` options, Release/Debug, etc.

Separate root directories will be created for each variant, so they all
can be used simultaneously on one machine without conflicts
(just like `virtualenv`_ but automatically).
Going further: each such root directory can be shared between several
local projects if configuration of externals matches.
So when you are starting another project from scratch and use the same external
packages, there will be no additional copy or build triggered; the only
overhead is checking the existence of a ``DONE`` stamp file for each package.
In case your local environment is similar enough to the continuous integration
environment of Travis/AppVeyor service, then build will not be triggered at all
- cached binaries will be downloaded from GitHub server instead.

Mainly Hunter is designed to manage packages with CMake build system under the
hood and existing CMake packages can be quite easily integrated into system,
but non-CMake packages are also supported too using custom templates
(build schemes) with ``ExternalProject_Add`` command(s).

The Hunter client is a collection of CMake-only modules
(i.e. it's **not a binary** like ``apt-get`` or script like ``brew``)
so it supports out-of-the-box all platforms/generators/IDEs which CMake can
handle, like Visual Studio, Xcode, :doc:`Android Studio </faq/android-studio>`,
QtCreator, NMake, Ninja, Cygwin or MinGW.  It works fine with CMake-GUI too.

The prime directive used for adding package to the current root is
``hunter_add_package`` which companioning CMake's ``find_package``. For
example:

.. code-block:: cmake

  hunter_add_package(Boost COMPONENTS system filesystem iostreams)
  find_package(Boost CONFIG REQUIRED system filesystem iostreams)

Sounds interesting? Keep reading!

.. toctree::
   :maxdepth: 1

   /overview
   /quick-start
   /user-guides
   List of packages <packages>
   /creating-new
   Frequently Asked Questions <faq>
   /contributing
   /contacts
   /reference

.. [1] C++ is the main goal, works for other types as well. See :ref:`Manage anything <manage-anything>`.

.. _virtualenv: https://virtualenv.pypa.io/en/latest/
