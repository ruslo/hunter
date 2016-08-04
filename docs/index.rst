Hunter: organize freedom
========================

.. warning::

  Documentation is in process of migrating from
  `GitHub wiki <https://github.com/ruslo/hunter/wiki>`_.
  Some information may be missing: blank pages, broken links, etc.
  Will be fixed soon...

Welcome to the Hunter package manager documentation!

Hunter is CMake-driven cross-platform package manager for C++ [1]_ projects.
With the help of Hunter you can organize builds for **Linux**, **OS X**,
**Windows**, **iOS**, **Android**, **Raspberry Pi**. Third party external
projects are highly customizable effectively allowing you to have myriad
variants of directories with them based on combinations of version to build,
static/shared, CMake ``-D`` options, Release/Debug etc.  Separate root
directory will be created for each variant so they all can be used
simultaneously on one machine without conflicts (just like `virtualenv`_ but
automatically).  Going further: each such root directory can be shared between
several local projects if configuration of externals matches. So when you are
starting project from scratch and use same external packages there will be no
additional copy or build triggered, the only overhead is checking existence of
one ``DONE`` stamp file for each package. In case your local environment is
similar enough to continuous integration environment of Travis/AppVeyor
services then build will not be triggered at all - cached binaries will be
downloaded from GitHub server instead. Mainly Hunter designed to manage
packages with CMake build system under the hood and existing CMake package can
be quite easily integrated into system but non-CMake packages supported too
using custom templates (build schemes) with ``ExternalProject_Add`` command(s).
Client is a collection of CMake only modules (i.e. it's **not a binary** like
``apt-get`` or script like ``brew``) so it supports from the box all
platforms/generators/IDEs which CMake can handle like Visual Studio, Xcode,
QtCreator, NMake, Ninja, Cygwin or MinGW.  Works fine with CMake-GUI too.

Prime directive used for adding package to the current root is
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
   /donations
   /reference

.. [1] C++ is the main goal, works for other types as well. See :ref:`Manage anything <manage-anything>`.

.. _virtualenv: https://virtualenv.pypa.io/en/latest/
