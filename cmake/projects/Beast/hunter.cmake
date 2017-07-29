# Copyright (c) 2015, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_cmake_args)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    Beast
    VERSION
    "1.0.0-b84-hunter-0"
    URL
    "https://github.com/hunter-packages/Beast/archive/v1.0.0-b84-hunter-0.tar.gz"
    SHA1
    4268caa6c044fc8180d36d918aa731ffa931380d
)

hunter_add_version(
    PACKAGE_NAME
    Beast
    VERSION
    "1.0.0-b32-hunter-4"
    URL
    "https://github.com/hunter-packages/Beast/archive/v1.0.0-b32-hunter-4.tar.gz"
    SHA1
    469ff269b5c437255b8392a6bcee829c07d59ce7
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(Beast)
hunter_download(PACKAGE_NAME Beast)
