# Copyright (c) 2016-2017, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    SFML
    VERSION
    2.4.2
    URL
    "https://github.com/SFML/SFML/archive/2.4.2.tar.gz"
    SHA1
	275C68B51B8509BA90EDA6D5DEF791B497F1F777
)

hunter_cmake_args(
    SFML
    CMAKE_ARGS
        SFML_BUILD_AUDIO=NO
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(SFML)
hunter_download(PACKAGE_NAME SFML)
