.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

User variables
--------------

CMake
~~~~~

HUNTER_ENABLED
==============

Turn on/off Hunter package manager. If this variable is ``OFF`` ``HunterGate``
module will do nothing, ``hunter_add_package`` command will have no effects. You
can add this variable as ``option`` while experimenting to keep backward
compatibility with old package manager:

.. code-block:: cmake

  option(HUNTER_ENABLED "Enable Hunter package manager" OFF)
  HunterGate(...) # ignored
  if(WITH_FOO)
    hunter_add_package(Foo) # ignored
    find_package(Foo) # found in standard location
  endif()

* Default: ``ON``

.. _hunter root:

HUNTER_ROOT
===========

* Path to Hunter root directory. Set this variable if you don't want to install
  Hunter packages to default location
* You can set :ref:`environment variable <env hunter root>`
  with the same name to avoid specifying it for every project
* See `HunterGate <https://github.com/hunter-packages/gate#effects>`__

.. warning::

  If you manually cloned Hunter repository for development purposes the values
  of ``URL`` and ``SHA1`` of ``HunterGate`` will be ignored, see
  `notes <https://github.com/hunter-packages/gate#notes>`__ and
  `testing <https://github.com/ruslo/hunter/wiki/dev.hunter.root>`__ hints.

HUNTER_STATUS_PRINT
===================

* Print current build status
* Default: ``ON``

HUNTER_STATUS_DEBUG
===================

* Print a lot of info
* Set this variable to ``ON`` before submitting bugs
* Default: ``OFF``

HUNTER_PACKAGE_LOG_BUILD
========================

* Apply ``LOG_BUILD 1``
  (see `ExternalProject <https://cmake.org/cmake/help/v3.3/module/ExternalProject.html>`__)

HUNTER_PACKAGE_LOG_INSTALL
==========================

* Apply ``LOG_INSTALL 1``
  (see `ExternalProject <https://cmake.org/cmake/help/v3.3/module/ExternalProject.html>`__)

HUNTER_CONFIGURATION_TYPES
==========================

* Build type of the 3rd party packages
* See `example <https://github.com/ruslo/hunter/wiki/example.hunter_configuration_types>`__
* Default: ``Release``, ``Debug``

HUNTER_JOBS_NUMBER
==================

* Number of parallel builds that will be used in such native tools like ``make -jN`` or ``xcodebuild -jobs N``
* For Visual Studio flag ``/MP`` will be used
* Set variable to ``0`` to disable adding any flags: ``HUNTER_JOBS_NUMBER=0``
* Default: `NUMBER_OF_LOGICAL_CORES <http://www.cmake.org/cmake/help/v3.2/command/cmake_host_system_information.html>`__

.. _hunter run install:

HUNTER_RUN_INSTALL
==================

Set this variable to ``ON`` to run auto-install procedure if it's disabled by
:ref:`HUNTER_DISABLE_AUTOINSTALL <hunter disable install>` environment variable.

HUNTER_DISABLE_BUILDS
=====================

* Set this variable to ``YES`` to disable building packages from sources. This
  may be useful in case you want to check that package can be loaded fully from
  local/server cache
* Default: ``NO``

HUNTER_CACHE_SERVERS
====================

* Variable contains list of servers with cache binaries
* For now only GitHub supported
  (see :doc:`overview </faq/why-binaries-from-server-not-used>`)
* Variable should be modified before ``HunterGate`` command:

.. code-block:: cmake

  list(APPEND HUNTER_CACHE_SERVERS "https://github.com/ingenue/hunter-cache")
  HunterGate(URL ... SHA1 ...)

* Default: https://github.com/ingenue/hunter-cache

.. _hunter_use_cache_servers:

HUNTER_USE_CACHE_SERVERS
========================

* Policy to control downloading cache from server. Possible values:

 * **NO** - never download cache from server, use local cache or build from sources
 * **ONLY** - never build from sources, use server/local cache
 * **YES** - try to download from server, build from sources if not found

+----------------------+--------------------------+
|                      | HUNTER_USE_CACHE_SERVERS |
+                      +--------+--------+--------+
|                      | NO     | ONLY   | YES    |
+======================+========+========+========+
| Build from sources   | yes    | no     | yes    |
+----------------------+--------+--------+--------+
| Download from server | no     | yes    | yes    |
+----------------------+--------+--------+--------+

* Default is empty string. Effectively equivalent to **YES**.

.. _hunter passwords path:

HUNTER_PASSWORDS_PATH
=====================

Path to file with passwords for packages with
:doc:`protected sources </user-guides/cmake-user/protected-sources>`.

HUNTER_KEEP_PACKAGE_SOURCES
===========================

If this variable is set to ``YES`` then Hunter will keep package sources
after finishing installation. It may be useful for navigation in code while
using debug version of libraries.

This is a workaround for
`issue #359 <https://github.com/ruslo/hunter/issues/359>`__
and have some usage peculiarities:

* It doesn't work well with Hunter cache mechanism. If package binaries will
  be found on server, then there will be no build stage triggered, hence there
  will be no sources kept. Use
  :ref:`HUNTER_USE_CACHE_SERVERS=NO <hunter_use_cache_servers>`
  for always building packages on local machine from sources.
* Sources will be kept inside :doc:`Hunter-ID </overview/customization/hunter-id>`
  directory. Hence even if all the packages will be using another
  :doc:`Hunter-ID </overview/customization/hunter-id>`,
  the old :doc:`Hunter-ID </overview/customization/hunter-id>` directory
  should not be removed.
* Some packages use in-source build (non-CMake packages) and keep all build
  artifacts along with sources. Hunter will just keep directory and will not
  track what files was the original sources/what is temporary files
  for build. Combining with previous peculiarity it's expected that much
  more disk space will be used than usually.

Environment
~~~~~~~~~~~

.. _env hunter root:

HUNTER_ROOT
===========

* Same as CMake's :ref:`HUNTER_ROOT <hunter root>` variable.
  If both environment and CMake variables are set then CMake has a higher priority

HUNTER_BINARY_DIR
=================

* Use external directory ``HUNTER_BINARY_DIR`` for building external projects.
  This variable can be used to fix
  `"path too long" <https://github.com/ruslo/hunter/wiki/error.external.build.failed#windows>`__ error on windows

.. _hunter disable install:

HUNTER_DISABLE_AUTOINSTALL
==========================

Set this environment variable to non-empty value (e.g. ``HUNTER_DISABLE_AUTOINSTALL=ON``)
to disable automatic initialization of Hunter root directory by ``HunterGate``
module. This will give you more control in some advanced usage situations, see
`examples <https://github.com/ruslo/hunter/wiki/example.hunter.run.install>`__.
Set :ref:`HUNTER_RUN_INSTALL=ON <hunter run install>` CMake variable each time
you want to run auto-install procedure. Note that there is no need to set any
variables if Hunter root is already installed.

.. _hunter passwords path env:

HUNTER_PASSWORDS_PATH
=====================

Environment variable with functionality similar to CMake variable with
:ref:`the same name <hunter passwords path>`.
