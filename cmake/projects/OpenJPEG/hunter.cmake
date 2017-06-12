# Copyright (c) 2016, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    OpenJPEG
    VERSION
    "2.1.2"
    URL
    "https://github.com/uclouvain/openjpeg/archive/v2.1.2.tar.gz"
    SHA1
    c8671e7f577fdc58abde1e1f32b10d372e6f9b07
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(OpenJPEG)
hunter_download(PACKAGE_NAME OpenJPEG)
