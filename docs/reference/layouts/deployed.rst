.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Deployed
--------

Common
======

There is a common pattern for creating shareable directories (directories
that can be created by several CMake instances running simultaneously):

.. code-block:: none

  <...-ID>/
  ├── cmake.lock
  ├── SHA1
  └── DONE

* ``cmake.lock`` synchronization file, see
  `file(LOCK ...) <https://cmake.org/cmake/help/latest/command/file.html>`__
  command

* ``SHA1`` file with SHA1 value, first 7 digits of SHA1 is ``<...-ID>``

* ``DONE`` stamp that shows that directory created

For example we have file ``toolchain.info`` and we want to save it in
``${HUNTER_ROOT}`` directory in non-conflicting fashion. We can do:

* Create ``toolchain.info`` locally (out of ``${HUNTER_ROOT}`` directory,
  e.g. somewhere in ``${CMAKE_BINARY_DIR}``)

* Calculate SHA1 of ``toolchain.info``

* Calculate Toolchain-ID by getting first 7 digits of SHA1

* Check ``<Toolchain-ID>/DONE`` file exists

* If file exists check that ``<Toolchain-ID>/SHA1`` do matches our SHA1.
  Assumed that probability of collision of Toolchain-ID is very low, in case
  collision happen we should extend short Toolchain-ID to 8 digits

* If ``<Toolchain-ID>/DONE`` not exists then lock ``<Toolchain-ID>/cmake.lock``

* Save ``toolchain.info`` to ``<Toolchain-ID>/toolchain.info``

* Save SHA1 to ``<Toolchain-ID>/SHA1``

* Save empty stamp file ``<Toolchain-ID>/DONE``

* Unlock ``<Toolchain-ID>/cmake.lock``

Base
====

Layout of deployed files (layout of ``${HUNTER_ROOT}`` directory).
Layout starts with the root directory ``_Base``. The purpose of this directory
is to allow Hunter to be deployed inside
:doc:`sources </reference/layouts/sources>`, i.e. when repository is cloned
for development.

.. code-block:: none
  :emphasize-lines: 2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48,50

  _Base/
  ├── <Hunter-ID>/
  │   ├── cmake.lock
  │   ├── SHA1                                 # SHA1 of Hunter archive
  │   ├── DONE
  │   └── <Config-ID>/
  │       ├── cmake.lock
  │       ├── SHA1                             # SHA1 of 'config.cmake'
  │       ├── DONE
  │       ├── config.cmake                     # CMake file with unified hunter_config commands
  │       └── <Toolchain-ID>/
  │           ├── cmake.lock
  │           ├── SHA1                         # SHA1 of 'toolchain.info'
  │           ├── DONE
  │           ├── toolchain.info
  │           ├── cache.cmake
  │           ├── Install/                     # Main directory with installed packages (global)
  │           │   ├── include/
  │           │   ├── lib/
  │           │   └── ...
  │           └── Build/                       # Directory for building packages
  │               └── <Package>/
  │                   ├── DONE                 # Stamp - package already built and installed
  │                   ├── CMakeLists.txt       # File with ExternalProject_Add command configured from build scheme
  │                   ├── toolchain.cmake
  │                   ├── args.cmake
  │                   ├── cache.sha1
  │                   ├── types.info
  │                   ├── internal_deps.id
  │                   ├── Source/              # Unpacked sources of package
  │                   ├── Build/               # Build directory of package
  │                   ├── Install/             # Directory for local installation (for cacheable packages)
  │                   ├── Dependencies/        # Directory for saving information about depedencies
  │                   │   └── <Package>/
  │                   │       ├── __dep        # Empty stamp file, means this package depends on <Package>
  │                   │       └── <Component>/
  │                   │           └── __dep
  │                   └── __<Component>/       # Directory for building component, same layout
  │                       ├── DONE
  │                       ├── CMakeLists.txt
  │                       ├── toolchain.cmake
  │                       ├── args.cmake
  │                       ├── cache.sha1
  │                       ├── types.info
  │                       ├── internal_deps.id
  │                       ├── Source/
  │                       ├── Build/
  │                       ├── Install/
  │                       └── Dependencies/
  ├── Download/                                # see below
  └── Cache/                                   # see below

Download
========

Directory for storing archives with sources. Sources will be unpacked to
``<Hunter-ID>/<Config-ID>/<Toolchain-ID>/Build/<Package>/Source`` directory.
One exception is archives with Hunter itself since we have no information
about ``<Config-ID>/<Toolchain-ID>`` part (we have to calculate them using
Hunter code).

.. code-block:: none
  :emphasize-lines: 2,4,6,8,10,12,14,16,18,20,22,24,26,28,30

  Download/
  ├── <Package>/
  │   └── <version>/
  │       └── <Archive-ID>/
  │           ├── cmake.lock
  │           ├── SHA1                   # SHA1 of <Package>.tar.bz2
  │           ├── DONE
  │           └── <Package>.tar.bz2      # archive with sources
  └── Hunter/
      └── <version>/
           └── <Hunter-ID>/              # created by HunterGate module
               ├── cmake.lock
               ├── SHA1                  # SHA1 of Hunter archive
               ├── DONE
               ├── CMakeLists.txt
               ├── <Package>.tar.bz2     # Hunter archive
               ├── Build/
               └── Unpacked/             # Unpacked Hunter archive (HUNTER_SELF)

Cache
=====

Cache directory can be used by several Hunter-ID directories and consists
of ``raw`` directory with ``*.tar.bz2`` files (packed installed binaries) and
``meta`` directory with information about such binaries (SHA1 of sources,
arguments, dependencies, etc.).

.. code-block:: none
  :emphasize-lines: 2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42

  Cache/
  ├─ raw/
  │  └─ <cache>.tar.bz2
  └─ meta/
     └─ <toolchain-id>/
        ├─ cmake.lock
        ├─ SHA1                                   # SHA1 of toolchain.info
        ├─ DONE
        ├─ toolchain.info                         # see above
        └─ <Package>/
           └─ <__Component>/                      # (optional, if any)
              └─ <version>/
                 └─ <Archive-ID>/
                    ├─ cmake.lock
                    ├─ SHA1                       # SHA1 of archive with sources
                    ├─ DONE
                    └─ <Args-ID>/
                       ├─ cmake.lock
                       ├─ SHA1                    # SHA1 of args.cmake
                       ├─ DONE
                       ├─ args.cmake              # arguments used to build this package
                       └─ <Types-ID>/
                          ├─ cmake.lock
                          ├─ SHA1                 # SHA1 of types.info
                          ├─ DONE
                          ├─ types.info           # build types (Release, Debug)
                          └─ <Internal-Deps-ID>/
                             ├─ cmake.lock
                             ├─ SHA1              # SHA1 of internal_deps.id
                             ├─ DONE
                             ├─ internal_deps.id  # PACKAGE_INTERNAL_DEPS_ID (empty for CMake-based packages)
                             ├─ basic-deps.info   # list of explicit dependencies of package
                             ├─ basic-deps.DONE   # stamp: basic-deps.info created
                             └─ <Deps-ID>/
                                ├─ cmake.lock
                                ├─ SHA1           # SHA1 of deps.info
                                ├─ DONE
                                ├─ cache.sha1     # file with SHA1, this SHA1 means that binary can be
                                │                 # unpacked from '${HUNTER_ROOT}/_Base/Cache/raw/<SHA1>.tar.bz2'
                                ├─ deps.info      # list of all dependencies and corresponding SHA1 of cache archive
                                ├─ CACHE.DONE     # stamp: deps.info and cache.sha1 created and ready to be used
                                └─ from.server    # info downloaded from server, no need to upload this entry
