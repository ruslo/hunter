# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_configuration_types)
include(hunter_pick_scheme)
include(hunter_download)

hunter_add_version(
    PACKAGE_NAME
    OpenBLAS
    VERSION
    0.2.19-p0
    URL
    "https://github.com/hunter-packages/OpenBLAS/archive/v0.2.19-p0.tar.gz"
    SHA1
    0d5ea6760304a2f76185e4e81959c0b2eb5bbc35
)

hunter_configuration_types(OpenBLAS CONFIGURATION_TYPES Release)
hunter_pick_scheme(DEFAULT OpenBLAS)
hunter_cacheable(OpenBLAS)
hunter_download(
    PACKAGE_NAME OpenBLAS
    PACKAGE_UNRELOCATABLE_TEXT_FILES
    "lib/cmake/openblas/OpenBLASConfig.cmake"
)
