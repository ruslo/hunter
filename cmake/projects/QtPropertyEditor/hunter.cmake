# Copyright (c) 2016-2018, Ruslan Baratov
# All rights reserved.

# !!! DO NOT PLACE HEADER GUARDS HERE !!!

include(hunter_add_version)
include(hunter_cacheable)
include(hunter_download)
include(hunter_pick_scheme)

hunter_add_version(
    PACKAGE_NAME
    QtPropertyEditor
    VERSION
    2.1.3-p0
    URL
    "https://github.com/hunter-packages/QtPropertyEditor/archive/v2.1.3-p0.tar.gz"
    SHA1
    e566457c8f44cbb00d3001d659ed4e164ea57fdf
)

hunter_pick_scheme(DEFAULT url_sha1_cmake)
hunter_cacheable(QtPropertyEditor)
hunter_download(PACKAGE_NAME QtPropertyEditor)
