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
    pip_pylint
    VERSION
    2.3.1
    URL
    "https://github.com/PyCQA/pylint/archive/pylint-2.3.1.tar.gz"
    SHA1
    9dc2b3825611baeca43d3601f36841aa8cb7ef60
)

hunter_cmake_args(
    pip_pylint
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=pip_astroid
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_pylint)
hunter_download(PACKAGE_NAME pip_pylint)
