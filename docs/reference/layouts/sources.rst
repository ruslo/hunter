.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Sources
-------

This is a detailed `sources <https://github.com/ruslo/hunter>`__ layout:

.. code-block:: none

  .
  ├── docs/                              # readthedocs.io RST documentation
  ├── examples/<name>                    # examples for testing
  ├── gate/                              # HunterGate module for testing
  ├── maintenance/                       # scripts for generating files for Hunter
  ├── scripts/                           # global scripts
  ├── tests/<name>                       # unit-testing
  └── cmake/
      ├── Hunter                         # master file
      ├── templates/                     # global CMake templates
      ├── schemes/                       # global schemes
      ├── configs/
      │   └── default.cmake              # default config
      ├── find/                          # Hunterized CMake Find*.cmake modules
      ├── modules/                       # CMake modules
      └── projects/
          └── <name>/
              ├── hunter.cmake
              ├── scripts/               # package specific scripts
              ├── templates/             # package specific CMake templates
              ├── schemes/               # package specific schemes
              │   ├── default.cmake.in
              │   ├── iphoneos.cmake.in
              │   └── windows.cmake.in
              ├── ep-stages/
              │   ├── configure.cmake.in
              │   ├── build.cmake.in
              │   └── install.cmake.in
              └── <component>
                  └──  hunter.cmake

.. note::

  * all top directories except ``cmake`` and ``scripts`` can be removed from
    final release since none of them used by user
    (TODO: move ``scripts`` to ``cmake/scripts``)

  * ``maintenance`` holds scripts for generating files that will be saved in
    git. Generation done by developers and never runs by Hunter so it can be
    any kind of scripts, e.g. Python. This directory can be removed from
    release too

  * for name of package specific ``schemes`` see
    `hunter_pick_scheme <https://github.com/ruslo/hunter/wiki/dev.modules#hunter_pick_scheme>`__
