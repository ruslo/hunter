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
    arabica
    VERSION
    0.0.0-a202766-p0
    URL
    "https://github.com/hunter-packages/arabica/archive/v0.0.0-a202766-p0.tar.gz"
    SHA1
    b922f397223d54f7e6c646a862b3b4d93b0b9227
)

hunter_cmake_args(
    arabica
    CMAKE_ARGS
        BUILD_ARABICA_EXAMPLES=OFF
        ARABICA_XML_BACKEND=USE_EXPAT
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(arabica)
hunter_download(PACKAGE_NAME arabica)
