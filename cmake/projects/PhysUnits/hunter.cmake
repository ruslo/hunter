# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    PhysUnits
    VERSION
    1.1.0-p0
    URL
    "https://github.com/martinmoene/PhysUnits-CT-Cpp11/archive/12eafc669d0710b02536dcd8d2f96ae6bc69601b.tar.gz"
    SHA1
    14064acf4a04c08150ca9749e0e52b6bb8ee9cbc
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(PhysUnits)
hunter_download(PACKAGE_NAME PhysUnits)
