# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_configuration_types)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    readline
    VERSION
    "6.3"
    URL
    "https://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz"
    SHA1
    017b92dc7fd4e636a2b5c9265a77ccc05798c9e1
)

hunter_configuration_types(readline CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT url_sha1_autotools)
hunter_cmake_args(
    readline
    CMAKE_ARGS
      DEPENDS_ON_PACKAGES=ncursesw
)
hunter_cacheable(readline)
hunter_download(
    PACKAGE_NAME readline
)

