Hunter: organize freedom
========================

.. warning::

  Documentation is in process of migrating from
  `GitHub wiki <https://github.com/ruslo/hunter/wiki>`_.
  Some information may be missing: blank pages, broken links, etc.
  Will be fixed soon...

Welcome to the Hunter package manager documentation!

Hunter is CMake-driven cross-platform package manager for C++ [1]_ projects.
With the help of Hunter you can organize builds for **Linux**, **OS X**, **Windows**,
**iOS**, **Android**, **Raspberry Pi**. Third party external projects are highly
customizable (versions, CMake ``-D`` build options, Release/Debug,
static/shared). Variants can be picked from global defaults or controlled by
your local CMake code. Separate root directory will be created for each variant
so all variants can be used simultaneously on one machine without conflicts
(just like `virtualenv`_ but automatically). Going further: each such root
directory can be shared between several local projects if configuration of
externals matches. So when you are starting project from scratch and use same
external packages there will be no additional copying or builds triggered, the
only overhead is checking existence of one ``DONE`` stamp file for each
package. In case your local environment is similar enough to continious
integration environment of Travis/AppVeyor then build will not be triggered at
all - cached binaries will be downloaded instead. Mainly Hunter designed to
manage packages with CMake build system under the hood - existing CMake package
can be quite easily integrated into system but non-CMake packages supported too
using custom templates (build schemes) with ``ExternalProject_Add`` command(s).
Client is a collection of CMake only modules so it supports from the box all
platforms/generators/IDEs which CMake can handle like Visual Studio, Xcode,
QtCreator, NMake, Ninja, Cygwin or MinGW.  Works fine with CMake-GUI too.

Prime directive used to add package to the current root is
``hunter_add_package`` which companioning CMake's ``find_package``. For
example:

.. code-block:: cmake

  hunter_add_package(Boost COMPONENTS system filesystem iostreams)
  find_package(Boost COMPONENTS system filesystem iostreams)

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
