# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)
include(hunter_cmake_args)

hunter_add_version(
    PACKAGE_NAME
    cmcstl2
    VERSION
    0.0.0-bee0705e99
    URL
    "https://github.com/CaseyCarter/cmcstl2/archive/bee0705e9925dfac430cbf3097f82cca2a7de659.zip"
    SHA1
    db38fedd3380137284c4d3570e65f1984597628e
)

hunter_cmake_args(
    cmcstl2
    CMAKE_ARGS
    STL2_BUILD_EXAMPLES=OFF
    STL2_BUILD_TESTING=OFF
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(cmcstl2)
hunter_download(PACKAGE_NAME cmcstl2)

