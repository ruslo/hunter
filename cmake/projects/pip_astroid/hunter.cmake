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
    pip_astroid
    VERSION
    2.2.5
    URL
    "https://github.com/PyCQA/astroid/archive/astroid-2.2.5.tar.gz"
    SHA1
    d6316f6e6363305aae4643679cb8b07ef9c94451
)

set(
    __hunter_astroid_deps
    pip_lazy-object-proxy
    pip_wrapt
    pip_six
)

hunter_cmake_args(
    pip_astroid
    CMAKE_ARGS
    DEPENDS_ON_PACKAGES=${__hunter_astroid_deps}
)

hunter_pick_scheme(DEFAULT url_sha1_pip)
hunter_cacheable(pip_astroid)
hunter_download(PACKAGE_NAME pip_astroid)
