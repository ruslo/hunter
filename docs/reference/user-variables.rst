.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

User variables
--------------

CMake
~~~~~

.. note::

  All Hunter options should be set **to cache** and
  **before HunterGate** so user will be able to set
  `his own values <http://cgold.readthedocs.io/en/latest/tutorials/variables/cache.html#use-case>`__.
  Also if package will be used as a third party project managed by Hunter, then
  Hunter should be able to forward all values from by parent to child projects.
  So **do not** set this variables with ``FORCE`` or as ``INTERNAL``, and don't
  set them as a regular variables:

  .. code-block:: cmake

    set(HUNTER_ENABLED ON) # BAD!

  .. code-block:: cmake

    set(HUNTER_STATUS_PRINT OFF CACHE BOOL "..." FORCE) # BAD!

  .. code-block:: cmake

    set(HUNTER_STATUS_DEBUG ON CACHE INTERNAL "...") # BAD!

  .. code-block:: cmake

    option(HUNTER_STATUS_DEBUG "Print a lot of info" ON) # Good

    # Good
    set(
        HUNTER_CACHE_SERVERS
        "https://github.com/elucideye/hunter-cache"
        CACHE
        STRING
        "Hunter cache servers"
    )

    # Good
    set(HUNTER_JOBS_NUMBER 6 CACHE STRING "Hunter jobs number")

    # All user options before HunterGate
    HunterGate(URL "..." SHA1 "...")

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

.. _hunter_status_debug:

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

.. _hunter configuration types:

HUNTER_CONFIGURATION_TYPES
==========================

* Build type of the 3rd party packages
* See `example <https://github.com/ruslo/hunter/wiki/example.hunter_configuration_types>`__
* Default: ``Release``, ``Debug``

.. _hunter build shared libs:

HUNTER_BUILD_SHARED_LIBS
========================

* Value for
  `BUILD_SHARED_LIBS <https://cmake.org/cmake/help/latest/variable/BUILD_SHARED_LIBS.html>`__
  for 3rd party packages

.. _hunter jobs number:

HUNTER_JOBS_NUMBER
==================

* Number of parallel builds that will be used in such native tools like ``make -jN`` or ``xcodebuild -jobs N``
* For Visual Studio >= 12 2013 flag ``/maxcpucount:N`` will be added to ``MSBuild``
* Set variable to ``0`` to disable adding any flags: ``HUNTER_JOBS_NUMBER=0``
* Defaults to maximum of two:

  * `NUMBER_OF_LOGICAL_CORES <http://www.cmake.org/cmake/help/v3.11/command/cmake_host_system_information.html>`__
  * `NUMBER_OF_PHYSICAL_CORES <http://www.cmake.org/cmake/help/v3.11/command/cmake_host_system_information.html>`__

.. _hunter run install:

HUNTER_RUN_INSTALL
==================

Set this variable to ``ON`` to run auto-install procedure if it's disabled by
:ref:`HUNTER_DISABLE_AUTOINSTALL <hunter disable install>` environment variable.

.. _hunter_run_upload:

HUNTER_RUN_UPLOAD
=================

Set this variable to ``YES`` to start
:doc:`uploading procedure </user-guides/hunter-user/github-cache-server>`.

* Default: ``NO``

.. note::

  Upload will start only after any real build triggered by Hunter.

.. _hunter_disable_builds:

HUNTER_DISABLE_BUILDS
=====================

* Set this variable to ``YES`` to disable building packages from sources. This
  may be useful in case you want to check that package can be loaded fully from
  local/server cache
* Default: ``NO``

.. _hunter_cache_servers:

HUNTER_CACHE_SERVERS
====================

* Variable contains list of servers with cache binaries
* Variable should be modified before ``HunterGate`` command:

.. code-block:: cmake

  set(
      HUNTER_CACHE_SERVERS
      "https://github.com/elucideye/hunter-cache"
      CACHE
      STRING
      "Hunter cache servers"
  )
  HunterGate(URL "..." SHA1 "...")

Using two servers:

.. code-block:: cmake

  set(
      HUNTER_CACHE_SERVERS
      "https://github.com/elucideye/hunter-cache;https://github.com/ingenue/hunter-cache"
      CACHE
      STRING
      "Hunter cache servers"
  )
  HunterGate(URL "..." SHA1 "...")

* Default: https://github.com/ingenue/hunter-cache

.. seealso::

  * :doc:`Why binaries from server not used? </faq/why-binaries-from-server-not-used>`
  * :doc:`Using Nexus Repository </user-guides/hunter-user/nexus-cache-server>`

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

Path to :doc:`Hunter passwords file <terminology/hunter-passwords-file>`.

.. _hunter keep package sources:

HUNTER_KEEP_PACKAGE_SOURCES
===========================

If this variable is set to ``YES`` then Hunter will keep package sources
after finishing installation. It may be useful for navigation in code while
using debug version of libraries.

This is a workaround for
`issue #359 <https://github.com/ruslo/hunter/issues/359>`__
and have some usage peculiarities:

* It does not work well with Hunter cache mechanism. If package binaries will
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
* If package is already installed before ``HUNTER_KEEP_PACKAGE_SOURCES`` set
  to ``ON`` there will be no build triggered, hence there will be no sources
  kept. To re-trigger the build you can add some dummy parameter to
  ``CMAKE_ARGS``, for example:

  .. code-block:: cmake

    hunter_config(foo VERSION ${HUNTER_foo_VERSION} CMAKE_ARGS DUMMY=1)

.. seealso::

  * :ref:`hunter_config(... KEEP_PACKAGE_SOURCES) <hunter_config>`

.. _hunter download server:

HUNTER_DOWNLOAD_SERVER
======================

Define a list of servers to download from.

We define the following packages for the examples:

- Package 1 name: ``foo``
- Package 1 SHA1: ``49dee30c5fedd8613a144f9bf6551fb46bb69e92``
- Package 1 URL:  ``https://foo.com/downloads/foo-1.0.tar.gz``

- Package 2 name: ``boo``
- Package 2 SHA1: ``b1ec7331baf4c9996497851bfa2c847a73cd6085``
- Package 2 URL:  ``https://server-2.com/downloads/boo-3.0.tar.gz``

If ``HUNTER_DOWNLOAD_SERVER`` is empty nothing changes and the following URLs
are used to download the sources:

- ``foo``: ``https://foo.com/downloads/foo-1.0.tar.gz``
- ``boo``: ``https://server-2.com/downloads/boo-3.0.tar.gz``

If ``HUNTER_DOWNLOAD_SERVER`` is a list of servers like
``https://server-1.com;https://server-2.com;https://server-3.com``
then the original package URL is analyzed. If the original URL matches one of the
defined servers we leave it untouched and set as a server with high priority.

For package ``foo`` the following URLs are passed to ``ExternalProject_Add``
(the original URL is not used):

- ``https://server-1.com/foo/1.0/SHASUM/foo-1.0.tar.gz``
- ``https://server-2.com/foo/1.0/SHASUM/foo-1.0.tar.gz``
- ``https://server-3.com/foo/1.0/SHASUM/foo-1.0.tar.gz``

For package ``boo`` the following URLs are passed to ``ExternalProject_Add``
(the original URL has the highest priority):

- ``https://server-2.com/downloads/boo-3.0.tar.gz`` (take priority, original URL used)
- ``https://server-1.com/boo/3.0/SHASUM/boo-3.0.tar.gz``
- ``https://server-3.com/boo/3.0/SHASUM/boo-3.0.tar.gz``

.. note::

    Multiple URLs are supported only with CMake 3.7+. For earlier versions
    the first listed URL is passed to ``ExternalProject_Add``.

The retry logic is implemented in the CMake function ``ExternalProject_Add``.

To create new URLs the following template is used:

    ``${HUNTER_DOWNLOAD_SERVER}/${PACKAGE_NAME}/${PACKAGE_VERSION}/${ARCHIVE_ID}/${filename}``

- The characters ``!@#$%^&*?`` occurring in ``${filename}`` are replaced with ``_``.
- ``${ARCHIVE_ID}`` is the first 7 characters of the package archive ``SHA1`` sum.

.. note::

    This is the same structure as Hunter uses for its own :ref:`Download <layout deployed download>` directory.

.. note::

    ``HUNTER_DOWNLOAD_SERVER`` will be applied only to packages enabled with the standard
    ``VERSION`` variant of :ref:`hunter_config` entries, which is the case for all default
    Hunter package definitions.  Custom package definitions introduced with a ``URL``/``SHA1``
    variant on :ref:`hunter_config` in a project's local configuration, such as those included through
    ``FILEPATH`` or ``LOCAL`` arguments to ``HunterGate()``, will be unaffected by this variable.
    The ``git`` variants of :ref:`hunter_config`, namely ``GIT_SUBMODULE`` and ``GIT_SELF``, have no
    transformable URL and are also unaffected by ``HUNTER_DOWNLOAD_SERVER``.

.. _hunter tls verify:

HUNTER_TLS_VERIFY
=================

Define if
`ExternalProject_Add <https://cmake.org/cmake/help/latest/module/ExternalProject.html>`__
and
`file(DOWNLOAD) <https://cmake.org/cmake/help/latest/command/file.html>`__
should verify the server certificate for ``https://`` URLs.

Default: ``ON``

.. warning::

  Value ``OFF`` will disable certificate verification. It means that the only
  protection is SHA1 hash of sources which is `weak <http://shattered.io/>`__.
  And if you're using binary servers (it's
  :ref:`default <hunter_use_cache_servers>`) meta cache files like
  ``cache.sha1`` will not be checked at all!

.. _hunter git self ignore untracked:

HUNTER_GIT_SELF_IGNORE_UNTRACKED
================================

Set this option to ``ON`` if you want to ignore untracked files while
using :doc:`GIT_SELF feature </user-guides/hunter-user/git-self>`.

Default: ``OFF``

.. _hunter no toolchain id recalculation:

HUNTER_NO_TOOLCHAIN_ID_RECALCULATION
====================================

If set to ``ON`` Hunter will skip calculation of ``Toolchain-ID`` if value is
already present in CMake cache.

Default: ``OFF``

.. note::

  Do not use this option while making a bug report.

.. warning::

  This option is for the **advanced** users only. Incorrect usage of this option
  may lead to invalid unrecoverable cache state. Please read carefully
  :ref:`this page <id calculation>` before using this option.

Environment
~~~~~~~~~~~

.. _env hunter root:

HUNTER_ROOT
===========

* Same as CMake's :ref:`HUNTER_ROOT <hunter root>` variable.
  If both environment and CMake variables are set then CMake has a higher priority

.. _env hunter binary dir:

HUNTER_BINARY_DIR
=================

* Use external directory ``HUNTER_BINARY_DIR`` for building external projects.
  This variable can be used to fix
  `"path too long" <https://docs.hunter.sh/en/latest/reference/errors/error.external.build.failed.html#windows>`__ error on windows

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

.. _hunter git executable env:

HUNTER_GIT_EXECUTABLE
=====================

Path to Git executable

.. _hunter jobs number env:

HUNTER_JOBS_NUMBER
==================

See :ref:`HUNTER_JOBS_NUMBER <hunter jobs number>` CMake variable
