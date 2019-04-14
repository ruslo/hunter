# Copyright (c) 2016-2019, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    pip_gitdb
    VERSION
    2.0.5
    URL
    "https://github.com/gitpython-developers/gitdb/archive/2.0.5.tar.gz"
    SHA1
    e4d8f36d4d3c8c57d2decb05909ebea8e53c807f
)

hunter_cmake_args(
    pip_gitdb
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=pip_smmap
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_gitdb)
hunter_download(PACKAGE_NAME pip_gitdb)
