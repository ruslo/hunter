# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_BOOST_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_BOOST_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

# Disable searching in locations not specified by these hint variables.
set(Boost_NO_SYSTEM_PATHS ON)

# Version without tests and docs
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.58.0-p1"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.58.0-p1.tar.gz"
    SHA1
    bc417f98b644f244121c0eb47e810b4c6a6277e8
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.58.0-p0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.58.0-p0.tar.gz"
    SHA1
    0c3a2f284e85a61e2d2ccc1a6fdc8dc7a443ef67
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.58.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.58.0/boost_1_58_0.tar.bz2/download"
    SHA1
    2fc96c1651ac6fe9859b678b165bd78dc211e881
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.57.0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.57.0.tar.gz"
    SHA1
    9305649224848860664893342ac29709ebcf42f9
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.56.0"
    URL
    "https://github.com/hunter-packages/boost/archive/v1.56.0.tar.gz"
    SHA1
    08a45c69e90e5ddc485b770a573dbace8e48932e
)

# Remove docs and tests
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0-patched-3"
    URL
    "https://github.com/hunter-packages/boost/archive/1.55.0-patched-3.tar.gz"
    SHA1
    4ae01023ac0dc68570fd1bbcf67cbcd839df04eb
)

# Apply fix for: https://svn.boost.org/trac/boost/ticket/9332
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0-patched-2"
    URL
    "http://sourceforge.net/projects/hunter-packages/files/boost_1_55_0-patched-2.tar.bz2/download"
    SHA1
    38c0523dbd27ed6b363ad9255548e942d404b39e
)

# Workaround for: https://svn.boost.org/trac/boost/ticket/9610
# http://boost.2283326.n4.nabble.com/config-clang-int128-support-td4653826.html
hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0-patched"
    URL
    "http://sourceforge.net/projects/hunter-packages/files/boost_1_55_0-patched.tar.bz2/download"
    SHA1
    308adf99dbdf0668c9695ff1da075a9e3b71be9d
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.55.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.bz2/download"
    SHA1
    cef9a0cc7084b1d639e06cd3bc34e4251524c840
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.54.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.54.0/boost_1_54_0.tar.bz2/download"
    SHA1
    230782c7219882d0fab5f1effbe86edb85238bf4
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.53.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.53.0/boost_1_53_0.tar.bz2/download"
    SHA1
    e6dd1b62ceed0a51add3dda6f3fc3ce0f636a7f3
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.52.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.52.0/boost_1_52_0.tar.bz2/download"
    SHA1
    cddd6b4526a09152ddc5db856463eaa1dc29c5d9
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.51.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.51.0/boost_1_51_0.tar.bz2/download"
    SHA1
    52ef06895b97cc9981b8abf1997c375ca79f30c5
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.50.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.50.0/boost_1_50_0.tar.bz2/download"
    SHA1
    ee06f89ed472cf369573f8acf9819fbc7173344e
)

hunter_add_version(
    PACKAGE_NAME
    Boost
    VERSION
    "1.49.0"
    URL
    "http://sourceforge.net/projects/boost/files/boost/1.49.0/boost_1_49_0.tar.bz2/download"
    SHA1
    26a52840e9d12f829e3008589abf0a925ce88524
)

hunter_pick_scheme(DEFAULT url_sha1_boost)
hunter_cacheable(Boost)
hunter_download(PACKAGE_NAME Boost PACKAGE_INTERNAL_DEPS_ID "1")
