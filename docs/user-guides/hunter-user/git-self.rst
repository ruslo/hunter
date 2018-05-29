.. Copyright (c) 2018, Ruslan Baratov
.. All rights reserved.

Injecting current Git repository
--------------------------------

It is possible to pack current Git repository and use created archive as
a package. Such scenario is common for the projects with usage example code.

For instance we have project ``fruits``:

.. code-block:: none

  > git clone https://github.com/cgold-examples/fruits
  > cd fruits
  [fruits]>

There is top level ``CMakeLists.txt``:

.. code-block:: none

  [fruits]> grep '^project' CMakeLists.txt
  project(fruits VERSION 1.0.0)

And subdirectory ``example`` that can be used as a stand-alone project:

.. code-block:: none

  [fruits]> grep 'add_subdirectory(example)' CMakeLists.txt
    add_subdirectory(example)

  [fruits]> grep '^project' example/CMakeLists.txt
  project(fruits-example)

If you start building from top you can build ``fruits`` and ``fruits-example``
as a one big monolithic project:

.. code-block:: none

  [fruits]> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
  [fruits]> cmake --build _builds
  Scanning dependencies of target fruits_rosaceae
  ...
  Scanning dependencies of target fruits_quick_meal
  [ 95%] Building CXX object example/fruits/quick_meal/CMakeFiles/fruits_quick_meal.dir/main.cpp.o
  [100%] Linking CXX executable fruits_quick_meal
  [100%] Built target fruits_quick_meal

However you can build ``fruits-example`` as a stand-alone project. In this
case ``fruits`` will be packed on the fly and installed as a Hunter package:

.. code-block:: none

  [fruits]> rm -rf _builds
  [fruits]> cd example
  [fruits/example]> cmake -H. -B_builds -DHUNTER_STATUS_DEBUG=ON
  ...
  -- [hunter *** DEBUG *** ...] Creating archive '/.../fruits/example/_builds/_3rdParty/Hunter/git-archives/fruits.tar'
  ...
  -- [hunter] Building fruits
  ...
  Install the project...
  /.../bin/cmake -P cmake_install.cmake
  -- Install configuration: "Release"
  -- Installing: /.../.hunter/_Base/19e4a2f/489ecc6/e734c3e/Build/fruits/Install/include/fruits/fruits.hpp
  -- Installing: /.../.hunter/_Base/19e4a2f/489ecc6/e734c3e/Build/fruits/Install/include/fruits/rosaceae/Plum.hpp
  -- Installing: /.../.hunter/_Base/19e4a2f/489ecc6/e734c3e/Build/fruits/Install/lib/cmake/fruits/fruitsConfig.cmake
  -- Installing: /.../.hunter/_Base/19e4a2f/489ecc6/e734c3e/Build/fruits/Install/lib/libfruits_rosaceae.a
  ...

There is no ``fruits`` libraries while building project:

.. code-block:: none

  [fruits/example]> cmake --build _builds
  Scanning dependencies of target fruits_vegan_party
  [ 25%] Building CXX object fruits/vegan_party/CMakeFiles/fruits_vegan_party.dir/main.cpp.o
  [ 50%] Linking CXX executable fruits_vegan_party
  [ 50%] Built target fruits_vegan_party
  Scanning dependencies of target fruits_quick_meal
  [ 75%] Building CXX object fruits/quick_meal/CMakeFiles/fruits_quick_meal.dir/main.cpp.o
  [100%] Linking CXX executable fruits_quick_meal
  [100%] Built target fruits_quick_meal

Local ``config.cmake`` file:

.. code-block:: none

  [fruits/example]> cat cmake/Hunter/config.cmake
  hunter_config(fruits GIT_SELF)

.. hint::

  It can be useful for testing ``find_package(fruits ...)`` functionality and
  that generated ``fruitsConfig.cmake`` file is correct.

.. note::

  Under the hood ``git archive`` command is used to pack the project, hence
  if you want to test modifications you have to commit them. This is similar
  to ``GIT_SUBMODULE`` feature. But unlike ``GIT_SUBMODULE`` feature not all
  the dirty files will be checked. While using ``GIT_SELF`` the dirty files
  inside ``fruits/example`` directory will be ignored (check log messages).
