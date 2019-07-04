.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

.. _cmake-simple:

CMake (no dependencies)
-----------------------

If your CMake code is correctly written and has no dependencies then release
with sources can be used **as is** in Hunter. There is no need to have
``HunterGate``/``hunter_add_package`` calls and no need to have a maintenance fork.

Examples of such packages:

* :ref:`pkg.flatbuffers`

  * https://github.com/google/flatbuffers
  * See `flatbuffers/hunter.cmake <https://github.com/ruslo/hunter/blob/08a6cbcf06bb5934b6b18aa1f2028cf56a1063b7/cmake/projects/flatbuffers/hunter.cmake#L23-L32>`__
  * Testing table: `AppVeyor <https://ci.appveyor.com/project/ingenue/hunter/build/1.0.3215>`__, `Travis <https://travis-ci.org/ingenue/hunter/builds/326881125>`__

* :ref:`pkg.rocksdb`

  * https://github.com/facebook/rocksdb
  * See `rocksdb/hunter.cmake <https://github.com/ruslo/hunter/blob/08a6cbcf06bb5934b6b18aa1f2028cf56a1063b7/cmake/projects/rocksdb/hunter.cmake#L19-L23>`__
  * Testing table: `Travis <https://travis-ci.org/ingenue/hunter/builds/326905326>`__

* :ref:`pkg.nlohmann_json`

  * https://github.com/nlohmann/json
  * See `nlohmann_json/hunter.cmake <https://github.com/ruslo/hunter/blob/08a6cbcf06bb5934b6b18aa1f2028cf56a1063b7/cmake/projects/nlohmann_json/hunter.cmake#L53-L58>`__
  * Testing table: `AppVeyor <https://ci.appveyor.com/project/ingenue/hunter/build/1.0.3217>`__, `Travis <https://travis-ci.org/ingenue/hunter/builds/326883658>`__

Default behavior
================

Please check that your package respect (i.e. does not rewrite) such CMake
variables like:

* `CMAKE_INSTALL_PREFIX <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_INSTALL_PREFIX.html>`__ (**critical**)
* `CMAKE_{C,CXX}_FLAGS + variations <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`__ (**critical**)
* `CMAKE_{C,CXX}_COMPILER + friends <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`__ (**critical**)
* `CMAKE_BUILD_TYPE <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_BUILD_TYPE.html>`__ (not critical, but recommended)
* `CMAKE_CONFIGURATION_TYPES <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_CONFIGURATION_TYPES.html>`__ (not critical, but recommended)
* `BUILD_SHARED_LIBS <http://www.cmake.org/cmake/help/v3.2/variable/BUILD_SHARED_LIBS.html>`__ (not critical, but may result some errors)

Environment
===========

Configuration of the package should be predictable.

For example it should not depend on the fact that some package already installed
or not:

.. code-block:: cmake
  :emphasize-lines: 2

  find_package(OpenSSL)
  if(OPENSSL_FOUND)
    target_compile_definitions(... PUBLIC FOO_WITH_OPENSSL=1)
  endif()

If package is optional then control behavior explicitly:

.. code-block:: cmake
  :emphasize-lines: 1, 5

  option(FOO_WITH_OPENSSL "Build with OpenSSL" ON)

  if(FOO_WITH_OPENSSL)
    find_package(OpenSSL REQUIRED) # fatal error if not found!
    target_compile_definitions(... PUBLIC FOO_WITH_OPENSSL=1)
  endif()

Same with the programs:

.. code-block:: cmake
  :emphasize-lines: 2

  find_program(PYTHON_EXE python) # Use 'find_package(PythonInterp)' in real code
  if(PYTHON_EXE)
    # generate some extra code
  endif()

Use this code instead:

.. code-block:: cmake
  :emphasize-lines: 1, 4, 6

  option(FOO_WITH_PYTHON "Build with Python" ON)

  if(FOO_WITH_PYTHON)
    find_program(PYTHON_EXE python)
    if(NOT PYTHON_EXE)
      message(FATAL_ERROR "Python not found")
    endif()
  endif()

Environment variable example:

.. code-block:: cmake
  :emphasize-lines: 1

  if(EXISTS "$ENV{FOO_EXTRA_CODE}")
    # add some code
  endif()

Solution:

.. code-block:: cmake
  :emphasize-lines: 1, 4

  option(FOO_WITH_EXTRA_CODE "Use extra code" ON)

  if(FOO_WITH_EXTRA_CODE)
    if(NOT EXISTS "$ENV{FOO_EXTRA_CODE}")
      message(FATAL_ERROR "...")
    endif()
  endif()

Note that this is kind of a natural limitation because otherwise Hunter have
to save the whole outside environment like default paths, environment
variables, etc. This is not doable on practice.

Exception is the variables related to compiler/toolchain like compiler version,
compiler id, platforms, generators, architectures: ``WIN32``, ``IOS``,
``ANDROID``, etc. Number of such traits is limited and forms
:doc:`toolchain-id </overview/customization/toolchain-id>`.

.. admonition:: CGold

  * `Depending on environment variable <http://cgold.readthedocs.io/en/latest/tutorials/variables/environment.html#no-tracking>`__

.. _create new install xxxconfig:

Install XXXConfig.cmake
=======================

The easiest way to integrate installed libraries into other project is to use
`find_package <https://cmake.org/cmake/help/latest/command/find_package.html>`__
command. Project should generate and install ``*Config.cmake`` files instead
of using ``Find*.cmake`` modules. It's the one of the painless ways to support
relocation - imported targets can be cached and downloaded as prebuilt binary
archive from build servers. Plus only imported targets works nicely with non
standard build types like ``MinSizeRel`` or ``RelWithDebInfo``.

To check this feature you can try to install files to local directory.
If result of installation looks like this:

.. code-block:: none
  :emphasize-lines: 4-5

  Install the project...
  /.../cmake -P cmake_install.cmake
  -- Install configuration: "Release"
  -- Installing: /.../lib/libhunter_box_1.a
  -- Installing: /.../include/hunter_box_1.hpp

It means that this feature is missing and you need to
:doc:`patch CMake code </creating-new/patch>` to introduce it.
Details can be found
`here <https://github.com/ruslo/hunter/wiki/example.find_package.config>`__.

Installation after fix:

.. code-block:: none
  :emphasize-lines: 6-9

  Install the project...
  /.../cmake -P cmake_install.cmake
  -- Install configuration: "Release"
  -- Installing: /.../lib/libhunter_box_1.a
  -- Installing: /.../include/hunter_box_1.hpp
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1Config.cmake
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1ConfigVersion.cmake
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1Targets.cmake
  -- Installing: /.../lib/cmake/hunter_box_1/hunter_box_1Targets-release.cmake

.. admonition:: CGold

  * `Rejected: FindXXX.cmake <http://cgold.readthedocs.io/en/latest/rejected/find-modules.html>`__
  * `Install layout <http://cgold.readthedocs.io/en/latest/tutorials/install/layout.html>`__

.. admonition:: CMake documentation

  * `find_package <https://cmake.org/cmake/help/latest/command/find_package.html>`__
  * `cmake-packages <https://cmake.org/cmake/help/latest/manual/cmake-packages.7.html>`__

Add package to Hunter
=====================

Next let's assume user `hunterbox <https://github.com/hunterbox>`__ is
trying to add `hunter_box_1 <https://github.com/hunterbox/hunter_box_1>`__
project to Hunter.

.. admonition:: Examples on GitHub

  * `Example: hunterbox/hunter_box_1 <https://github.com/hunterbox/hunter_box_1>`__

Recommended name for the package is lowercase separated with underscore.

C++:

.. code-block:: cpp

  #include <hunter_box_1/hunter_box_1.hpp>

  int main() {
    hunter_box_1::foo();
  }

.. code-block:: cpp

  // file hunter_box_1.hpp

  namespace hunter_box_1 {
  } // namespace hunter_box_1

CMake with Hunter:

.. code-block:: cmake

  hunter_add_package(hunter_box_1)
  find_package(hunter_box_1 CONFIG REQUIRED)
  target_link_libraries(... hunter_box_1::hunter_box_1)

In Hunter sources:

* ``cmake/projects/hunter_box_1/hunter.cmake`` file with versions
* ``examples/hunter_box_1`` directory with example for testing
* ``docs/packages/pkg/hunter_box_1.rst`` documentation for package

Git branches (will be covered in details later):

* ``pkg.hunter_box_1`` branch for testing
* ``upload.hunter_box_1`` branch for uploading
* ``pr.hunter_box_1`` work-in-progress branch for adding/updating package

Fork Hunter
===========

Hunter hosted on GitHub service where common way to add code is to fork
project and create pull request.

Fork `ruslo/hunter <https://github.com/ruslo/hunter>`__, clone
`your fork <https://github.com/hunterbox/hunter>`__ and initialize all
submodules:

.. code-block:: none

  > git clone https://github.com/hunterbox/hunter
  > cd hunter
  [hunter]> git submodule update --init --recursive .

Create branch to work on new package:

.. code-block:: none

  [hunter]> git checkout -b pr.hunter_box_1

Add versions
============

Add one or several versions of ``hunter_box_1`` package to corresponding
``hunter.cmake`` file.

Copy template and substitute all strings ``foo`` to ``hunter_box_1``:

.. code-block:: none

  [hunter]> cp -r cmake/projects/foo cmake/projects/hunter_box_1
  [hunter]> sed -i 's,foo,hunter_box_1,g' cmake/projects/hunter_box_1/hunter.cmake

Download release archive and calculate ``SHA1``:

.. code-block:: none

  > wget https://github.com/hunterbox/hunter_box_1/archive/v1.0.0.tar.gz
  > openssl sha1 v1.0.0.tar.gz
  SHA1(v1.0.0.tar.gz)= c724e0f8a4ebc95cf7ba628b89b998b3b3c2697d

Add this information to ``cmake/projects/hunter_box_1/hunter.cmake`` file:

.. code-block:: cmake
  :emphasize-lines: 10, 12, 14, 16

  # !!! DO NOT PLACE HEADER GUARDS HERE !!!

  include(hunter_add_version)
  include(hunter_cacheable)
  include(hunter_download)
  include(hunter_pick_scheme)

  hunter_add_version(
      PACKAGE_NAME
      hunter_box_1
      VERSION
      1.0.0
      URL
      "https://github.com/hunterbox/hunter_box_1/archive/v1.0.0.tar.gz"
      SHA1
      c724e0f8a4ebc95cf7ba628b89b998b3b3c2697d
  )

  hunter_pick_scheme(DEFAULT url_sha1_cmake)
  hunter_cacheable(hunter_box_1)
  hunter_download(PACKAGE_NAME hunter_box_1)

Consistency
===========

Please keep Git tag and ``VERSION`` in consistent state.
For example if ``URL`` is:

.. code-block:: cmake
  :emphasize-lines: 3-4

  hunter_add_version(
      # ...
      URL
      "https://github.com/hunterbox/hunter_box_1/archive/v1.3.15-da39a3e-p6.tar.gz"
      # ...
  )

Then ``VERSION`` should be:

.. code-block:: cmake
  :emphasize-lines: 3-4

  hunter_add_version(
      # ...
      VERSION
      1.3.15-da39a3e-p6
      URL
      "https://github.com/hunterbox/hunter_box_1/archive/v1.3.15-da39a3e-p6.tar.gz"
      # ...
  )

CMake options
=============

Note that it does not make sense to build and install stuff like examples,
tests or documentation. Please check that your package has CMake options to
disable those. If such an option is not disabled by default use
``hunter_cmake_args``:

.. code-block:: cmake
  :emphasize-lines: 1, 6, 9-11

  include(hunter_cmake_args)

  # ...

  # bottom of cmake/projects/foo/hunter.cmake
  hunter_cmake_args(
      foo
      CMAKE_ARGS
          FOO_BUILD_EXAMPLES=OFF
          FOO_BUILD_TESTS=OFF
          FOO_BUILD_DOCUMENTATION=OFF
  )

  hunter_pick_scheme(DEFAULT url_sha1_cmake)
  hunter_download(PACKAGE_NAME foo)

Options set by ``hunter_cmake_args`` have lower precedence than options set
by ``hunter_config(... CMAKE_ARGS ...)`` (see
`order <https://github.com/ruslo/hunter/wiki/example.custom.config.id#order>`__).

Build types
===========

.. warning::

  Usually there is no need to set a build type explicitly. If the package does not
  work with default ``Debug`` + ``Release`` it means something is wrong with
  the package itself.

Default build type(s) can be set by ``hunter_configuration_types``:

.. code-block:: cmake

  hunter_configuration_types(foo CONFIGURATION_TYPES Release)
  hunter_download(PACKAGE_NAME foo)

User can overwrite this default by using
`custom <https://github.com/ruslo/hunter/wiki/example.custom.config.id>`__
``hunter_config`` parameters.

Set default version
===================

Add ``hunter_default_version`` directive with default version to
``cmake/configs/default.cmake``:

.. code-block:: cmake

  hunter_default_version(hunter_box_1 VERSION 1.0.0)

Create example
==============

 To test the integration of the package into another project a simple example will be used.
 Copy the template example and substitute all strings ``foo`` with ``hunter_box_1``:

.. code-block:: none

  [hunter]> cp -r examples/foo examples/hunter_box_1
  [hunter]> sed -i 's,foo,hunter_box_1,g' examples/hunter_box_1/*

Tweak all files in ``examples/hunter_box_1`` directory to fit headers and
names of imported targets.

Add documentation
=================

Each package should have a
:doc:`page with information and usage example </packages/all>`.

To create such a page copy the template file and substitute all strings ``foo`` with
the project name (for example ``hunter_box_1``):

.. code-block:: none

  [hunter]> cp docs/packages/pkg/foo.rst docs/packages/pkg/hunter_box_1.rst
  [hunter]> sed -i 's,foo,hunter_box_1,g' docs/packages/pkg/hunter_box_1.rst

Open file ``docs/packages/pkg/hunter_box_1.rst`` and tweak all entries.

Substitute ``unsorted`` with some tag in directive
``single: unsorted ; foo``. This tag will be used on
:ref:`this page <genindex>`.

If you want to have two tags add another line with ``single``:

.. code-block:: none

  .. index::
    single: category_1 ; foo
    single: category_2 ; foo

.. seealso::

  * `Gentoo packages <https://packages.gentoo.org/categories>`__
  * `Ubuntu packages <https://packages.ubuntu.com/>`__

.. note::

  Since you don't know the pull request number a priori leave it as ``N`` for now.
  You can update it later.

To locally check if the documentation is still building you can run:

.. code-block:: none

  [hunter]> cd docs
  [hunter/docs]> source ./jenkins.sh
  (_venv) [hunter/docs]> ./make.sh

If the documentation contains spelling errors or unrecognized names, the
documentation test build will fail and report the unrecognized strings. Fix
any spelling errors and test the build again. Any remaining errors can be
fixed by adding all correct but unrecognized names, string, or terms to the
``spelling`` header at the top of the document entry
``docs/packages/pkg/bar-baz.rst``. In this example,
``bar-baz`` would be a package name that is not in the dictionary.

.. code-block:: none
  :emphasize-lines: 1-4

  .. spelling::

    bar
    baz

  .. index::
    single: unsorted ; bar-baz

  .. _pkg.bar-baz:

Add entries for each term until the test build completes successfully.

Common mistake
==============

Please do not forget to substitute ``===``.

Good:

.. code-block:: none

  hunter_box_1
  ============

Bad:

.. code-block:: none

  hunter_box_1
  ===

Commit
======

Now save all changes by doing a commit:

.. code-block:: none

  [hunter]> git branch
    master
  * pr.hunter_box_1

  [hunter]> git add cmake/configs/default.cmake
  [hunter]> git add cmake/projects/hunter_box_1/
  [hunter]> git add docs/packages/pkg/hunter_box_1.rst
  [hunter]> git add examples/hunter_box_1/

  [hunter]> git commit -m "Add 'hunter_box_1' package"

.. _testing locally:

Testing locally
===============

This step is optional since we will run tests on the CI server. However it's the
fastest way to check that everything is ready and working correctly.

Script ``jenkins.py`` will package a temporary Hunter archive based on current
state and build the specified example. This script uses
`Polly <https://github.com/ruslo/polly>`__ toolchains.

Check you have Python 3 installed, clone Polly, add its ``bin`` folder to
``PATH`` environment variable, go back to Hunter repository and run test.

On Linux:

.. code-block:: none

  > which python3
  /usr/bin/python3

  > git clone https://github.com/ruslo/polly
  > cd polly
  [polly]> export PATH="`pwd`/bin:$PATH"

  > cd hunter
  [hunter]> which polly.py
  /.../bin/polly.py

  [hunter]> polly.py --help
  Python version: 3.5
  usage: polly.py [-h]
  ...

  [hunter]> TOOLCHAIN=gcc PROJECT_DIR=examples/hunter_box_1 ./jenkins.py

On Windows:

.. code-block:: none

  > git clone https://github.com/ruslo/polly
  > cd polly
  [polly]> set PATH=%CD%\bin;%PATH%

  > cd hunter
  [hunter]> where polly.py
  C:\...\bin\polly.py

  [hunter]> polly.py --help
  Python version: 3.5
  usage: polly.py [-h]
  ...

  [hunter]> set TOOLCHAIN=vs-12-2013
  [hunter]> set PROJECT_DIR=examples\hunter_box_1
  [hunter]> .\jenkins.py

.. admonition:: Stackoverflow

  * `How to execute Python scripts in Windows? <https://stackoverflow.com/a/1936078/2288008>`__

.. _ci testing:

CI testing
==========

Now let's run tests on continuous integration servers with various toolchains
and platforms. Hunter uses `AppVeyor <https://appveyor.com>`__ to test for
Windows (Visual Studio, NMake, Ninja, MinGW, MSYS) and
`Travis <https://travis-ci.org>`__ to test
for Linux (GCC, Clang, Android, Clang Analyzer, Sanitize Address, Sanitize Leak)
and for macOS (Clang + Makefile, Xcode, iOS).

Register your Hunter fork:

* `AppVeyor: Getting started <https://www.appveyor.com/docs/>`__
* `Travis: Getting started <https://docs.travis-ci.com/user/getting-started/>`__

Branch master
=============

To understand what should be done next you need to understand the structure
of branches.

* Name: ``master``
* Repository: https://github.com/ruslo/hunter
* Testing: Documentation on Linux

In branch ``master`` there is only the ``.travis.yml`` file which will only check
if the documentation is building:

* https://github.com/ruslo/hunter/blob/ea9de264d6c1b05484bdc16a9967c3cb8cca9048/.travis.yml#L57-L59

When you open a pull request to ``ruslo/hunter`` this test will automatically run.

Branch pkg.template
===================

* Name: ``pkg.template``
* Repository: https://github.com/ingenue/hunter
* Testing: *Nothing*

In branch ``pkg.template`` of the repository ``ingenue/hunter`` there are
the **template** files ``.travis.yml`` and ``appveyor.yml``:

* https://github.com/ingenue/hunter/blob/pkg.template/.travis.yml
* https://github.com/ingenue/hunter/blob/pkg.template/appveyor.yml

All changes from ``master`` will go to ``pkg.template``. The only differences
between ``master`` and ``pkg.template`` are the files ``.travis.yml``/``appveyor.yml``.

Branch pkg.<name>
=================

Branch for testing package ``<name>``.

* Name: ``pkg.<name>``
* Repository: https://github.com/ingenue/hunter
* Testing: Package ``<name>`` on Windows/Linux/macOS hosts

Real testing happens in ``pkg.<name>`` branch of ``ingenue/hunter`` repository.
E.g. branch ``pkg.gtest``:

* https://github.com/ingenue/hunter/tree/pkg.gtest
* AppVeyor https://ci.appveyor.com/project/ingenue/hunter/build/1.0.2352
* Travis https://travis-ci.org/ingenue/hunter/builds/274507515

All changes from ``pkg.template`` will go to ``pkg.<name>`` branch on updates.
The only differences between ``pkg.template`` and ``pkg.<name>`` are
the files ``travis.yml``/``appveyor.yml``.

Branch upload.<name>
====================

Branch for uploads.

* Name: ``upload.<name>``
* Repository: https://github.com/ingenue/hunter
* Testing: Upload archives with binaries to cache-server

After successful tests on ``pkg.<name>`` the branch ``upload.<name>`` will do
uploads. E.g. branch ``upload.gtest``:

* https://github.com/ingenue/hunter/tree/upload.gtest
* https://ci.appveyor.com/project/ingenue/hunter/build/1.0.2287
* https://travis-ci.org/ingenue/hunter/builds/270324624

All changes from ``pkg.<name>`` will go to ``upload.<name>`` branch on updates.
The only difference between ``upload.<name>`` and ``pkg.<name>`` is
the build command: ``jenkins.py`` vs. ``jenkins.py --upload``.

Branches structure
==================

Here is an image showing the structure of the branches:

.. image:: /creating-new/images/branches.png
  :align: center
  :alt: Branches

Fetch CI configs
================

Since we are adding a new package we have to create new CI configs for it.
Fetch the branch ``pkg.template`` and substitute all ``foo`` strings with
``hunter_box_1``:

.. code-block:: none

  [hunter]> git remote add ci https://github.com/ingenue/hunter
  [hunter]> git fetch ci
  [hunter]> git checkout pkg.template
  [hunter]> git checkout -b pr.pkg.hunter_box_1

  [hunter]> sed -i 's,foo,hunter_box_1,g' .travis.yml
  [hunter]> sed -i 's,foo,hunter_box_1,g' appveyor.yml

  [hunter]> git add .travis.yml appveyor.yml
  [hunter]> git commit -m "Test 'hunter_box_1' package"

Run remote tests
================

Currently we have two new branches:

* ``pr.hunter_box_1`` contains new package
* ``pr.pkg.hunter_box_1`` contains configs for testing

.. code-block:: none

  [hunter]> git branch -vv
    master
    pkg.template
    pr.hunter_box_1     9f60453 Add 'hunter_box_1' package
  * pr.pkg.hunter_box_1 4a7626d Test 'hunter_box_1' package

To run tests we need to merge both changes into ``test.hunter_box_1``
and push ``test.hunter_box_1`` branch to remote:

.. code-block:: none

  [hunter]> git checkout pr.hunter_box_1
  [hunter]> git checkout -b test.hunter_box_1
  [hunter]> git merge pr.pkg.hunter_box_1
  [hunter]> git push -u origin test.hunter_box_1

Example:

* https://travis-ci.org/hunterbox/hunter/builds/276514711

.. image:: /creating-new/images/pull-request.png
  :align: center
  :alt: Pull request

Fix AppVeyor path too long error
================================

If you see error

.. code-block:: none

  -- The C compiler identification is unknown
  -- The CXX compiler identification is unknown

or

.. code-block:: none

  ...: error MSB3491: Could not write lines to file "...".
  The specified path, file name, or both are too long. The fully qualified file
  name must be less than 260 characters, and the directory name must be less than
  248 characters

on Windows build, adding :ref:`HUNTER_BINARY_DIR <env hunter binary dir>`
environment variable should help:

.. code-block:: yaml
  :emphasize-lines: 4

  - TOOLCHAIN: "vs-15-2017-win64-cxx17"
    PROJECT_DIR: examples\SuiteSparse
    APPVEYOR_BUILD_WORKER_IMAGE: Visual Studio 2017
    HUNTER_BINARY_DIR: C:\__BIN

Example:

* https://github.com/ingenue/hunter/blob/05bd9cdbd03a5772302c65abb9119722b9b8e08c/appveyor.yml#L21-L24

Fix Travis log too long error
=============================

If you see error

.. code-block:: none

  The job exceeded the maximum log length, and has been terminated.

Adding ``VERBOSE=0`` environment variable should help:

.. code-block:: yaml
  :emphasize-lines: 5

  - os: linux
    env: >
      TOOLCHAIN=android-ndk-r17-api-24-arm64-v8a-clang-libcxx14
      PROJECT_DIR=examples/OpenCV
      VERBOSE=0

Example:

* https://github.com/ingenue/hunter/blob/92cb26bd0bc5eeb14525f56b3a068fb072e2e5a1/.travis.yml#L55-L59

Workaround for GCC internal error
=================================

Travis machines have 32 logical cores and Hunter will use all of them by default
(e.g. build with ``make -j32``). Because of this system may run out of memory
and GCC may get killed:

.. code-block:: none

  g++-7: internal compiler error: Killed (program cc1plus)

As a workaround you can limit number of jobs explicitly by adding
the :ref:`HUNTER_JOBS_NUMBER <hunter jobs number env>` environment variable:

.. code-block:: yaml
  :emphasize-lines: 5

  - os: linux
    env: >
      TOOLCHAIN=gcc-7-cxx17
      PROJECT_DIR=examples/mkldnn
      HUNTER_JOBS_NUMBER=4

Example:

* https://github.com/ingenue/hunter/blob/c1e12ba21940b8418d1e3d596b653ad3bf588e11/.travis.yml#L41-L45

.. admonition:: Stackoverflow

  * https://stackoverflow.com/a/35011967

Excluding tests
===============

If all tests passed you can skip this section.

If some toolchains are working and some toolchains failed it means the project
has platform-specific problems. Note that you don't have to have all
toolchains working and there is **no need to fix all issues you see**.
If at least *something* is working then you can exclude broken
toolchains and you or somebody else can apply fixes later.

Please follow these guidelines when disabling toolchains:

- **Do not remove** toolchains from ``.travis.yml``/``appveyor.yml`` configs.
  Comment it out instead to simplify enabling it back.
- Do not change the order of toolchains since it will affect ``git merge``.
- Leave the link to broken job:

.. literalinclude:: ci/.travis-NEW.yml
  :diff: ci/.travis-OLD.yml

If no working toolchain is left for ``.travis.yml`` or ``appveyor.yml`` then
comment out everything and add ``TOOLCHAIN=dummy`` test (see
`example <https://github.com/ingenue/hunter/blob/b52b18e7ac51cec76c63a61dd81195c5bfc2a160/appveyor.yml#L35-L41>`__).

Go to branch ``pr.pkg.hunter_box_1`` with CI configs and commit this change
there:

.. code-block:: none

  [hunter]> git checkout pr.pkg.hunter_box_1
  [hunter]> git add .travis.yml
  [hunter]> git commit -m 'Exclude broken'

Go to testing branch ``test.hunter_box_1``, merge updated CI configs and run
new CI tests by pushing commits to remote:

.. code-block:: none

  [hunter]> git checkout test.hunter_box_1
  [hunter]> git merge pr.pkg.hunter_box_1
  [hunter]> git push

Pull requests (tests)
=====================

First push ``pr.pkg.hunter_box_1`` with CI configs:

.. code-block:: none

  [hunter]> git checkout pr.pkg.hunter_box_1
  [hunter]> git push -u origin pr.pkg.hunter_box_1

Open pull request to ``ingenue/hunter`` repository, to ``pkg.template``
branch:

.. image:: /creating-new/images/pr-with-tests.png
  :align: center
  :alt: Pull request with tests

I will create ``pkg.hunter_box_1`` and change branch before merging:

.. image:: /creating-new/images/pr-change-branch.png
  :align: center
  :alt: Change branch

Pull requests
=============

After CI configs merged you can open pull request with package itself:

.. code-block:: none

  [hunter]> git checkout pr.hunter_box_1
  [hunter]> git push -u origin pr.hunter_box_1

.. image:: /creating-new/images/pr-with-package.png
  :align: center
  :alt: PR with package

At this moment you know the pull request number:

.. image:: /creating-new/images/pr-number.png
  :align: center
  :alt: Pull request number

Add it to documentation:

.. code-block:: none

  [hunter]> git checkout pr.hunter_box_1
  [hunter]> vim docs/packages/pkg/hunter_box_1.rst
  [hunter]> git add docs/packages/pkg/hunter_box_1.rst
  [hunter]> git commit -m 'Pull request number'
  [hunter]> git push

Pull request will be approved and tests run on CI, documentation will be
tested automatically:

.. image:: /creating-new/images/package-testing.png
  :align: center
  :alt: Package testing

Branch ``pkg.hunter_box_1.pr-N`` will be created from ``pkg.hunter_box_1``
to test package:

.. image:: /creating-new/images/pull-request-testing.png
  :align: center
  :alt: Change branch

Upload
======

After all tests pass the pull request will be merged and upload run. When upload
finished new release will be created:

.. image:: /creating-new/images/upload.png
  :align: center
  :alt: Upload

You can use new ``URL``/``SHA1``:

.. image:: /creating-new/images/release.png
  :align: center
  :alt: Upload

Clean
=====

At this moment all branches can be removed:

.. code-block:: none

  [hunter]> git checkout master

  [hunter]> git push origin :pr.hunter_box_1
  [hunter]> git push origin :pr.pkg.hunter_box_1
  [hunter]> git push origin :test.hunter_box_1

  [hunter]> git branch -D pr.hunter_box_1
  [hunter]> git branch -D pr.pkg.hunter_box_1
  [hunter]> git branch -D test.hunter_box_1

Badge
=====

Badge in ``README.rst`` can signal that package ``hunter_box_1`` is available
via Hunter:

.. code-block:: none

  |hunter|

  .. |hunter| image:: https://img.shields.io/badge/hunter-hunter_box_1-blue.svg
    :target: https://docs.hunter.sh/en/latest/packages/pkg/hunter_box_1.html
    :alt: Hunter

Example:

* https://github.com/hunter-packages/gauze/blob/master/README.rst
