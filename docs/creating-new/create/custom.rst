.. Copyright (c) 2016, Ruslan Baratov
.. All rights reserved.

Non-CMake: custom scheme
------------------------

Non-CMake projects can be added too. But sometimes it's not a trivial task
(for example there are a 3 custom schemes for `OpenSSL <https://github.com/ruslo/hunter/blob/master/cmake/projects/OpenSSL/hunter.cmake>`_. In general it's better to
apply a patch to an existing CMake build and use :ref:`cmake-simple` add
instruction. Anyway here is a guide how to add a project with custom build:

Test it manually
================

.. code-block:: bash

    > wget https://github.com/phonegap/ios-sim/archive/1.8.2.tar.gz
    > openssl sha1 1.8.2.tar.gz
    SHA1(1.8.2.tar.gz)= 4328b3c8e6b455631d52b7ce5968170c9769eb1e
    > tar xf 1.8.2.tar.gz
    > cd ios-sim-1.8.2/
    > xcodebuild -target ios-sim -configuration Release
    > ls build/Release/ios-sim
    build/Release/ios-sim

Test it using ``ExternalProject_Add``
=====================================

.. code-block:: bash

    > cat CMakeLists.txt
    cmake_minimum_required(VERSION 3.0)

    include(ExternalProject) # ExternalProject_Add

    ExternalProject_Add(
        ios_sim
        URL
        "https://github.com/phonegap/ios-sim/archive/1.8.2.tar.gz"
        URL_HASH
        SHA1=4328b3c8e6b455631d52b7ce5968170c9769eb1e
        CONFIGURE_COMMAND
        ""
        BUILD_COMMAND
        xcodebuild -target ios-sim -configuration Release
        BUILD_IN_SOURCE
        1
        INSTALL_COMMAND
        "${CMAKE_COMMAND}" -E make_directory "${CMAKE_INSTALL_PREFIX}"
        COMMAND
        "${CMAKE_COMMAND}" -E copy build/Release/ios-sim "${CMAKE_INSTALL_PREFIX}"
    )
    > cmake -H. -B_builds -DCMAKE_INSTALL_PREFIX=`pwd`/_install
    > cmake --build _builds/
    > ls _install/
    ios-sim

Add new package
===============

First, custom build scheme need to be added to ``cmake/schemes`` directory:

.. code-block:: bash

    > cd ${HUNTER_ROOT}
    > cat cmake/schemes/url_sha1_ios_sim.cmake.in
    # This is configuration file, variable @SOME_VARIABLE_NAME@ will be substituted during configure_file command
    cmake_minimum_required(VERSION 3.0)

    # If such variables like `CMAKE_CXX_FLAGS` or `CMAKE_CXX_COMPILER` not used by scheme
    # setting `LANGUAGES` to `NONE` will speed-up build a little bit. If you have any problems/glitches
    # use regular `project(Hunter)` command
    project(Hunter LANGUAGES NONE)

    include(ExternalProject) # ExternalProject_Add

    # some Hunter modules will be used
    list(APPEND CMAKE_MODULE_PATH "@HUNTER_SELF@/cmake/modules")

    include(hunter_status_debug)
    include(hunter_assert_not_empty_string)

    # print this message if HUNTER_STATUS_DEBUG option is ON
    hunter_status_debug("Scheme: url_sha1_ios_sim")

    # Check variables is not empty
    hunter_assert_not_empty_string("@HUNTER_SELF@")
    hunter_assert_not_empty_string("@HUNTER_EP_NAME@")
    hunter_assert_not_empty_string("@HUNTER_PACKAGE_URL@")
    hunter_assert_not_empty_string("@HUNTER_PACKAGE_SHA1@")
    hunter_assert_not_empty_string("@HUNTER_PACKAGE_DOWNLOAD_DIR@")
    hunter_assert_not_empty_string("@HUNTER_PACKAGE_SOURCE_DIR@")
    hunter_assert_not_empty_string("@HUNTER_INSTALL_PREFIX@")

    ExternalProject_Add(
        @HUNTER_EP_NAME@ # Name of the external project. Actually not used set for beautify logging messages
        URL
        @HUNTER_PACKAGE_URL@ # URL of the package to download
        URL_HASH
        SHA1=@HUNTER_PACKAGE_SHA1@ # SHA1 hash
        DOWNLOAD_DIR
        "@HUNTER_PACKAGE_DOWNLOAD_DIR@" # Archive destination location
        SOURCE_DIR
        "@HUNTER_PACKAGE_SOURCE_DIR@" # Unpack directory
        INSTALL_DIR
        "@HUNTER_INSTALL_PREFIX@" # not used actually (see install command)
        CONFIGURE_COMMAND
        ""
        BUILD_COMMAND
        xcodebuild -target ios-sim -configuration Release
        BUILD_IN_SOURCE
        1
        INSTALL_COMMAND
        "@CMAKE_COMMAND@" -E copy build/Release/ios-sim "@HUNTER_INSTALL_PREFIX@"
    )

Next steps are similar to :ref:`cmake-simple`.

.. code-block:: bash

    > cat cmake/projects/ios_sim/hunter.cmake

    # !!! DO NOT PLACE HEADER GUARDS HERE !!!

    include(hunter_add_version)
    include(hunter_download)
    include(hunter_pick_scheme)

    hunter_add_version(
        PACKAGE_NAME
        ios_sim
        VERSION
        "1.8.2"
        URL
        "https://github.com/phonegap/ios-sim/archive/1.8.2.tar.gz"
        SHA1
        4328b3c8e6b455631d52b7ce5968170c9769eb1e
    )

    hunter_pick_scheme(DEFAULT url_sha1_ios_sim) # Use new custom scheme
    hunter_download(PACKAGE_NAME ios_sim)

.. code-block:: bash

    > grep ios_sim cmake/config/default.cmake
    hunter_default_version(ios_sim VERSION 1.8.2)

Using
=====

Now package ready to be used:

.. code-block:: bash

    > cat CMakeLists.txt
    cmake_minimum_required(VERSION 2.8)

    include("cmake/HunterGate.cmake")

    HunterGate(
        URL "https://url/to/your/hunter-archive.tar.gz"
        SHA1 "put-archive-sha1-here"
    )

    hunter_add_package(ios_sim)

    find_program(IOS_SIM_EXECUTABLE ios-sim ${IOS_SIM_ROOT})
    message("ios_sim: ${IOS_SIM_EXECUTABLE}")
    > cmake -H. -B_builds
    -- [hunter] HUNTER_ROOT: /.../Hunter
    -- [hunter] [ Hunter-ID: 7912489 | Config-ID: 9ec2ff8 | Toolchain-ID: c018e63 ]
    -- [hunter] IOS_SIM_ROOT: /.../Hunter/_Base/7912489/9ec2ff8/c018e63/Install (ver.: 1.8.2)
    ...
    -- downloading...
         src='https://github.com/phonegap/ios-sim/archive/1.8.2.tar.gz'
    -- [download 100% complete]
    ios_sim: /.../Hunter/_Base/7912489/9ec2ff8/c018e63/Install/ios-sim

Default behavior
================

Note that such CMake variables like:

* `CMAKE_{C,CXX}_FLAGS <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`_
* `CMAKE_{C,CXX}_COMPILER <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_LANG_FLAGS.html>`_
* `CMAKE_CONFIGURATION_TYPES <http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_CONFIGURATION_TYPES.html>`_
* `BUILD_SHARED_LIBS <http://www.cmake.org/cmake/help/v3.2/variable/BUILD_SHARED_LIBS.html>`_

must be checked manually for each custom build scheme (see :ref:`cmake-simple`).
