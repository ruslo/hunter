# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

if(DEFINED HUNTER_CMAKE_PROJECTS_BOOST_HUNTER_CMAKE)
  return()
else()
  set(HUNTER_CMAKE_PROJECTS_BOOST_HUNTER_CMAKE 1)
endif()

include(hunter_add_version)
include(hunter_add_version_start)
include(hunter_download)
include(hunter_pick_scheme)

# Disable searching in locations not specified by these hint variables.
set(Boost_NO_SYSTEM_PATHS ON)

hunter_add_version_start(Boost)

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

hunter_pick_scheme(DEFAULT url_sha1_boost)
hunter_download(PACKAGE_NAME Boost)
