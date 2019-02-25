# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)


hunter_add_version(
    PACKAGE_NAME
    binaryen
    VERSION
    1.38.28-p0
    URL
    "https://github.com/Warchant/binaryen/archive/feature/hunter.zip"
    SHA1
    e34a32691eef432a87bdf63d3ca68e2669d04b21
)

hunter_cmake_args(
    binaryen
    CMAKE_ARGS
        BUILD_STATIC_LIB=ON 
        BUILD_TOOLS=OFF     # we don't want to build executables by default
        ENABLE_WERROR=OFF   # some new compilers (g++-{7,8}) produce warnings so build may fail. we explicitly disable -Werror
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(binaryen)
hunter_download(PACKAGE_NAME binaryen)
