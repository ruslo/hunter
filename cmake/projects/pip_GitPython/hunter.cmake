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
    pip_GitPython
    VERSION
    2.1.11
    URL
    "https://github.com/gitpython-developers/GitPython/archive/2.1.11.tar.gz"
    SHA1
    c0a1515a29b3f64c6745ea2d2dedd3a43ac19678
)

hunter_cmake_args(
    pip_GitPython
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=pip_gitdb
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_GitPython)
hunter_download(PACKAGE_NAME pip_GitPython)
